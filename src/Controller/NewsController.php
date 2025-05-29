<?php

namespace App\Controller;

use App\Repository\NewsRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\News;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class NewsController extends AbstractController
{
    #[Route('/news', name: 'app_news')]
    public function index(NewsRepository $newsRepo, PaginatorInterface $paginator, Request $request): Response
    {
        $query = $newsRepo->createQueryBuilder('n')
            ->orderBy('n.createdAt', 'DESC')
            ->getQuery();

        $pagination = $paginator->paginate($query, $request->query->getInt('page', 1), 6);

        return $this->render('news/index.html.twig', [
            'news' => $pagination
        ]);
    }

    #[Route('/news/{id}/{slug}', name: 'app_news_show')]
    public function show(News $news): Response
    {
        return $this->render('news/show.html.twig', [
            'news' => $news
        ]);
    }
}
