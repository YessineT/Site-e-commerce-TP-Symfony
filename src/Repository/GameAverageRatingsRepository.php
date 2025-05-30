<?php

namespace App\Repository;

use App\Entity\GameAverageRatings;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<GameAverageRatings>
 * @ORM\Entity(readOnly=true)
 * @ORM\Table(name="game_average_ratings")
 */
class GameAverageRatingsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GameAverageRatings::class);
    }

    public function findForGame(int $gameId): ?GameAverageRatings
    {
        return $this->findOneBy(['id' => $gameId]);
    }

    public function findWithMinRating(float $minRating): array
    {
        return $this->createQueryBuilder('gar')
            ->where('gar.averageRating >= :minRating')
            ->setParameter('minRating', $minRating)
            ->getQuery()
            ->getResult();
    }

    public function findForGames(array $gameIds): array
    {
        return $this->createQueryBuilder('gar')
            ->where('gar.id IN (:gameIds)')
            ->setParameter('gameIds', $gameIds)
            ->getQuery()
            ->getResult();
    }

    public function countSearchResults(
        string $query,
        float $minPrice,
        float $maxPrice,
        int $minRating
    ): int {
        $qb = $this->createQueryBuilder('gar')
            ->select('COUNT(gar.id)')
            ->where('gar.price BETWEEN :minPrice AND :maxPrice')
            ->andWhere('gar.averageRating >= :minRating')
            ->setParameter('minPrice', $minPrice)
            ->setParameter('maxPrice', $maxPrice)
            ->setParameter('minRating', $minRating);

        if ($query) {
            $qb->andWhere('gar.title LIKE :query OR gar.description LIKE :query')
                ->setParameter('query', '%' . $query . '%');
        }

        return (int) $qb->getQuery()->getSingleScalarResult();
    }

    public function search(
        string $query = '',
        float $minPrice = 0,
        float $maxPrice = 100,
        int $minRating = 0,
        string $sort = 'newest',
        int $page = 1,
        int $limit = 12
    ): array {
        $qb = $this->createQueryBuilder('gar')
            ->where('gar.price BETWEEN :minPrice AND :maxPrice')
            ->andWhere('gar.averageRating >= :minRating')
            ->setParameter('minPrice', $minPrice)
            ->setParameter('maxPrice', $maxPrice)
            ->setParameter('minRating', $minRating);

        if ($query) {
            $qb->andWhere('gar.title LIKE :query OR gar.description LIKE :query')
                ->setParameter('query', '%' . $query . '%');
        }

        // Apply sorting
        switch ($sort) {
            case 'newest':
                $qb->orderBy('gar.releaseDate', 'DESC');
                break;
            case 'price_asc':
                $qb->orderBy('gar.price', 'ASC');
                break;
            case 'price_desc':
                $qb->orderBy('gar.price', 'DESC');
                break;
            case 'rating':
            default:
                $qb->orderBy('gar.averageRating', 'DESC');
        }

        // Pagination
        $qb->setFirstResult(($page - 1) * $limit)
            ->setMaxResults($limit);

        return $qb->getQuery()->getResult();
    }

    //    /**
    //     * @return GameAverageRating[] Returns an array of GameAverageRating objects
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

    //    public function findOneBySomeField($value): ?GameAverageRating
    //    {
    //        return $this->createQueryBuilder('g')
    //            ->andWhere('g.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
