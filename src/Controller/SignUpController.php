<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class SignUpController extends AbstractController
{
    /**
     * @Route("/signup", name="app_signup")
     */
    public function index()
    {
        return $this->render('signup/index.html.twig');
    }
}