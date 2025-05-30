<?php

namespace App\Form;

use App\Entity\Developer;
use App\Entity\Game;
use App\Entity\Genre;
use App\Entity\Platform;
use App\Entity\Publisher;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class GameFilterForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title')
            ->add('slug')
            ->add('description')
            ->add('shortDescription')
            ->add('price')
            ->add('releaseDate')
            ->add('isFree')
            ->add('freeUntil')
            ->add('thumbnail')
            ->add('minOs')
            ->add('minProcessor')
            ->add('minMemory')
            ->add('minGraphics')
            ->add('minStorage')
            ->add('recOs')
            ->add('recProcessor')
            ->add('recMemory')
            ->add('recGraphics')
            ->add('recStorage')
            ->add('updatedAt')
            ->add('developer', EntityType::class, [
                'class' => Developer::class,
                'choice_label' => 'id',
            ])
            ->add('publisher', EntityType::class, [
                'class' => Publisher::class,
                'choice_label' => 'id',
            ])
            ->add('genre', EntityType::class, [
                'class' => Genre::class,
                'choice_label' => 'id',
            ])
            ->add('platforms', EntityType::class, [
                'class' => Platform::class,
                'choice_label' => 'id',
                'multiple' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Game::class,
        ]);
    }
}
