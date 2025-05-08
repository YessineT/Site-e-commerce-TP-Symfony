<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250508085703 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE game CHANGE release_date release_date DATETIME DEFAULT CURRENT_TIMESTAMP, CHANGE free_until free_until DATETIME DEFAULT NULL, CHANGE submitted_at submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE game CHANGE release_date release_date DATE NOT NULL, CHANGE free_until free_until DATE DEFAULT NULL, CHANGE submitted_at submitted_at DATETIME NOT NULL
        SQL);
    }
}
