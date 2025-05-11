<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Game;

final class GameInfosController extends AbstractController
{
   #[Route('/game/{id}', name: 'app_game_about', defaults: ['id' => 1])]
    public function about(Game $game): Response
    {   
        return $this->render('game_infos/index.html.twig', [
        'game' => $game,
        ]);
    }

}
