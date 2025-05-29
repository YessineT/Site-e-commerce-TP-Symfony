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
use Symfony\Bundle\SecurityBundle\Security;
use App\Entity\Game;
use App\Repository\CartItemRepository;

final class GameInfosController extends AbstractController
{
    #[Route('/game/{id}', name: 'app_game_about', defaults: ['id' => 1])]
    public function about(
        Request $request,
        Game $game,
        EntityManagerInterface $entityManager,
        Security $security,
        CartItemRepository $cartItemRepo
    ): Response {
        $reviews = $game->getReviews();
        $review = new Review();

        /** @var \App\Entity\User $user */
        $user = $security->getUser();

        $review->setUser($user);
        $review->setGame($game);

        $form = $this->createForm(ReviewForm::class, $review)
            ->add('submit', SubmitType::class);

        if ($request->isMethod('POST')) {
            $rating = $request->request->get('rating');
            $comment = $request->request->get('comment');

            if ($rating && is_numeric($rating) && $rating >= 1 && $rating <= 5) {
                $review->setRating((int)$rating);
            } else {
                $this->addFlash('error', 'Please select a valid rating between 1 and 5.');
                return $this->redirectToRoute('app_game_about', ['id' => $game->getId()]);
            }

            if ($comment) {
                $review->setComment($comment);
            }

            $entityManager->persist($review);
            $entityManager->flush();

            $this->addFlash('success', 'Review added successfully.');
            return $this->redirectToRoute('app_game_about', ['id' => $game->getId()]);
        }

        // Get user's library games (downloads)
        $libraryGames = $user->getDownloads()->toArray();

        // Extract library game IDs for Twig
        $libraryGameIds = array_map(fn($game) => $game->getId(), $libraryGames);

        // Get all cart items for the user
        $cartItems = $cartItemRepo->findBy(['user' => $user]);

        // Extract cart game IDs for Twig
        $cartGameIds = array_map(fn($item) => $item->getGame()->getId(), $cartItems);

        return $this->render('game_infos/index.html.twig', [
            'game' => $game,
            'reviews' => $reviews,
            'form' => $form->createView(),
            'libraryGameIds' => $libraryGameIds,
            'cartGameIds' => $cartGameIds,
        ]);
    }
}
