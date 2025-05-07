<?php

namespace App\Controller;

use App\Entity\Game;
use App\Form\GameForm;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class GameCreationController extends AbstractController
{
    #[Route('/game_creation', name: 'app_game_creation')]
    public function index(Request $request, EntityManagerInterface $entityManager): Response
    {
        $game = new Game();
        $form = $this->createForm(GameForm::class, $game);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $game->setSubmittedBy($this->getUser());
            $game->setStatus('pending_review');

            $entityManager->persist($game);
            $entityManager->flush();

            $this->addFlash('success', 'Game created successfully.');
            return $this->redirectToRoute('app_game_creation');
        }
        return $this->render('game_creation/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
