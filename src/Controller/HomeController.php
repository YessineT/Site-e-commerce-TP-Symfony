<?php

namespace App\Controller;

use App\Repository\NewsRepository;
use App\Repository\GameRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/home', name: 'app_home')]
    public function index(GameRepository $gameRepository, NewsRepository $newsRepository): Response
    {
        $featuredGames = $gameRepository->findPopularGames(6);

        // Get newest releases
        $newReleases = $gameRepository->findBy(
            [],
            ['releaseDate' => 'DESC'],
            4
        );

        // Get limited free games
        $freeGamesLimited = $gameRepository->findFreeUntilGames(3);

        // Get free games
        $freeGames = $gameRepository->findFreeGames(3);

        $latestNews = $newsRepository->findBy([], ['createdAt' => 'DESC'], 3);

        return $this->render('home/index.html.twig', [
            'featuredGames' => $featuredGames,
            'newReleases' => $newReleases,
            'freeGamesLimited' => $freeGamesLimited,
            'freeGames' => $freeGames,
            'latestNews' => $latestNews,
        ]);
    }
}
