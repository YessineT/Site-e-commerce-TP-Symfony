<?php

namespace App\Controller;

use App\Entity\Game;
use App\Form\Game1Form;
use App\Repository\GameRepository;
use App\Repository\GenreRepository;
use App\Repository\DeveloperRepository;
use App\Repository\PlatformRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_ADMIN')]
#[Route('/admin/game_crud')]
final class GameCrudController extends AbstractController
{
   #[Route(name: 'app_game_crud_index', methods: ['GET'])]
    public function index(
        Request $request,
        PaginatorInterface $paginator,
        GameRepository $gameRepository,
        GenreRepository $genreRepository,
        DeveloperRepository $developerRepository,
        PlatformRepository $platformRepository
        ): Response {
            // Create query builder for database games
            $queryBuilder = $gameRepository->createQueryBuilder('g')
                ->orderBy('g.updatedAt', 'DESC');

            // Apply search filter if provided
            if ($searchTerm = $request->query->get('search')) {
                $queryBuilder
                    ->andWhere('g.title LIKE :search OR g.description LIKE :search')
                    ->setParameter('search', '%' . $searchTerm . '%');
            }

            // Apply free/paid filter if provided
            if ($isFreeFilter = $request->query->get('is_free')) {
                $queryBuilder
                    ->andWhere('g.isFree = :isFree')
                    ->setParameter('isFree', $isFreeFilter);
            }

            if ($genreId = $request->query->get('genre')) {
                $queryBuilder
                    ->andWhere('g.genre = :genreId')
                    ->setParameter('genreId', $genreId);
            }

            if ($developerId = $request->query->get('developer')) {
                $queryBuilder
                    ->andWhere('g.developer = :developerId')
                    ->setParameter('developerId', $developerId);
            }

            if ($platformId = $request->query->get('platform')) {
                $queryBuilder
                    ->join('g.platforms', 'p')
                    ->andWhere('p.id = :platformId')
                    ->setParameter('platformId', $platformId);
            }

            // Paginate the database query results
            $pagination = $paginator->paginate(
                $queryBuilder->getQuery(), // Get the query from the builder
                $request->query->getInt('page', 1), // Current page number
                12 // Items per page
            );
            $genres = $genreRepository->findAll();
            $developers = $developerRepository->findAll();
            $platforms = $platformRepository->findAll();

            return $this->render('game_crud/index.html.twig', [
                'pagination' => $pagination,
                'genres' => $genres,
                'developers' => $developers,
                'platforms' => $platforms,
            ]);
    }


    #[Route('/new', name: 'app_game_crud_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $game = new Game();
        $form = $this->createForm(Game1Form::class, $game);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($game);
            $entityManager->flush();

            return $this->redirectToRoute('app_game_crud_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('game_crud/new.html.twig', [
            'game' => $game,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_game_crud_show', methods: ['GET'])]
    public function show(Game $game): Response
    {   
        return $this->render('game_crud/show.html.twig', [
            'game' => $game,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_game_crud_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Game $game, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(Game1Form::class, $game);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_game_crud_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('game_crud/edit.html.twig', [
            'game' => $game,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_game_crud_delete', methods: ['POST'])]
    public function delete(Request $request, Game $game, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$game->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($game);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_game_crud_index', [], Response::HTTP_SEE_OTHER);
    }
}
