import mysql.connector
import random
import requests
from bs4 import BeautifulSoup

# ─────────────────────────────────────────────────────────────────────────────
# CONFIGURATION
# ─────────────────────────────────────────────────────────────────────────────
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Abc123987456',
    'database': 'games1',
}
HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
}

# ─────────────────────────────────────────────────────────────────────────────
# HELPERS
# ─────────────────────────────────────────────────────────────────────────────
def get_steam_price(game_name: str) -> float | None:
    """Try to get price from Steam Storefront API. Returns price in USD or None."""
    try:
        # 1) Search for appid
        search = requests.get(
            "https://store.steampowered.com/api/storesearch/",
            params={'term': game_name, 'l': 'en', 'cc': 'us'},
            headers=HEADERS, timeout=5
        ).json()

        items = search.get('items', [])
        if not items:
            return None

        # pick best match by partial name
        name_l = game_name.lower()
        appid = None
        for it in items:
            if name_l in it['name'].lower():
                appid = it['id']
                break
        if appid is None:
            appid = items[0]['id']

        # 2) Get details
        details = requests.get(
            "https://store.steampowered.com/api/appdetails",
            params={'appids': appid, 'l': 'en', 'cc': 'us'},
            headers=HEADERS, timeout=5
        ).json().get(str(appid), {})

        data = details.get('data', {})
        if data.get('is_free'):
            return 0.0
        po = data.get('price_overview')
        if po and 'final' in po:
            return po['final'] / 100.0
    except Exception:
        pass

    return None

def get_eneba_price(game_name: str) -> float | None:
    """Scrape the first result price from Eneba search. Returns USD or None."""
    try:
        url = f"https://www.eneba.com/store/search?text={requests.utils.quote(game_name)}&currency=USD"
        resp = requests.get(url, headers=HEADERS, timeout=5)
        soup = BeautifulSoup(resp.text, 'html.parser')

        # look for the first price tag in search results
        card = soup.select_one(".product-card") or soup.select_one(".seller-offer")
        if not card:
            return None

        # Eneba shows price in something like <div class="price ...">$12.34</div>
        price_el = card.select_one(".price") or card.select_one(".product-card__price")
        if not price_el:
            return None

        text = price_el.get_text(strip=True).replace("$", "").replace(",", "")
        return float(text)
    except Exception:
        return None

# ─────────────────────────────────────────────────────────────────────────────
# MAIN
# ─────────────────────────────────────────────────────────────────────────────
def set_prices():
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()
    cursor.execute("SELECT id, title, price FROM game")
    games = cursor.fetchall()

    for game_id, title, old_price in games:
        price = get_steam_price(title)
        source = "Steam"

        if price is None:
            price = get_eneba_price(title)
            source = "Eneba"

        if price is None:
            # final fallback: random
            price = round(random.uniform(0, 60), 2)
            source = "Random"

        is_free = (price == 0.0)
        if old_price != price:
            cursor.execute(
                "UPDATE game SET price = %s, is_free = %s WHERE id = %s",
                (price, is_free, game_id)
            )
            print(f"[{source}] '{title}' → {price:.2f}")
        else:
            print(f"[{source}] '{title}' unchanged ({price:.2f})")

    conn.commit()
    cursor.close()
    conn.close()
    print("Done updating prices.")

if __name__ == "__main__":
    set_prices()
