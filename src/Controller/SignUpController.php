<?php
// src/Controller/SignupController.php
namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class SignUpController extends AbstractController
{
    #[Route('/signup', name: 'app_register', methods: ['GET', 'POST'])]
    public function register(
        Request $request,
        EntityManagerInterface $em,
        UserPasswordHasherInterface $passwordHasher
    ): Response {
        if ($request->isMethod('POST')) {
            // Get form data
            $email = $request->request->get('email');
            $password = $request->request->get('password');

            // Check if user already exists
            $existingUser = $em->getRepository(User::class)->findOneBy(['email' => $email]);
            if ($existingUser) {
                $this->addFlash('danger', 'User already exists with this email.');
                return $this->redirectToRoute('app_register');
            }

            // Create new user
            $user = new User();
            $user->setEmail($email);
            $user->setUsername($email); //
            $user->setRoles(['ROLE_USER']);

            $hashedPassword = $passwordHasher->hashPassword($user, $password);
            $user->setPassword($hashedPassword);

            // Save user
            $em->persist($user);
            $em->flush();

            $this->addFlash('success', 'Registration successful! You can now log in.');

            return $this->redirectToRoute('app_login');
        }

        return $this->render('signup/index.html.twig');
    }
}
