<?php

namespace App\Service;

use Symfony\Contracts\HttpClient\HttpClientInterface;

class PayPalClient
{
    private string $baseUrl;

    public function __construct(
        private readonly HttpClientInterface $httpClient,
        private readonly string $clientId,
        private readonly string $clientSecret,
        private readonly bool $sandbox
    ) {
        $this->baseUrl = $sandbox
            ? 'https://api-m.sandbox.paypal.com'
            : 'https://api-m.paypal.com';
    }

    public function getAccessToken(): string
    {
        $response = $this->httpClient->request('POST', $this->baseUrl.'/v1/oauth2/token', [
            'auth_basic' => [$this->clientId, $this->clientSecret],
            'body' => 'grant_type=client_credentials',
            'headers' => ['Content-Type' => 'application/x-www-form-urlencoded'],
        ]);

        return $response->toArray()['access_token'];
    }

    public function createOrder(float $amount): array
    {
        $token = $this->getAccessToken();

        $response = $this->httpClient->request('POST', $this->baseUrl.'/v2/checkout/orders', [
            'headers' => [
                'Authorization' => 'Bearer '.$token,
                'Content-Type' => 'application/json',
            ],
            'json' => [
                'intent' => 'CAPTURE',
                'purchase_units' => [[
                    'amount' => [
                        'currency_code' => 'TND',
                        'value' => number_format($amount, 2, '.', '')
                    ]
                ]]
            ]
        ]);

        return $response->toArray();
    }

    public function captureOrder(string $paypalOrderId): array
    {
        $token = $this->getAccessToken();

        $response = $this->httpClient->request('POST', $this->baseUrl."/v2/checkout/orders/$paypalOrderId/capture", [
            'headers' => [
                'Authorization' => 'Bearer '.$token,
                'Content-Type' => 'application/json',
            ],
        ]);

        return $response->toArray();
    }
}