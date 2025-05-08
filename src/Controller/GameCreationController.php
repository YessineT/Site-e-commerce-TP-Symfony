<?php

namespace App\Controller;

use App\Entity\Game;
use App\Form\GameForm;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class GameCreationController extends AbstractController
{
    #[Route('/game_creation', name: 'app_game_creation')]
    public function index(Request $request, EntityManagerInterface $entityManager): Response
    {
        $game = new Game();
        $form = $this->createForm(GameForm::class, $game)
                    ->add('submit', SubmitType::class, []);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $game->setSubmittedBy($this->getUser());
            if($game->getPrice() <= 0) {
                $game->setPrice(0);
                $game->setIsFree(true);
            }

            $entityManager->persist($game);
            $entityManager->flush();

            $this->addFlash('success', 'Game created successfully.');
            return $this->redirectToRoute('app_game_creation');
        }
        return $this->render('game_creation/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/game_creation/{id}', name: 'app_game_creation_edit')]
    public function edit(Game $game, Request $request, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(GameForm::class, $game)
                    ->add('submit', SubmitType::class, []);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $game->setSubmittedBy($this->getUser());
            if($game->getPrice() <= 0) {
                $game->setPrice(0);
                $game->setIsFree(true);
            }

            $entityManager->persist($game);
            $entityManager->flush();

            $this->addFlash('success', 'Game updated successfully.');
            return $this->redirectToRoute('app_game_creation');
        }
        return $this->render('game_creation/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
