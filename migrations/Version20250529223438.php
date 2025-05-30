<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250529223438 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Creates game_average_ratings view';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('
            CREATE OR REPLACE VIEW game_average_ratings AS
            SELECT 
                g.*,
                IFNULL((
                    SELECT AVG(user_avg)
                    FROM (
                        SELECT AVG(r2.rating) AS user_avg
                        FROM review r2
                        WHERE r2.game_id = g.id
                        GROUP BY r2.user_id
                    ) AS user_avgs
                ), 0) AS average_rating,
                (
                    SELECT COUNT(DISTINCT r3.user_id)
                    FROM review r3
                    WHERE r3.game_id = g.id
                ) AS rating_user_count
            FROM game g
        ');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP VIEW game_average_ratings');
    }
}