<?php

namespace App\Controller;

namespace App\Controller;

use App\Entity\Order;
use PayPalCheckoutSdk\Orders\OrdersGetRequest;
use PayPalHttp\HttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;
use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;
use PayPalCheckoutSdk\Orders\OrdersCreateRequest;
use PayPalCheckoutSdk\Orders\OrdersCaptureRequest;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;


class PayPalController extends AbstractController
{
//    private ApiContext $apiContext;
//
//    public function __construct(
//        string $clientId,
//        string $clientSecret,
//        bool $sandbox,
//        private readonly ManagerRegistry $doctrine)
//    {
//        $this->apiContext = new ApiContext(
//            new OAuthTokenCredential($clientId, $clientSecret)
//        );
//        $this->apiContext->setConfig(['mode' => $sandbox ? 'sandbox' : 'live']);
//    }
    private PayPalHttpClient $client;

    public function __construct(
        string $clientId,
        string $clientSecret,
        bool $sandbox,
        private readonly EntityManagerInterface $em
    ) {
        $environment = new SandboxEnvironment($clientId, $clientSecret);
        $this->client = new PayPalHttpClient($environment);
    }

    #[Route('/paypal/token', name: 'paypal_token', methods: ['GET'])]
    // public function token(): JsonResponse
    // {
    //     $token = $this->apiContext->getCredential()->getAccessToken(
    //         ['mode' => $this->apiContext->getConfig()['mode']]
    //     );
    //     return $this->json(['clientToken' => $token]);
    // }

    #[Route('/paypal/order/create/{orderId}', name: 'paypal_order_create', methods: ['POST'])]
    public function createOrder(int $orderId): JsonResponse
    {
        $order = $this->em->getRepository(Order::class)->find($orderId);

        if (!$order) {
            error_log("Order $orderId not found");
            return new JsonResponse(['error' => 'Order not found'], 404);
        }

        // Validate total price
        $totalPrice = $order->getTotalPrice();
        if (!is_numeric($totalPrice) || $totalPrice <= 0) {
            error_log("Invalid total price for order $orderId: $totalPrice");
            return new JsonResponse(['error' => 'Invalid total price'], 400);
        }

        // Debug URLs
         $returnUrl = $this->generateUrl('payment_paypal_success', ['orderId' => $orderId], UrlGeneratorInterface::ABSOLUTE_URL);
        $cancelUrl = $this->generateUrl('app_checkout', ['id' => $orderId],  UrlGeneratorInterface::ABSOLUTE_URL);
        error_log("Order $orderId - Return URL: $returnUrl");
        error_log("Order $orderId - Cancel URL: $cancelUrl");
        error_log("Order $orderId - Total Price: $totalPrice");

        $request = new OrdersCreateRequest();
        $request->prefer('return=representation');
        $request->body = [
            'intent' => 'CAPTURE',
            'purchase_units' => [
                [
                    'amount' => [
                        'currency_code' => 'USD',
                        'value' => number_format($order->getTotalPrice(), 2, '.', ''),
                    ],
                    'description' => 'Commande n°' . $order->getId(),
                ],
            ],
            'application_context' => [
                'return_url' => $returnUrl,
                'cancel_url' => $cancelUrl,
            ],
        ];
        error_log("PayPal request body: " . json_encode($request->body));

         try {
            error_log("📤 PayPal CreateOrder body: " . json_encode($request->body));
            $response = $this->client->execute($request);
//            dd($response);
            return new JsonResponse(['id' => $response->result->id]);
        } catch (HttpException $e) {
            $errorMessage = sprintf(
                "PayPal API Error for order %d: status %d, response: %s",
                $orderId,
                $e->statusCode,
                $e->getMessage()
            );
            error_log("PayPal SDK error for order {$orderId}: HTTP {$e->statusCode} – {$e->getMessage()}");
            return new JsonResponse(
                ['error' => $e->getMessage()],
                $e->statusCode
            );
        } catch (\Exception $e) {
            error_log("Unexpected error creating PayPal order {$orderId}: " . $e->getMessage());
            return new JsonResponse(['error' => 'Unexpected server error'], 500);}
    }
//    #[Route('/paypal/order/create/{orderId}', name: 'paypal_order_create', methods: ['POST'])]
//    public function createOrder(int $orderId): JsonResponse
//    {
//        $order = $this->em->getRepository(Order::class)->find($orderId);
//        if (!$order) {
//            error_log("Order $orderId not found");
//            return new JsonResponse(['error' => 'Order not found'], 404);
//        }
//
//        $totalPrice = $order->getTotalPrice();
//        if (!is_numeric($totalPrice) || $totalPrice <= 0) {
//            error_log("Invalid total price for order $orderId: $totalPrice");
//            return new JsonResponse(['error' => 'Invalid total price'], 400);
//        }
//
//        $returnUrl = $this->generateUrl('payment_paypal_success', ['orderId' => $orderId], true);
//        $cancelUrl = $this->generateUrl('app_checkout', ['id' => $orderId], true);
//        error_log("Order $orderId - Return URL: $returnUrl");
//        error_log("Order $orderId - Cancel URL: $cancelUrl");
//        error_log("Order $orderId - Total Price: $totalPrice");
//
//        return new JsonResponse(['debug' => 'API call skipped', 'totalPrice' => $totalPrice, 'returnUrl' => $returnUrl]);
//    }

    #[Route('/paypal/order/capture/{paypalOrderId}', name: 'paypal_order_capture', methods: ['POST'])]
    public function captureOrder(string $paypalOrderId): JsonResponse
    {
        $request = new OrdersCaptureRequest($paypalOrderId);
        $request->prefer('return=representation');

        try {
            $response = $this->client->execute($request);
            if ($response->result->status === 'COMPLETED') {
                return new JsonResponse(['status' => 'success']);
            }
            return new JsonResponse(['status' => 'failure'], 400);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => $e->getMessage()], 500);
        }
    }
    // #[Route('/paypal/order/success/{orderId}', name: 'payment_paypal_success', methods: ['GET'])]
    // public function paypalSuccess(
    //     int $orderId,
    //     Request $request,
    //     ManagerRegistry $doctrine,
    //     PaymentService $paymentService,
    //     CartItemRepository $cartRepo
    // ): Response {
    //     // 1) Grab PayPal params
    //     $paymentId = $request->query->get('paymentId');
    //     $payerId   = $request->query->get('PayerID');

    //     // 2) Execute the payment with the PayPal SDK
    //     $payment = PayPalPayment::get($paymentId, $this->apiContext);
    //     $execution = (new PaymentExecution())->setPayerId($payerId);
    //     $result = $payment->execute($execution, $this->apiContext);

    //     if ($result->getState() !== 'approved') {
    //         $this->addFlash('error', 'Le paiement PayPal a échoué.');
    //         return $this->redirectToRoute('app_checkout', ['id' => $orderId]);
    //     }

    //     // 3) Load your Order entity
    //     $order = $doctrine->getRepository(Order::class)->find($orderId);
    //     if (!$order) {
    //         throw $this->createNotFoundException('Commande introuvable.');
    //     }

    //     // 4) Fetch cart items & finalize via your PaymentService
    //     $items = $cartRepo->findBy(['user' => $order->getUserId()]);
    //     $paymentService->processPayment($order, $items);

    //     // 5) Redirect to your “thank you” page
    //     return $this->redirectToRoute('app_payment_success', ['id' => $orderId]);
    public function paypalSuccess(int $orderId, Request $request): Response
    {
        // 1) Grab the PayPal Order ID from the query string
        $paypalOrderId = $request->query->get('token');
        if (!$paypalOrderId) {
            $this->addFlash('error', 'Missing PayPal token.');
                 return $this->redirectToRoute('app_checkout', ['id' => $orderId]);
        }

        // 2) Verify with PayPal
        $getReq   = new OrdersGetRequest($paypalOrderId);
        $response = $this->client->execute($getReq);

        if ($response->result->status !== 'COMPLETED') {
            $this->addFlash('error', 'Le paiement PayPal n\'a pas été complété.');
            return $this->redirectToRoute('app_checkout', ['id' => $orderId]);
        }

        // ──> ***PUT YOUR “mark paid” CODE HERE*** <──
        /** @var Order $order */
        $order = $this->em->getRepository(Order::class)->find($orderId);
        if ($order) {
            $order->setStatus('completed');
            $this->em->flush();
        }

        // 3) Render your success page
        return $this->render('payment/success.html.twig', [
            'order' => $order,
        ]);
    }

}