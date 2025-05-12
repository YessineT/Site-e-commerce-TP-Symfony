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
use App\Repository\UserRepository;
final class CartController extends AbstractController
{
    #[Route('/cart', name: 'app_cart')]
    public function index(CartItemRepository $repo): Response
    {
        $user = $this->getUser();
        if (!$user) {
            // throw $this->createAccessDeniedException();
            //return $this->redirectToRoute('app_login');
            dd($this->getUser());
        }
        //dump($this->getUser());
        dump($this->isGranted('ROLE_USER'));
        $items = $repo->findBy(['user' => $user]);
        $total = array_reduce($items, fn($acc, $i)=> $acc + ($i->getQuantity()*$i->getGame()->getPrice()), 0);
        return $this->render('cart/index.html.twig', compact('items','total'));
    }

    #[Route('/cart/add/{id}', name: 'cart_add')]
    public function add(Game $game, CartItemRepository $repo, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        if (!$user) {
            throw $this->createAccessDeniedException();
        }

        $item = $repo->findOneBy(['user'=>$user, 'game'=>$game]);
        if ($item) {
            $item->setQuantity($item->getQuantity()+1);
        } else {
            $item = new CartItem();
            $item->setGame($game)
                ->setUser($user)
                ->setQuantity(1);
            $em->persist($item);
        }
        $em->flush();
        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/update/{id}', name: 'cart_update', methods: ['POST'])]
    public function update(Request $request, CartItem $item, EntityManagerInterface $em): Response
    {
        if ($item->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }
        $q = max(1, (int)$request->request->get('quantity', 1));
        $item->setQuantity($q);
        $em->flush();
        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/remove/{id}', name: 'cart_remove')]
    public function remove(CartItem $item, EntityManagerInterface $em): Response
    {
        if ($item->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }
        $em->remove($item);
        $em->flush();
        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/gift/{id}', name: 'cart_gift', methods: ['POST'])]
    public function gift(
        Request $request,
        CartItem $item,
        UserRepository $userRepo,
        EntityManagerInterface $em
    ): Response {
        if (!$this->isCsrfTokenValid('gift'.$item->getId(), $request->request->get('_token'))) {
            $this->addFlash('error', 'Token de sécurité invalide.');
            return $this->redirectToRoute('app_cart');
        }
        if ($item->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException();
        }

        $recipientUsername = $request->request->get('recipient');
        $recipient = $userRepo->findOneBy(['username' => $recipientUsername]);
        if (!$recipient) {
            $this->addFlash('danger', 'Destinataire introuvable.');
            return $this->redirectToRoute('app_cart');
        }

        $price = $item->getGame()->getPrice();
        $sender = $this->getUser();

        // verif solde donner
        if ($sender->getBalance() < $price) {
            $this->addFlash('warning', 'Solde insuffisant pour offrir ce jeu.');
            return $this->redirectToRoute('app_cart');
        }

        // --donneur, ++le destinataire
        $sender->setBalance($sender->getBalance() - $price);
        $recipient->setBalance($recipient->getBalance() + $price);

        // retirer du panier du donneur
        $em->remove($item);
        $em->flush();

        $this->addFlash('success', sprintf(
            'Vous avez offert "%s" à %s !',
            $item->getGame()->getTitle(),
            $recipient->getUsername()
        ));

        return $this->redirectToRoute('app_cart');
    }
}
