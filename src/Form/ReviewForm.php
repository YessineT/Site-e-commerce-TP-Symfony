<?php

namespace App\Form;

use App\Entity\Game;
use App\Entity\Review;
use App\Entity\User;
use App\Form\Type\StarRatingType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReviewForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('rating', StarRatingType::class, [
                'label' => 'Your rating:',
                'required' => true,
                'choice_value' => function ($value) {
                    return (int) $value;
                },
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Review::class,
            'label_format' => 'review'
        ]);
    }
}
