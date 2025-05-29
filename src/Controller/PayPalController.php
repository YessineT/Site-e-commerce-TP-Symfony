<?php

namespace App\Controller;

use App\Entity\Order;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use PayPal\Api\Payment as PayPalPayment;
use PayPal\Api\PaymentExecution;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;
use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;
use PayPalCheckoutSdk\Orders\OrdersCreateRequest;
use PayPalCheckoutSdk\Orders\OrdersCaptureRequest;


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
    public function token(): JsonResponse
    {
        $token = $this->apiContext->getCredential()->getAccessToken(
            ['mode' => $this->apiContext->getConfig()['mode']]
        );
        return $this->json(['clientToken' => $token]);
    }

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
        $returnUrl = $this->generateUrl('payment_paypal_success', ['orderId' => $orderId], true);
        $cancelUrl = $this->generateUrl('app_checkout', ['id' => $orderId], true);
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
                        'currency_code' => 'EUR',
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
            $response = $this->client->execute($request);
            error_log("PayPal order created for order $orderId: " . $response->result->id);
            return new JsonResponse(['id' => $response->result->id]);
        } catch (\Exception $e) {
            $errorMessage = "PayPal API Error for order $orderId: " . $e->getMessage();
            if ($e instanceof \PayPalHttp\HttpException) {
                $responseBody = $e->getResponse()->getBody()->getContents();
                $errorMessage .= " - Response: " . $responseBody;
            }
            error_log($errorMessage);
            return new JsonResponse(['error' => $e->getMessage()], 500);
        }
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
    #[Route('/paypal/order/success/{orderId}', name: 'payment_paypal_success', methods: ['GET'])]
    public function paypalSuccess(
        int $orderId,
        Request $request,
        ManagerRegistry $doctrine,
        PaymentService $paymentService,
        CartItemRepository $cartRepo
    ): Response {
        // 1) Grab PayPal params
        $paymentId = $request->query->get('paymentId');
        $payerId   = $request->query->get('PayerID');

        // 2) Execute the payment with the PayPal SDK
        $payment = PayPalPayment::get($paymentId, $this->apiContext);
        $execution = (new PaymentExecution())->setPayerId($payerId);
        $result = $payment->execute($execution, $this->apiContext);

        if ($result->getState() !== 'approved') {
            $this->addFlash('error', 'Le paiement PayPal a échoué.');
            return $this->redirectToRoute('app_checkout', ['id' => $orderId]);
        }

        // 3) Load your Order entity
        $order = $doctrine->getRepository(Order::class)->find($orderId);
        if (!$order) {
            throw $this->createNotFoundException('Commande introuvable.');
        }

        // 4) Fetch cart items & finalize via your PaymentService
        $items = $cartRepo->findBy(['user' => $order->getUserId()]);
        $paymentService->processPayment($order, $items);

        // 5) Redirect to your “thank you” page
        return $this->redirectToRoute('app_payment_success', ['id' => $orderId]);
    }
}