<?php

namespace App\Form;

use App\Entity\Developer;
use App\Entity\Game;
use App\Entity\Genre;
use App\Entity\Platform;
use App\Entity\Publisher;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Validator\Constraints\NotBlank;
use Vich\UploaderBundle\Form\Type\VichFileType;

class Game1Form extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'constraints' => [
                    new NotBlank(['message' => 'Please enter a title']),
                ]
            ])
            ->add('description', TextareaType::class, [])
            ->add('shortDescription', TextareaType::class, [])
            ->add('price', MoneyType::class, [
                'constraints' => [
                    new NotBlank(['message' => 'Please enter a price']),
                ],
                'html5' => true,
                'currency' => 'TD'
            ])
            ->add('releaseDate')
            ->add('thumbnailFile', VichFileType::class, [
                'required' => false,
                'allow_delete' => true,
                'download_uri' => false,
                'delete_label' => 'Remove image',
                'constraints' => [
                    new File([
                        'maxSize' => '2M',
                        'mimeTypes' => ['image/jpeg', 'image/png'],
                        'mimeTypesMessage' => 'Please upload a valid image',
                        'maxSizeMessage' => 'File too large (max {{ limit }} {{ suffix }})',
                    ])
                ]
            ])
            ->add('minOs')
            ->add('minProcessor')
            ->add('minMemory')
            ->add('minGraphics')
            ->add('minStorage')
            ->add('recOs')
            ->add('recProcessor')
            ->add('recMemory')
            ->add('recGraphics')
            ->add('recStorage', null, [
                'required' => false,
            ])
            ->add('developer', EntityType::class, [
                'class' => Developer::class,
                'choice_label' => 'name',
                'required' => false,
            ])
            ->add('publisher', EntityType::class, [
                'class' => Publisher::class,
                'choice_label' => 'name',
                'required' => false,
            ])
            ->add('genre', EntityType::class, [
                'class' => Genre::class,
                'choice_label' => 'name',
                'required' => false,
            ])
            ->add('platforms', EntityType::class, [
                'class' => Platform::class,
                'choice_label' => 'name',
                'multiple' => true,
                'required' => false,
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
