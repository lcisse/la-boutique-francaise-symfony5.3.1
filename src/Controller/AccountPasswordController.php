<?php

namespace App\Controller;

use App\Form\ChangePasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AccountPasswordController extends AbstractController
{
    private $entityMananger;
    private $passwordHasher;

    public function __construct(EntityManagerInterface $entityManager, UserPasswordHasherInterface $passwordHasher)
    {
        $this->entityMananger = $entityManager;
        $this->passwordHasher = $passwordHasher;
    }

    /**
     * @Route("/compte/modifier-mon-mot-de-passe", name="account_password")
     */
    public function index(Request $request): Response
    {
        $notification = null;
        $user = $this->getUser();
        $form = $this->createForm(ChangePasswordType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $old_pwd = $form->get('old_password')->getData();

            if ($this->passwordHasher->isPasswordValid($user, $old_pwd)) {

                $new_pwd = $form->get('new_password')->getData();

                $password = $this->passwordHasher->hashPassword(
                    $user,
                    $new_pwd
                );
                $user->setPassword($password);
                $this->entityMananger->flush();
                $notification = "Votre mot de passe a été mis à jour.";
            } else {
                $notification = "Votre mot de passe actuel n'est pas le bon";
            }
        }

        return $this->render('acount/password.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification
        ]);
    }
}
