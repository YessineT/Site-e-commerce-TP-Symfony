<?php

namespace App\Repository;

use App\Entity\Game;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Game>
 */
class GameRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Game::class);
    }

    public function findPopularGames(int $maxResults): array
    {
        return $this->createQueryBuilder('g')
            ->leftJoin('g.downloads', 'd')
            ->groupBy('g.id')
            ->orderBy('COUNT(d.id)', 'DESC')
            ->setMaxResults($maxResults)
            ->getQuery()
            ->getResult();
    }

    public function findLatestGames(int $maxResults): array
    {
        return $this->createQueryBuilder('g')
            ->orderBy('g.id', 'DESC')
            ->setMaxResults($maxResults)
            ->getQuery()
            ->getResult();
    }

    public function findFreeGames(int $maxResults): array
    {
        return $this->createQueryBuilder('g')
            ->where('g.price = 0')
            ->orderBy('g.releaseDate', 'DESC')
            ->setMaxResults($maxResults)
            ->getQuery()
            ->getResult();
    }

    public function findFreeUntilGames(int $maxResults): array
    {
        return $this->createQueryBuilder('g')
            ->where('g.price <> 0 AND g.freeUntil >= :today')
            ->setParameter('today', new \DateTime())
            ->orderBy('g.releaseDate', 'DESC')
            ->setMaxResults($maxResults)
            ->getQuery()
            ->getResult();
    }

    public function findGamesFromGenre(int $genreId, int $maxResults): array
    {
        return $this->createQueryBuilder('g')
            ->leftJoin('g.genres', 'g')
            ->where('g.id = :genreId')
            ->setParameter('genreId', $genreId)
            ->orderBy('g.id', 'DESC')
            ->setMaxResults($maxResults)
            ->getQuery()
            ->getResult();
    }

    // src/Repository/GameRepository.php

    public function findBySortOption(string $sortOption): array
    {
        $qb = $this->createQueryBuilder('g');

        switch ($sortOption) {
            case 'newest':
                $qb->orderBy('g.releaseDate', 'DESC');
                break;
            case 'price_asc':
                $qb->orderBy('g.price', 'ASC');
                break;
            case 'price_desc':
                $qb->orderBy('g.price', 'DESC');
                break;
            case 'rating':
                $qb->orderBy('g.averageRating', 'DESC');
                break;
            case 'popular':
            default:
                $qb->orderBy('g.price', 'DESC');
                break;
        }

        return $qb->getQuery()->getResult();
    }

    public function findPaginated(int $page, int $limit)
    {
        return $this->createQueryBuilder('g')
            ->leftJoin('g.genre', 'genre')
            ->addSelect('genre')
            ->orderBy('g.releaseDate', 'DESC')
            ->setFirstResult(($page - 1) * $limit)
            ->setMaxResults($limit)
            ->getQuery()
            ->getResult();
    }

    //    /**
    //     * @return Game[] Returns an array of Game objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('g')
    //            ->andWhere('g.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('g.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Game
    //    {
    //        return $this->createQueryBuilder('g')
    //            ->andWhere('g.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
