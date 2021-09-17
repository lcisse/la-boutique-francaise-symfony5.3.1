<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class ResisterController extends AbstractController
{
    private $entityMananger;
    private $passwordHasher;

    public function __construct(EntityManagerInterface $entityManager, UserPasswordHasherInterface $passwordHasher)
    {
        $this->entityMananger = $entityManager;
        $this->passwordHasher = $passwordHasher;
    }
    /**
     * @Route("/inscription", name="register")
     */
    public function index(Request $request): Response
    {
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $user = $form->getData();

            $password = $user->getPassword();


            $user->setPassword($this->passwordHasher->hashPassword(
                $user,
                $password
            ));

            $this->entityMananger->persist($user);
            $this->entityMananger->flush();
        }

        return $this->render('resister/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
