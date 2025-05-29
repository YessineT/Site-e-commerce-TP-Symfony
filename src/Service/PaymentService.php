<?php

namespace App\Service;

use App\Entity\Order;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use GuzzleHttp\Exception\GuzzleException;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Psr\Log\LoggerInterface;
use App\Entity\Payment;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use App\Service\MailService;
use Symfony\Component\Security\Core\User\UserInterface;
use App\Repository\CartItemRepository;
use App\Service\FlouciService;

class PaymentService
{
    public function __construct(
        private readonly EntityManagerInterface $em,
        private readonly LoggerInterface        $logger,
        private readonly UserRepository         $userRepo,
        private readonly ParameterBagInterface  $params,
        private readonly MailService            $mailService,
        private readonly CartItemRepository     $cartItemRepo,
        private readonly FlouciService          $flouciService
    )
    {
    }

    public function initiateFlouciPayment(Order $order,?UserInterface $user = null): ?string
    {
//        $user = $this->userRepo->find($order->getUserId());
//        $username = $user->getUsername();
//        // Just delegate to FlouciService
//        return $this->flouciService->createPaymentSession(
//            $order->getTotalPrice(),
//            $username
//);
        $payload = [
            'app_token' => $this->params->get('FLOUCI_APP_TOKEN'),
            'app_secret' => $this->params->get('FLOUCI_APP_SECRET'),
            'amount' => (int)($order->getTotalPrice() * 1000), // Flouci uses millimes
            'success_link' => 'https://yourdomain.com/payment/success/' . $order->getId(),
            'fail_link' => 'https://yourdomain.com/payment/fail/' . $order->getId(),
            'session_timeout_secs' => 1200,
            'developer_tracking_id' => ($user?->getUserIdentifier() ?? 'guest') . '_' . $order->getId(),
        ];

        $client = new \GuzzleHttp\Client();
        $response = $client->post('https://sandbox.flouci.com/api/v1/checkout/session', [
            'headers' => [
                'Content-Type' => 'application/json',
            ],
            'body' => json_encode($payload),
        ]);

        $data = json_decode($response->getBody()->getContents(), true);

        return $data['checkout_url'];
    }


    public function processPayment(Order $order, array $items): void
    {
        // Update order status
        $order->setStatus('paid');

        // Create payment record
        $payment = new Payment();
        $payment->setOrder($order);
        $payment->setAmount($order->getTotalPrice());
        $payment->setStatus('success');
        $payment->setProvider('flouci');
        $payment->setPaymentDate(new \DateTime());

        $user = $this->userRepo->find($order->getUserId());
        if ($user) {
            $payment->setUser($user);

            try {
                $this->mailService->sendMailPayment(
                    $user->getEmail(),
                    $order,
                    $items
                );
            } catch (\Throwable $e) {
                $this->logger->error('Erreur lors de l’envoi de l’e-mail de confirmation : ' . $e->getMessage());
            }
        } else {
            $this->logger->warning('Utilisateur introuvable pour la commande #' . $order->getId());
        }
        foreach ($items as $item) {
            $this->em->remove($item);
        }

        $this->em->persist($payment);
        $this->em->persist($order);
        $this->em->flush();

        $this->logger->info('Paiement enregistré pour la commande #' . $order->getId());
    }
}