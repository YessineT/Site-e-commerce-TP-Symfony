<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Game;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\CartItem;
use App\Repository\CartItemRepository;
final class CartController extends AbstractController
{
    #[Route('/cart', name: 'app_cart')]
    public function index(CartItemRepository $cartItemRepo): Response
    {
        $user = $this->getUser();
        $items = $cartItemRepo->findBy(['user' => $user]);

        $total = array_reduce($items, fn($acc, $item) => $acc + ($item->getQuantity() * $item->getProduct()->getPrice()), 0);

        return $this->render('cart/index.html.twig', [
            'items' => $items,
            'total' => $total,
        ]);
    }
    #[Route('/cart/add/{id}', name: 'cart_add')]
    public function add(Game $game, EntityManagerInterface $em, Request $request): Response
    {
        $user = $this->getUser(); // si user connecté
        $cartItem = new CartItem();
        $cartItem->setProduct($game);
        $cartItem->setQuantity(1); // par défaut 1
        $cartItem->setUser($user);

        $em->persist($cartItem);
        $em->flush();

        return $this->redirectToRoute('app_cart');
    }
    #[Route('/cart/remove/{id}', name: 'cart_remove')]
    public function remove(CartItem $item, EntityManagerInterface $em): Response
    {
        $em->remove($item);
        $em->flush();

        return $this->redirectToRoute('app_cart');
    }
}
