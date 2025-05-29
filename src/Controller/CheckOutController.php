<?php

namespace App\Controller;

use App\Entity\Order;
use App\Form\CheckOutType;
use App\Repository\CartItemRepository;
use App\Service\MailService;
use App\Service\PaymentService;
use Doctrine\ORM\EntityManagerInterface;
use phpDocumentor\Reflection\PseudoTypes\IntegerValue;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class CheckOutController extends AbstractController
{
    public function __construct(
        private readonly EntityManagerInterface $em,
        private readonly PaymentService $paymentService,
        private readonly MailService $mailService,
    ) {}

    #[Route('/checkout/{id}', name: 'app_checkout', methods: ['GET', 'POST'])]
    public function checkout(
        int $id,
        CartItemRepository $cartRepo,
        Request $request
    ): Response {
        $user = $this->getUser();
        $order = $this->em->getRepository(Order::class)->find($id);
//        dd([
//            'order' => $order,
//            'orderUserId' => $order?->getUserId(),
//            'currentUserId' => $user?->getId()
//        ]);
        if (!$order || $order->getUserId() !== $user->getId()) {
            throw new AccessDeniedException('Vous ne pouvez pas accéder à cette commande.');
        }

        $items = $cartRepo->findBy(['user' => $user]);
        $total = array_reduce($items, fn($sum, $ci) => $sum + $ci->getGame()->getPrice(), 0);

        $form = $this->createForm(CheckoutType::class);
        $form->handleRequest($request);
        $paypalClientId = $this->getParameter('paypal.client_id');
        if ($form->isSubmitted() && $form->isValid()) {
            // Save billing info or other form data
            $this->em->flush();

//            return $this->render('checkout/index.html.twig', [
//                'order'        => $order,
//                'cart'         => ['items' => $items, 'total' => $total],
//                'checkoutForm' => $form->createView(),
//            ]);
        }
        return $this->render('checkout/index.html.twig', [
            'order'        => $order,
            'cart'         => ['items' => $items, 'total' => $total],
            'checkoutForm' => $form->createView(),
            'PAYPAL_CLIENT_ID' => $paypalClientId,
        ]);
    }

    #[Route('/payment/success/{id}', name: 'app_payment_success')]
    public function success(int $id): Response
    {
        $order = $this->em->getRepository(Order::class)->find($id);
        return $this->render('payment/success.html.twig', [
            'order' => $order,
        ]);
    }
}
