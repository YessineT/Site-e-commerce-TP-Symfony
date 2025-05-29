import requests
import mysql.connector
import os
from datetime import datetime
from urllib.parse import urlparse
import json
import hashlib

# Configuration
API_KEY = "58cc630439a8a8a9e0a02faa184638666c2de169"
DB_CONFIG = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'Abc123987456',
    'database': 'games',
    'auth_plugin': 'mysql_native_password'
}
IMAGE_DIR = 'public/uploads/games/'
USER_AGENT = "GameLibraryImporter/1.0"

def setup_database():
    """Initialize database connection and verify tables exist"""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        # Verify required tables exist
        cursor.execute("SHOW TABLES LIKE 'game'")
        if not cursor.fetchone():
            raise Exception("Game table not found in database")
            
        cursor.close()
        conn.close()
        return True
    except Exception as e:
        print(f"Database setup error: {e}")
        return False

def download_image(url, game_id):
    """Download game image and return relative path"""
    if not url:
        return None
        
    if not os.path.exists(IMAGE_DIR):
        os.makedirs(IMAGE_DIR)
    
    try:
        ext = os.path.splitext(urlparse(url).path)[1] or '.jpg'
        filename = f"game_{game_id}_{hashlib.md5(url.encode()).hexdigest()}{ext}"
        filepath = os.path.join(IMAGE_DIR, filename)
        
        response = requests.get(url, stream=True, timeout=10)
        response.raise_for_status()
        
        with open(filepath, 'wb') as f:
            for chunk in response.iter_content(1024):
                f.write(chunk)
        
        return filename  # Return relative path
    except Exception as e:
        print(f"Image download failed: {e}")
        return None

def get_or_create_developer(conn, name):
    """Get or create developer and return ID"""
    cursor = conn.cursor()
    try:
        # Create slug from name
        slug = name.lower().replace(' ', '-').replace(':', '')
        
        cursor.execute(
            "SELECT id FROM developer WHERE name = %s",
            (name,)
        )
        result = cursor.fetchone()
        
        if result:
            return result[0]
        else:
            cursor.execute(
                "INSERT INTO developer (name, slug) VALUES (%s, %s)",
                (name, slug)
            )
            conn.commit()
            return cursor.lastrowid
    finally:
        cursor.close()

def get_or_create_publisher(conn, name):
    """Get or create publisher and return ID"""
    cursor = conn.cursor()
    try:
        # Create slug from name
        slug = name.lower().replace(' ', '-').replace(':', '')
        
        cursor.execute(
            "SELECT id FROM publisher WHERE name = %s",
            (name,)
        )
        result = cursor.fetchone()
        
        if result:
            return result[0]
        else:
            cursor.execute(
                "INSERT INTO publisher (name, slug) VALUES (%s, %s)",
                (name, slug)
            )
            conn.commit()
            return cursor.lastrowid
    finally:
        cursor.close()

def get_or_create_genre(conn, name):
    """Get or create genre and return ID"""
    cursor = conn.cursor()
    try:
        # Create slug from name
        slug = name.lower().replace(' ', '-').replace(':', '')
        
        cursor.execute(
            "SELECT id FROM genre WHERE name = %s",
            (name,)
        )
        result = cursor.fetchone()
        
        if result:
            return result[0]
        else:
            cursor.execute(
                "INSERT INTO genre (name, slug) VALUES (%s, %s)",
                (name, slug)
            )
            conn.commit()
            return cursor.lastrowid
    finally:
        cursor.close()

def get_or_create_platform(conn, name):
    """Get or create platform and return ID"""
    cursor = conn.cursor()
    try:
        # Create slug from name
        slug = name.lower().replace(' ', '-').replace(':', '')
        
        cursor.execute(
            "SELECT id FROM platform WHERE name = %s",
            (name,)
        )
        result = cursor.fetchone()
        
        if result:
            return result[0]
        else:
            cursor.execute(
                "INSERT INTO platform (name, slug) VALUES (%s, %s)",
                (name, slug)
            )
            conn.commit()
            return cursor.lastrowid
    finally:
        cursor.close()

def import_games():
    """Main function to import games from Giant Bomb API (PC/Xbox/PS5 only)"""
    if not setup_database():
        return

    # Giant Bomb platform IDs for our target platforms
    PLATFORM_FILTER = {
        'PC': '94',
        'PlayStation 5': '146',
        'Xbox Series X|S': '145'
    }

    headers = {'User-Agent': USER_AGENT}
    params = {
        'api_key': API_KEY,
        'format': 'json',
        'limit': 400,
        'field_list': 'id,name,original_release_date',
        'filter': f"platforms:{'|'.join(PLATFORM_FILTER.values())}",
        'sort': 'original_release_date:desc',
    }

    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        print(f"Starting import for platforms: {', '.join(PLATFORM_FILTER.keys())}...")
        response = requests.get(
            "https://www.giantbomb.com/api/games/",
            headers=headers,
            params=params,
            timeout=15
        )
        response.raise_for_status()

        data = response.json()

        for game in data.get('results', []):
            game_id = game['id']
            title = game['name']

            # Check if game already exists
            cursor.execute("SELECT id FROM game WHERE title = %s", (title,))
            if cursor.fetchone():
                print(f"Skipping existing game: {title}")
                continue

            # Verify platforms (additional client-side filtering)
            game_platforms = [p['name'] for p in game.get('platforms', [])]
            valid_platforms = [p for p in game_platforms if p in PLATFORM_FILTER.keys()]

            if not valid_platforms:
                print(f"Skipping {title} - not available on target platforms")
                continue

            # Process game info
            slug = title.lower().replace(' ', '-').replace(':', '')
            description = game.get('description') or ''
            short_desc = game.get('deck') or ''
            release_date = game.get('original_release_date')
            image_url = game.get('image', {}).get('original_url')

            # Download image
            thumbnail = download_image(image_url, game_id) if image_url else None

            # Process developers
            developer_id = None
            if game.get('developers'):
                first_dev = game['developers'][0].get('name')
                if first_dev:
                    developer_id = get_or_create_developer(conn, first_dev)
            if(developer_id is None):
                developer_id = 1

            # Process publishers
            publisher_id = None
            if game.get('publishers'):
                first_pub = game['publishers'][0].get('name')
                if first_pub:
                    publisher_id = get_or_create_publisher(conn, first_pub)
            if(publisher_id is None):
                publisher_id = 1

            # Process primary genre
            genre_id = None
            if game.get('genres'):
                first_genre = game['genres'][0].get('name')
                if first_genre:
                    genre_id = get_or_create_genre(conn, first_genre)
            if(genre_id is None):
                genre_id = 1

            # Insert game
            cursor.execute("""
                INSERT INTO game (
                    title, slug, description, short_description,
                    release_date, thumbnail, developer_id, publisher_id, genre_id,
                    price, is_free, min_os, min_processor, min_memory,
                    min_graphics, min_storage, rec_os, rec_processor,
                    rec_memory, rec_graphics, rec_storage
                ) VALUES (
                    %s, %s, %s, %s, %s, %s, %s, %s, %s,
                    %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
                )
            """, (
                title, slug, description, short_desc,
                datetime.strptime(release_date, '%Y-%m-%d %H:%M:%S') if release_date else None,
                thumbnail, developer_id, publisher_id, genre_id,
                0.00, 0,  # Default price and not free
                'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB',  # Default minimum specs
                'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB'  # Default recommended specs
            ))

            db_game_id = cursor.lastrowid

            # Process platforms (only our filtered ones)
            for platform_name in valid_platforms:
                platform_id = get_or_create_platform(conn, platform_name)
                cursor.execute("""
                    INSERT IGNORE INTO game_platform (game_id, platform_id)
                    VALUES (%s, %s)
                """, (db_game_id, platform_id))

            # Process additional genres
            if game.get('genres') and len(game['genres']) > 1:
                for genre in game['genres'][1:]:  # Skip first genre already used
                    genre_name = genre.get('name')
                    if genre_name:
                        genre_id = get_or_create_genre(conn, genre_name)
                        cursor.execute("""
                            INSERT IGNORE INTO game_genres (game_id, genre_id)
                            VALUES (%s, %s)
                        """, (db_game_id, genre_id))

            conn.commit()
            print(f"Imported: {title} (Platforms: {', '.join(valid_platforms)})")

            # Respect API rate limits
            time.sleep(1)

        print("Game import completed successfully!")

    except Exception as e:
        print(f"Error during import: {e}")
        if 'conn' in locals():
            conn.rollback()
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    import time
    import_games()