<?php

namespace App\Repository;

use App\Entity\Game;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
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

    public function countSearchResults(string $query, float $minPrice, float $maxPrice, int $minRating): int
    {
        $qb = $this->createQueryBuilder('g')
            ->select('COUNT(g.id)');

        if ($query) {
            $qb->andWhere('g.title LIKE :query')
                ->setParameter('query', '%' . $query . '%');
        }

        $qb->andWhere('g.price >= :minPrice')
            ->andWhere('g.price <= :maxPrice')
            ->setParameter('minPrice', $minPrice)
            ->setParameter('maxPrice', $maxPrice);

        if ($minRating > 0) {
            $qb->andWhere('g.rating >= :minRating')
                ->setParameter('minRating', $minRating);
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
        $qb = $this->createQueryBuilder('g')
            ->where('g.price BETWEEN :minPrice AND :maxPrice')
            ->setParameter('minPrice', $minPrice)
            ->setParameter('maxPrice', $maxPrice);

        // Search query
        if (!empty($query)) {
            $qb->andWhere('g.name LIKE :query OR g.description LIKE :query')
                ->setParameter('query', '%' . $query . '%');
        }

        // Rating filter
        if ($minRating > 0) {
            $qb->andWhere('g.rating >= :minRating')
                ->setParameter('minRating', $minRating);
        }

        // Sorting
        switch ($sort) {
            case 'newest':
                $qb->orderBy('g.releaseDate', 'DESC');
                break;
            case 'price_asc':
                $qb->orderBy('g.price', 'ASC');
                break;
            case 'price_desc':
            default:
                $qb->orderBy('g.price', 'DESC');
                break;
        }

        // Pagination
        $qb->setFirstResult(($page - 1) * $limit)
            ->setMaxResults($limit);

        return $qb->getQuery()->getResult();
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
