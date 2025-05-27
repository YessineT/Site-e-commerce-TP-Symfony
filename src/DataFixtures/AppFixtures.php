<?php

namespace App\DataFixtures;

use App\Entity\Genre;
use App\Entity\News;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $genre = new Genre();
        $genre->setName('Action');
        $genre->setSlug('action');
        $manager->persist($genre);

        for ($i = 1; $i <= 6; $i++) {
            $news = new News();
            $news->setTitle("News $i");
            $news->setSlug("news-$i");
            $news->setSummary("This is the summary of news item $i");
            $news->setImage("news_$i.jpg");
            $news->setCreatedAt(new \DateTimeImmutable());
            $news->setGenre($genre);
            $manager->persist($news);
        }

        $manager->flush();
    }
}
