<?php

namespace App\Entity;

<<<<<<< HEAD
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
#[ORM\Entity]
=======
use App\Repository\CartRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CartRepository::class)]
>>>>>>> 002113a (panier+commande entities)
class Cart
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

<<<<<<< HEAD
    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $updatedAt = null;

    #[ORM\OneToMany(mappedBy: 'cart', targetEntity: Game::class)]
    private Collection $games;

    #[ORM\Column]
    private ?int $userId = null;
    public function __construct(int $userId)
    {
        $this->userId = $userId;
        $this->createdAt = new \DateTime();
    }
=======
    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTime $createdAt = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTime $updatedAt = null;

    #[ORM\Column]
    private ?int $userId = null;
>>>>>>> 002113a (panier+commande entities)

    public function getId(): ?int
    {
        return $this->id;
    }

<<<<<<< HEAD
    public function getCreatedAt(): ?\DateTimeInterface
=======
    public function getCreatedAt(): ?\DateTime
>>>>>>> 002113a (panier+commande entities)
    {
        return $this->createdAt;
    }

<<<<<<< HEAD
    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;
        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
=======
    public function setCreatedAt(\DateTime $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTime
>>>>>>> 002113a (panier+commande entities)
    {
        return $this->updatedAt;
    }

<<<<<<< HEAD
    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;
=======
    public function setUpdatedAt(?\DateTime $updatedAt): static
    {
        $this->updatedAt = $updatedAt;

>>>>>>> 002113a (panier+commande entities)
        return $this;
    }

    public function getUserId(): ?int
    {
        return $this->userId;
    }

<<<<<<< HEAD
    public function setUserId(int $userId): self
    {
        $this->userId = $userId;
        return $this;
    }

    public function updateTimestamp(): void
    {
        $this->updatedAt = new \DateTime();
    }
=======
    public function setUserId(int $userId): static
    {
        $this->userId = $userId;

        return $this;
    }
>>>>>>> 002113a (panier+commande entities)
}
