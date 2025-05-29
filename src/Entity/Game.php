<?php

namespace App\Entity;

use App\Repository\GameRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

#[ORM\Entity(repositoryClass: GameRepository::class)]
#[Vich\Uploadable]
class Game
{
    #[ORM\ManyToOne(inversedBy: 'games')]
    #[ORM\JoinColumn(nullable: true)]
    private ?Cart $cart = null;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $title = null;

    #[ORM\Column(length: 255, nullable: true, unique: true, options: [])]
    private ?string $slug = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $shortDescription = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $price = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true, options: [
        'default' => 'CURRENT_TIMESTAMP'
    ])]
    private ?\DateTimeInterface $releaseDate = null;

    #[ORM\Column]
    private bool $isFree = false;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $freeUntil = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $thumbnail = null;

    #[Vich\UploadableField(mapping: 'game_images', fileNameProperty: 'thumbnail')]
    private ?File $thumbnailFile = null;

    #[ORM\Column(length: 255)]
    private ?string $minOs = null;

    #[ORM\Column(length: 255)]
    private ?string $minProcessor = null;

    #[ORM\Column(length: 255)]
    private ?string $minMemory = null;

    #[ORM\Column(length: 255)]
    private ?string $minGraphics = null;

    #[ORM\Column(length: 255)]
    private ?string $minStorage = null;

    #[ORM\Column(length: 255)]
    private ?string $recOs = null;

    #[ORM\Column(length: 255)]
    private ?string $recProcessor = null;

    #[ORM\Column(length: 255)]
    private ?string $recMemory = null;

    #[ORM\Column(length: 255)]
    private ?string $recGraphics = null;

    #[ORM\Column(length: 255)]
    private ?string $recStorage = null;

    #[ORM\ManyToOne(inversedBy: 'games')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Developer $developer = null;

    #[ORM\ManyToOne(inversedBy: 'games')]
    private ?Publisher $publisher = null;

    #[ORM\ManyToOne(inversedBy: 'games')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Genre $genre = null;

    #[ORM\ManyToMany(targetEntity: Platform::class, inversedBy: 'games')]
    private Collection $platforms;

    #[ORM\OneToMany(mappedBy: 'game', targetEntity: Screenshot::class, cascade: ['persist', 'remove'], orphanRemoval: true)]
    private Collection $screenshots;

    #[ORM\OneToMany(mappedBy: 'game', targetEntity: Review::class, orphanRemoval: true)]
    private Collection $reviews;

    #[ORM\OneToMany(mappedBy: 'game', targetEntity: Download::class)]
    private Collection $downloads;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $updatedAt = null;

    public function __construct()
    {
        $this->platforms = new ArrayCollection();
        $this->screenshots = new ArrayCollection();
        $this->reviews = new ArrayCollection();
        $this->downloads = new ArrayCollection();
        if ($this->releaseDate === null) {
            $this->releaseDate = new \DateTime(); // optional, only if you want a default right away
        }
    }

    public function getAverageRating(): float
    {
        if ($this->reviews->isEmpty()) {
            return 0;
        }

        $total = 0;
        foreach ($this->reviews as $review) {
            $total += $review->getRating();
        }

        return $total / $this->reviews->count();
    }

    public function setThumbnailFile(?File $thumbnailFile = null): void
    {
        $this->thumbnailFile = $thumbnailFile;

        if (null !== $thumbnailFile) {
            $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getThumbnailFile(): ?File
    {
        return $this->thumbnailFile;
    }

    // Add and remove methods for collections...

    public function __toString(): string
    {
        return $this->title;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): static
    {
        $this->slug = $slug;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getShortDescription(): ?string
    {
        return $this->shortDescription;
    }

    public function setShortDescription(?string $shortDescription): static
    {
        $this->shortDescription = $shortDescription;

        return $this;
    }

    public function getPrice(): ?string
    {
        return $this->price;
    }

    public function setPrice(string $price): static
    {
        $this->price = $price;

        return $this;
    }

    public function getReleaseDate(): \DateTimeInterface
    {
        return $this->releaseDate;
    }

    public function setReleaseDate(\DateTimeInterface $releaseDate): static
    {
        $this->releaseDate = $releaseDate;

        return $this;
    }

    public function isFree(): ?bool
    {
        return $this->isFree;
    }

    public function setIsFree(bool $isFree): static
    {
        $this->isFree = $isFree;

        return $this;
    }

    public function getFreeUntil(): ?\DateTimeInterface
    {
        return $this->freeUntil;
    }

    public function setFreeUntil(?\DateTimeInterface $freeUntil): static
    {
        $this->freeUntil = $freeUntil;

        return $this;
    }

    public function getThumbnail(): ?string
    {
        return $this->thumbnail;
    }

    public function setThumbnail(?string $thumbnail): static
    {
        $this->thumbnail = $thumbnail;

        return $this;
    }

    public function getMinOs(): ?string
    {
        return $this->minOs;
    }

    public function setMinOs(string $minOs): static
    {
        $this->minOs = $minOs;

        return $this;
    }

    public function getMinProcessor(): ?string
    {
        return $this->minProcessor;
    }

    public function setMinProcessor(string $minProcessor): static
    {
        $this->minProcessor = $minProcessor;

        return $this;
    }

    public function getMinMemory(): ?string
    {
        return $this->minMemory;
    }

    public function setMinMemory(string $minMemory): static
    {
        $this->minMemory = $minMemory;

        return $this;
    }

    public function getMinGraphics(): ?string
    {
        return $this->minGraphics;
    }

    public function setMinGraphics(string $minGraphics): static
    {
        $this->minGraphics = $minGraphics;

        return $this;
    }

    public function getMinStorage(): ?string
    {
        return $this->minStorage;
    }

    public function setMinStorage(string $minStorage): static
    {
        $this->minStorage = $minStorage;

        return $this;
    }

    public function getRecOs(): ?string
    {
        return $this->recOs;
    }

    public function setRecOs(string $recOs): static
    {
        $this->recOs = $recOs;

        return $this;
    }

    public function getRecProcessor(): ?string
    {
        return $this->recProcessor;
    }

    public function setRecProcessor(string $recProcessor): static
    {
        $this->recProcessor = $recProcessor;

        return $this;
    }

    public function getRecMemory(): ?string
    {
        return $this->recMemory;
    }

    public function setRecMemory(string $recMemory): static
    {
        $this->recMemory = $recMemory;

        return $this;
    }

    public function getRecGraphics(): ?string
    {
        return $this->recGraphics;
    }

    public function setRecGraphics(string $recGraphics): static
    {
        $this->recGraphics = $recGraphics;

        return $this;
    }

    public function getRecStorage(): ?string
    {
        return $this->recStorage;
    }

    public function setRecStorage(string $recStorage): static
    {
        $this->recStorage = $recStorage;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): static
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getDeveloper(): ?Developer
    {
        return $this->developer;
    }

    public function setDeveloper(?Developer $developer): static
    {
        $this->developer = $developer;

        return $this;
    }

    public function getPublisher(): ?Publisher
    {
        return $this->publisher;
    }

    public function setPublisher(?Publisher $publisher): static
    {
        $this->publisher = $publisher;

        return $this;
    }

    public function getGenre(): ?Genre
    {
        return $this->genre;
    }

    public function setGenre(?Genre $genre): static
    {
        $this->genre = $genre;

        return $this;
    }

    /**
     * @return Collection<int, Platform>
     */
    public function getPlatforms(): Collection
    {
        return $this->platforms;
    }

    public function addPlatform(Platform $platform): static
    {
        if (!$this->platforms->contains($platform)) {
            $this->platforms->add($platform);
        }

        return $this;
    }

    public function removePlatform(Platform $platform): static
    {
        $this->platforms->removeElement($platform);

        return $this;
    }

    /**
     * @return Collection<int, Screenshot>
     */
    public function getScreenshots(): Collection
    {
        return $this->screenshots;
    }

    public function addScreenshot(Screenshot $screenshot): static
    {
        if (!$this->screenshots->contains($screenshot)) {
            $this->screenshots->add($screenshot);
            $screenshot->setGame($this);
        }

        return $this;
    }

    public function removeScreenshot(Screenshot $screenshot): static
    {
        if ($this->screenshots->removeElement($screenshot)) {
            // set the owning side to null (unless already changed)
            if ($screenshot->getGame() === $this) {
                $screenshot->setGame(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Review>
     */
    public function getReviews(): Collection
    {
        return $this->reviews;
    }

    public function addReview(Review $review): static
    {
        if (!$this->reviews->contains($review)) {
            $this->reviews->add($review);
            $review->setGame($this);
        }

        return $this;
    }

    public function removeReview(Review $review): static
    {
        if ($this->reviews->removeElement($review)) {
            // set the owning side to null (unless already changed)
            if ($review->getGame() === $this) {
                $review->setGame(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Download>
     */
    public function getDownloads(): Collection
    {
        return $this->downloads;
    }

    public function addDownload(Download $download): static
    {
        if (!$this->downloads->contains($download)) {
            $this->downloads->add($download);
            $download->setGame($this);
        }

        return $this;
    }

    public function removeDownload(Download $download): static
    {
        if ($this->downloads->removeElement($download)) {
            // set the owning side to null (unless already changed)
            if ($download->getGame() === $this) {
                $download->setGame(null);
            }
        }

        return $this;
    }

    

    public function setSubmittedAt(\DateTimeInterface $submittedAt): static
    {
        $this->submittedAt = $submittedAt;

        return $this;
    }

    

    public function setSubmittedBy(?User $submittedBy): static
    {
        $this->submittedBy = $submittedBy;

        return $this;
    }
    public function getCart(): ?Cart
    {
        return $this->cart;
    }

    public function setCart(?Cart $cart): static
    {
        $this->cart = $cart;
        return $this;
    }
}