<?php

namespace App\Controller;

use App\Form\GameFilterForm;
use App\Repository\GameRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class StoreController extends AbstractController
{
    // src/Controller/StoreController.php

    #[Route('/store', name: 'app_store')]
    public function index(Request $request, GameRepository $gameRepository)
    {
        $page = $request->query->getInt('page', 1);
        $limit = 9; // Number of items per page

        $games = $gameRepository->findPaginated($page, $limit);
        $totalGames = $gameRepository->count([]);
        $maxPage = ceil($totalGames / $limit);

        if ($request->isXmlHttpRequest()) {
            // AJAX request - return JSON
            $html = $this->renderView('store/nextPage.html.twig', [
                'games' => $games
            ]);

            return new JsonResponse([
                'html' => $html,
                'nextPage' => $page + 1,
                'maxPage' => $maxPage,
            ]);
        }

        return $this->render('store/index.html.twig', [
            'games' => $games,
            'nextPage' => $page + 1,
            'maxPage' => $maxPage,
        ]);
    }

    #[Route('/store/{id}', name: 'app_store_show')]
    public function product(): Response
    {
        return $this->render('store/show.html.twig', []);
    }
}
