<?php

namespace App\Entity;

use Doctrine\Common\Collections\Collection;
use App\Repository\CartRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use App\Entity\Game;
use App\Entity\CartItem;

#[ORM\Entity(repositoryClass: CartRepository::class)]
class Cart
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $updatedAt = null;

    #[ORM\OneToMany(mappedBy: 'cart', targetEntity: Game::class)]
    private Collection $games;

    #[ORM\Column]
    private ?int $userId = null;

    /**
     * @var Collection<int, CartItem>
     */
    #[ORM\OneToMany(mappedBy: 'cart', targetEntity: CartItem::class, cascade: ['persist', 'remove'])]
    private Collection $cartItems;

//    #[ORM\OneToMany(mappedBy: 'cart', targetEntity: CartItem::class)]
//    private Collection $cartItems;
    public function __construct(int $userId)
    {
        $this->userId = $userId;
        $this->createdAt = new \DateTime();
        $this->games = new ArrayCollection();
        $this->cartItems = new ArrayCollection();

    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;
        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;
        return $this;
    }

    public function getUserId(): ?int
    {
        return $this->userId;
    }

    public function setUserId(int $userId): self
    {
        $this->userId = $userId;
        return $this;
    }

    public function updateTimestamp(): void
    {
        $this->updatedAt = new \DateTime();
    }

    /**
     * @return Collection<int, Game>
     */
    public function getGames(): Collection
    {
        return $this->games;
    }

    public function addGame(Game $game): static
    {
        if (!$this->games->contains($game)) {
            $this->games[] = $game;
            $game->setCart($this);
        }

        return $this;
    }

    public function removeGame(Game $game): static
    {
        if ($this->games->removeElement($game)) {
            if ($game->getCart() === $this) {
                $game->setCart(null);
            }
        }

        return $this;
    }
    /**
     * @return Collection<int, CartItem>
     */
    public function getCartItems(): Collection
    {
        return $this->cartItems;
    }
    public function addCartItem(CartItem $item): static
    {
        if (! $this->cartItems->contains($item)) {
            $this->cartItems->add($item);
            $item->setCart($this);
        }
        return $this;
    }

    public function removeCartItem(CartItem $item): static
    {
        if ($this->cartItems->removeElement($item)) {
            // découpler les deux côtés
            if ($item->getCart() === $this) {
                $item->setCart(null);
            }
        }
        return $this;
    }
}
