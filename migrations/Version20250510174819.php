<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250510174819 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE `admin` (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_IDENTIFIER_EMAIL (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE cart (id INT AUTO_INCREMENT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME DEFAULT NULL, user_id INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE cart_item (id INT AUTO_INCREMENT NOT NULL, game_id INT NOT NULL, user_id INT NOT NULL, quantity INT NOT NULL, INDEX IDX_F0FE2527E48FD905 (game_id), INDEX IDX_F0FE2527A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE developer (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, description LONGTEXT DEFAULT NULL, logo VARCHAR(255) DEFAULT NULL, website VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE download (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, game_id INT NOT NULL, downloaded_at DATETIME NOT NULL, progress DOUBLE PRECISION DEFAULT NULL, is_installed TINYINT(1) NOT NULL, hours_played DOUBLE PRECISION NOT NULL, INDEX IDX_781A8270A76ED395 (user_id), INDEX IDX_781A8270E48FD905 (game_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE game (id INT AUTO_INCREMENT NOT NULL, developer_id INT NOT NULL, publisher_id INT DEFAULT NULL, genre_id INT NOT NULL, title VARCHAR(255) NOT NULL, slug VARCHAR(255) DEFAULT NULL, description LONGTEXT NOT NULL, short_description LONGTEXT DEFAULT NULL, price NUMERIC(10, 2) NOT NULL, release_date DATETIME DEFAULT CURRENT_TIMESTAMP, is_free TINYINT(1) NOT NULL, free_until DATETIME DEFAULT NULL, thumbnail VARCHAR(255) DEFAULT NULL, min_os VARCHAR(255) NOT NULL, min_processor VARCHAR(255) NOT NULL, min_memory VARCHAR(255) NOT NULL, min_graphics VARCHAR(255) NOT NULL, min_storage VARCHAR(255) NOT NULL, rec_os VARCHAR(255) NOT NULL, rec_processor VARCHAR(255) NOT NULL, rec_memory VARCHAR(255) NOT NULL, rec_graphics VARCHAR(255) NOT NULL, rec_storage VARCHAR(255) NOT NULL, updated_at DATETIME DEFAULT NULL, UNIQUE INDEX UNIQ_232B318C989D9B62 (slug), INDEX IDX_232B318C64DD9267 (developer_id), INDEX IDX_232B318C40C86FCE (publisher_id), INDEX IDX_232B318C4296D31F (genre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE game_platform (game_id INT NOT NULL, platform_id INT NOT NULL, INDEX IDX_92162FEDE48FD905 (game_id), INDEX IDX_92162FEDFFE6496F (platform_id), PRIMARY KEY(game_id, platform_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE genre (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE orders (id INT AUTO_INCREMENT NOT NULL, total_price DOUBLE PRECISION NOT NULL, status VARCHAR(255) NOT NULL, order_date DATETIME NOT NULL, payment_id INT NOT NULL, user_id INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE payment (id INT AUTO_INCREMENT NOT NULL, order_id INT NOT NULL, user_id INT NOT NULL, amount DOUBLE PRECISION NOT NULL, provider VARCHAR(255) NOT NULL, status VARCHAR(255) NOT NULL, payment_date DATE NOT NULL, INDEX IDX_6D28840D8D9F6D38 (order_id), INDEX IDX_6D28840DA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE platform (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, icon VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE publisher (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE review (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, game_id INT NOT NULL, rating SMALLINT NOT NULL, comment LONGTEXT DEFAULT NULL, created_at DATETIME NOT NULL, INDEX IDX_794381C6A76ED395 (user_id), INDEX IDX_794381C6E48FD905 (game_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE screenshot (id INT AUTO_INCREMENT NOT NULL, game_id INT NOT NULL, image VARCHAR(255) NOT NULL, uploaded_at DATETIME NOT NULL, INDEX IDX_58991E41E48FD905 (game_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, username VARCHAR(255) NOT NULL, first_name VARCHAR(255) DEFAULT NULL, last_name VARCHAR(255) DEFAULT NULL, avatar VARCHAR(255) DEFAULT NULL, bio LONGTEXT DEFAULT NULL, phone VARCHAR(20) DEFAULT NULL, created_at DATETIME NOT NULL, last_login DATETIME DEFAULT NULL, is_verified TINYINT(1) NOT NULL, updated_at DATETIME DEFAULT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE user_game (user_id INT NOT NULL, game_id INT NOT NULL, INDEX IDX_59AA7D45A76ED395 (user_id), INDEX IDX_59AA7D45E48FD905 (game_id), PRIMARY KEY(user_id, game_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE wishlist (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, game_id INT NOT NULL, added_at DATETIME NOT NULL, INDEX IDX_9CE12A31A76ED395 (user_id), INDEX IDX_9CE12A31E48FD905 (game_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)', available_at DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)', delivered_at DATETIME DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE cart_item ADD CONSTRAINT FK_F0FE2527E48FD905 FOREIGN KEY (game_id) REFERENCES game (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE cart_item ADD CONSTRAINT FK_F0FE2527A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE download ADD CONSTRAINT FK_781A8270A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE download ADD CONSTRAINT FK_781A8270E48FD905 FOREIGN KEY (game_id) REFERENCES game (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game ADD CONSTRAINT FK_232B318C64DD9267 FOREIGN KEY (developer_id) REFERENCES developer (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game ADD CONSTRAINT FK_232B318C40C86FCE FOREIGN KEY (publisher_id) REFERENCES publisher (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game ADD CONSTRAINT FK_232B318C4296D31F FOREIGN KEY (genre_id) REFERENCES genre (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game_platform ADD CONSTRAINT FK_92162FEDE48FD905 FOREIGN KEY (game_id) REFERENCES game (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game_platform ADD CONSTRAINT FK_92162FEDFFE6496F FOREIGN KEY (platform_id) REFERENCES platform (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE payment ADD CONSTRAINT FK_6D28840D8D9F6D38 FOREIGN KEY (order_id) REFERENCES orders (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE payment ADD CONSTRAINT FK_6D28840DA76ED395 FOREIGN KEY (user_id) REFERENCES user (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE review ADD CONSTRAINT FK_794381C6A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE review ADD CONSTRAINT FK_794381C6E48FD905 FOREIGN KEY (game_id) REFERENCES game (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE screenshot ADD CONSTRAINT FK_58991E41E48FD905 FOREIGN KEY (game_id) REFERENCES game (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_game ADD CONSTRAINT FK_59AA7D45A76ED395 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_game ADD CONSTRAINT FK_59AA7D45E48FD905 FOREIGN KEY (game_id) REFERENCES game (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE wishlist ADD CONSTRAINT FK_9CE12A31A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE wishlist ADD CONSTRAINT FK_9CE12A31E48FD905 FOREIGN KEY (game_id) REFERENCES game (id)
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE cart_item DROP FOREIGN KEY FK_F0FE2527E48FD905
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE cart_item DROP FOREIGN KEY FK_F0FE2527A76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE download DROP FOREIGN KEY FK_781A8270A76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE download DROP FOREIGN KEY FK_781A8270E48FD905
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game DROP FOREIGN KEY FK_232B318C64DD9267
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game DROP FOREIGN KEY FK_232B318C40C86FCE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game DROP FOREIGN KEY FK_232B318C4296D31F
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game_platform DROP FOREIGN KEY FK_92162FEDE48FD905
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game_platform DROP FOREIGN KEY FK_92162FEDFFE6496F
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE payment DROP FOREIGN KEY FK_6D28840D8D9F6D38
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE payment DROP FOREIGN KEY FK_6D28840DA76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE review DROP FOREIGN KEY FK_794381C6A76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE review DROP FOREIGN KEY FK_794381C6E48FD905
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE screenshot DROP FOREIGN KEY FK_58991E41E48FD905
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_game DROP FOREIGN KEY FK_59AA7D45A76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_game DROP FOREIGN KEY FK_59AA7D45E48FD905
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE wishlist DROP FOREIGN KEY FK_9CE12A31A76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE wishlist DROP FOREIGN KEY FK_9CE12A31E48FD905
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE `admin`
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE cart
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE cart_item
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE developer
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE download
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE game
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE game_platform
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE genre
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE orders
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE payment
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE platform
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE publisher
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE review
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE screenshot
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE user
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE user_game
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE wishlist
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE messenger_messages
        SQL);
    }
}
