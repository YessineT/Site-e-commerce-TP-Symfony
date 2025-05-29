<?php
// src/Service/FlouciService.php
namespace App\Service;

use Symfony\Contracts\HttpClient\HttpClientInterface;

class FlouciService
{
    private $client;
    private $appId;
    private $appSecret;
    private $redirectUrl;

    public function __construct(HttpClientInterface $client)
    {
        $this->client = $client;
        $this->appId = 'YOUR_APP_ID';                          ///TOADD
        $this->appSecret = 'YOUR_APP_SECRET';                  ///TOADD
        $this->redirectUrl = 'http://localhost:8000/payment/success';            //------ Change in production
    }

    public function createPaymentSession(int $amount, string $clientName): ?string
    {
        $response = $this->client->request('POST', 'https://developers.flouci.com/api/generate_payment', [
            'headers' => [
                'Content-Type' => 'application/json',
                'apppublic' => $this->appId,
                'appsecret' => $this->appSecret,
            ],
            'json' => [
                'app_token' => $this->appId,
                'amount' => $amount * 1000, // Flouci uses millimes
                'accept_card' => true,
                'session_timeout_secs' => 1200,
                'success_link' => $this->redirectUrl,
                'fail_link' => 'http://localhost:8000/payment/failure',
                'developer_tracking_id' => uniqid(),
            ],
        ]);

        $data = $response->toArray(false);

        return $data['redirect_url'] ?? null;
    }
}
