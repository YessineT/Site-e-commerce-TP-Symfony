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
    public function index(Request $request, GameRepository $gameRepository): Response
    {
        $page = $request->query->getInt('page', 1);
        $limit = 9; // Number of items per page

        $games = $gameRepository->findPaginated($page, $limit);
        $totalGames = $gameRepository->count([]);
        $maxPage = ceil($totalGames / $limit);

        if ($request->isXmlHttpRequest()) {
            return $this->redirectToRoute('app_store_pagination');
        }

        return $this->render('store/index.html.twig', [
            'games' => $games,
        ]);
    }

    #[Route('/store/{id}', name: 'app_store_show')]
    public function product(): Response
    {
        return $this->render('store/show.html.twig', []);
    }

    #[Route('store/{page}', name: 'app_store_pagination')]
    public function pagination(Request $request, $page, GameRepository $gameRepository): Response
    {
        $limit = 9; // Number of items per page

        $games = $gameRepository->findPaginated($page, $limit);
        $totalGames = $gameRepository->count([]);
        $maxPage = ceil($totalGames / $limit);
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
}
