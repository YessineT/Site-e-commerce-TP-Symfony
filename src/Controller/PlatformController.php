<?php

namespace App\Controller;

use App\Entity\Platform;
use App\Form\PlatformForm;
use App\Repository\PlatformRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/platform')]
final class PlatformController extends AbstractController
{
    #[Route(name: 'app_platform_index', methods: ['GET'])]
    public function index(PlatformRepository $platformRepository): Response
    {
        return $this->render('platform/index.html.twig', [
            'platforms' => $platformRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_platform_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $platform = new PlatForm();
        $form = $this->createForm(PlatformForm::class, $platform);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($platform);
            $entityManager->flush();

            return $this->redirectToRoute('app_platform_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('platform/new.html.twig', [
            'platform' => $platform,
            'form' => $form,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_platform_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, PlatForm $platform, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(PlatformForm::class, $platform);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_platform_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('platform/edit.html.twig', [
            'platform' => $platform,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_platform_delete', methods: ['POST'])]
    public function delete(Request $request, PlatForm $platform, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$platform->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($platform);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_platform_index', [], Response::HTTP_SEE_OTHER);
    }
}
