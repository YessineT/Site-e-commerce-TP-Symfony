<?php

namespace App\Entity;

use App\Repository\DownloadRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DownloadRepository::class)]
class Download
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'downloads')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    #[ORM\ManyToOne(inversedBy: 'downloads')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Game $game = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $downloadedAt = null;

    #[ORM\Column(type: Types::FLOAT, nullable: true)]
    private ?float $progress = null;

    #[ORM\Column]
    private bool $isInstalled = false;

    // Adding hoursPlayed property
    #[ORM\Column(type: Types::FLOAT, nullable: false)]
    private ?float $hoursPlayed = 0;

    public function __construct()
    {
        $this->downloadedAt = new \DateTime();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDownloadedAt(): ?\DateTime
    {
        return $this->downloadedAt;
    }

    public function setDownloadedAt(\DateTime $downloadedAt): static
    {
        $this->downloadedAt = $downloadedAt;

        return $this;
    }

    public function getProgress(): ?float
    {
        return $this->progress;
    }

    public function setProgress(?float $progress): static
    {
        $this->progress = $progress;

        return $this;
    }

    public function isInstalled(): ?bool
    {
        return $this->isInstalled;
    }

    public function setIsInstalled(bool $isInstalled): static
    {
        $this->isInstalled = $isInstalled;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    public function getGame(): ?Game
    {
        return $this->game;
    }

    public function setGame(?Game $game): static
    {
        $this->game = $game;

        return $this;
    }

    // Getter for hoursPlayed
    public function getHoursPlayed(): ?float
    {
        return $this->hoursPlayed;
    }

    // Setter for hoursPlayed
    public function setHoursPlayed(?float $hoursPlayed): static
    {
        $this->hoursPlayed = $hoursPlayed;

        return $this;
    }
}
