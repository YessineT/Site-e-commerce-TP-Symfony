<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class BlogController extends AbstractController
{
    #[Route('/blogs', name: 'app_blog')]
    public function index(): Response
    {
        return $this->render('blogs/index.html.twig', [
            'controller_name' => 'BlogsController',
        ]);
    }
}
