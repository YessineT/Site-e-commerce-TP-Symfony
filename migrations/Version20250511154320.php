<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250511154320 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE game ADD CONSTRAINT FK_232B318C1AD5CDBF FOREIGN KEY (cart_id) REFERENCES cart (id)
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_232B318C1AD5CDBF ON game (cart_id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game RENAME INDEX fk_232b318c4296d31f TO IDX_232B318C4296D31F
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE game DROP FOREIGN KEY FK_232B318C1AD5CDBF
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_232B318C1AD5CDBF ON game
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE game RENAME INDEX idx_232b318c4296d31f TO FK_232B318C4296D31F
        SQL);
    }
}
