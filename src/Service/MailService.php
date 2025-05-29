<?php

namespace App\Service;

use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\Exception\TransportException;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;

class MailService
{
    private const APPLICATION_EMAIL_ADRESS="aya.gaha.noreply@gmail.com";
    public function __construct(
        private readonly MailerInterface $mailer)
    {}

    public function sendMailPayment(string $emailAdress, \App\Entity\Order $order, array $items): TemplatedEmail
    {
        $email = (new TemplatedEmail())
            ->from(self::APPLICATION_EMAIL_ADRESS)
            ->to($emailAdress)
            ->subject('🧾 Confirmation de votre commande')
            ->htmlTemplate('checkout/email.html.twig')
            ->context([
                'order' => $order,
                'items' => $items,
                'total' => $order->getTotalPrice(),
                'tax' => $order->getTotalPrice() * 0.1,
                'totalTTC' => $order->getTotalPrice() * 1.1,
            ]);

        $this->send($email);
        return $email;
    }

    /**
     * @throws TransportExceptionInterface
     */
    private function send(TemplatedEmail $email): void
    {
        try{
            $this->mailer->send($email);
        }
        catch(TransportExceptionInterface $exception){
            throw new $exception;
        }

    }

}