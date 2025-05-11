<?php

namespace App\Controller;

use App\Entity\Review;
use App\Form\ReviewForm;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Game;

final class GameInfosController extends AbstractController
{
   #[Route('/game/{id}', name: 'app_game_about', defaults: ['id' => 1])]
    public function about(Request $request, Game $game, EntityManagerInterface $entityManager): Response
    {   
        $reviews = $game->getReviews();
        $review = new Review();

        $review->setUser($this->getUser());
        $review->setGame($game);

        $form = $this->createForm(ReviewForm::class, $review)
                    ->add('submit', SubmitType::class, []);

        if ($request->isMethod('POST')) {
            // Get the data from the request
            $rating = $request->request->get('rating');
            $comment = $request->request->get('comment');

            // Validate the rating
            if ($rating && is_numeric($rating) && $rating >= 1 && $rating <= 5) {
                $review->setRating((int)$rating);
            } else {
                $this->addFlash('error', 'Please select a valid rating between 1 and 5.');
                return $this->redirectToRoute('app_game_about', ['id' => $game->getId()]);
            }

            // Set the comment
            if ($comment) {
                $review->setComment($comment);
            }

            // Persist and save the review
            $entityManager->persist($review);
            $entityManager->flush();

            $this->addFlash('success', 'Review added successfully.');
            return $this->redirectToRoute('app_game_about', ['id' => $game->getId()]);
        }
        return $this->render('game_infos/index.html.twig', [
            'game' => $game,
            'reviews' => $reviews,
            'form' => $form->createView(),
        ]);
    }

}
