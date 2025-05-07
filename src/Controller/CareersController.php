<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CareersController extends AbstractController
{
    #[Route('/carrers', name: 'app_careers')]
    public function index(): Response
    {
        return $this->render('carrers/index.html.twig', [
            'controller_name' => 'CareersController',
        ]);
    }
}
