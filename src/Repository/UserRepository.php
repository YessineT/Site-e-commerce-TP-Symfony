<?php

namespace App\Repository;

use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query;

class UserRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, User::class);
    }

    public function findWithFilters(
        ?string $searchTerm = null,
        ?string $role = null,
        ?bool $isVerified = null
    ): Query {
        $qb = $this->createQueryBuilder('u');

        if ($searchTerm) {
            $qb->andWhere('u.username LIKE :searchTerm OR u.email LIKE :searchTerm OR u.firstName LIKE :searchTerm OR u.lastName LIKE :searchTerm')
               ->setParameter('searchTerm', '%' . $searchTerm . '%');
        }

        if ($role) {
            $qb->andWhere('u.roles LIKE :role')
               ->setParameter('role', '%"' . $role . '"%');
        }

        if ($isVerified !== null) {
            $qb->andWhere('u.isVerified = :isVerified')
               ->setParameter('isVerified', $isVerified);
        }

        return $qb->orderBy('u.id', 'ASC')
                  ->getQuery();
    }
}
