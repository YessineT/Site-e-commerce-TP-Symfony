<?php

namespace App\Controller;

use App\Form\GameFilterForm;
use App\Repository\GameRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class StoreController extends AbstractController
{
    // src/Controller/StoreController.php

    #[Route('/store', name: 'app_store')]
    public function index(Request $request, GameRepository $gameRepository): Response
    {
        // Define available sorting options
        $sortOptions = [
            'popular' => 'Most Popular',
            'newest' => 'Newest Releases',
            'price_asc' => 'Price: Low to High',
            'price_desc' => 'Price: High to Low',
            'rating' => 'Top Rated'
        ];

        // Get the selected sort option from request
        $sort = $request->query->get('sort', 'popular');

        // Validate the sort option
        if (!array_key_exists($sort, $sortOptions)) {
            $sort = 'popular';
        }

        // Get games sorted according to selection
        $games = $gameRepository->findBySortOption($sort);

        $form = $this->createFormBuilder(GameFilterForm::class);

        return $this->render('store/index.html.twig', [
            'games' => $games,
            'sortOptions' => $sortOptions,
            'currentSort' => $sort,
            'filterForm' => $form->getForm()->createView(),
        ]);
    }

    #[Route('/store/{id}', name: 'app_store_show')]
    public function product(): Response
    {
        return $this->render('store/show.html.twig', []);
    }
}
