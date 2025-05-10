<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\User;

final class LibraryController extends AbstractController
{
    #[Route('/library', name: 'app_library')]
    public function index(Security $security): Response
    {
        /** @var User $user */
        $user = $security->getUser();

        if (!$user) {
            throw $this->createAccessDeniedException('You must be logged in to view your library.');
        }

        $libraryGames = $user->getDownloads();
        return $this->render('library/index.html.twig', [
            'controller_name' => 'LibraryController',
            'libraryGames' => $libraryGames,
        ]);
    }
}
