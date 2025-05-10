<?php

namespace App\DataFixtures;

use App\Entity\Game;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use App\Entity\Developer;

class GameFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();

        $developer = new Developer();
        $developer->setName($faker->company());
        $manager->persist($developer);

        $title = 'Test Game';
        $slug = 'test-game';
        $game = new Game();
        $game->setTitle($title);
        $game->setSlug($slug);
        $game->setDescription($faker->paragraph(2));
        $game->setPrice($faker->randomFloat(2, 5, 100));  // Random price between 5 and 100
        $game->setReleaseDate($faker->dateTimeThisCentury());  // Random release date
        $game->setMinOs('Windows 10');
        $game->setMinProcessor('Intel i5');
        $game->setMinMemory('8 GB');
        $game->setMinGraphics('NVIDIA GTX 1050');
        $game->setMinStorage('500 GB');
        $game->setRecOs('Windows 11');
        $game->setRecProcessor('Intel i7');
        $game->setRecMemory('16 GB');
        $game->setRecGraphics('NVIDIA RTX 3060');
        $game->setRecStorage('1 TB');

        $game->setDeveloper($developer);

        $manager->persist($game);
        $manager->flush();
    }
}
