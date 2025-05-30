<?php

namespace App\Controller;

use App\Repository\GameAverageRatingsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SearchController extends AbstractController
{
    #[Route('/search', name: 'app_search')]
    public function index(Request $request, GameAverageRatingsRepository $gameAverageRatingRepository): Response
    {
        $page = $request->query->getInt('page', 1);
        $limit = 9;
        $query = $request->query->get('query', '');
        $minPrice = (float)$request->query->get('minPrice', 0);
        $maxPrice = (float)$request->query->get('maxPrice', 100);
        $minRating = (int)$request->query->get('minRating', 0);
        $sort = $request->query->get('sort', 'newest');

        // Get paginated results
        $games = $gameAverageRatingRepository->search(
            $query,
            $minPrice,
            $maxPrice,
            $minRating,
            $sort,
            $page,
            $limit // items per page
        );

        $totalGames = $gameAverageRatingRepository->countSearchResults(
            $query,
            $minPrice,
            $maxPrice,
            $minRating
        );
        $maxPage = ceil($totalGames / $limit);

        // AJAX request returns JSON
        if ($request->isXmlHttpRequest()) {
            return $this->json([
                'html' => $this->renderView('search/nextPage.html.twig', [
                    'games' => $games,
                ]),
                'nextPage' => $page + 1,
                'maxPage' => $maxPage,
            ]);
        }

        // Normal request returns full page
        return $this->render('search/index.html.twig', [
            'games' => $games,
            'nextPage' => $page + 1,
            'maxPage' => $maxPage,
            'query' => $query,
            'minPrice' => $minPrice,
            'maxPrice' => $maxPrice,
            'minRating' => $minRating,
            'sort' => $sort,
        ]);
    }
}
