#!/bin/bash

# Mohamed - Script projet 2 VO.1.2 - 18/04/25

# Gestion des utilisateurs local via SSH



# Connexion SSH

read -p "Gérer un système distant via SSH ? (o/n) : " is_remote



if [[ "$is_remote" == "o" || "$is_remote" == "O" ]]; then

    read -p "Adresse IP ou nom d'hôte : " remote_host

    read -p "Utilisateur SSH (avec sudo) : " remote_user

    SSH_CMD="ssh -t ${remote_user}@${remote_host}"

else

    SSH_CMD=""

fi



# Creation de l'utilisateur 

function creer_utilisateur() {

    read -p "Nom d'utilisateur à créer : " username

    if [[ -n "$SSH_CMD" ]]; then

        $SSH_CMD "sudo useradd \"$username\""

    else

        sudo useradd "$username"

    fi

}



# Changement de mot de passe

function changer_mot_de_passe() {

    read -p "Nom d'utilisateur : " username

    if [[ -n "$SSH_CMD" ]]; then

        $SSH_CMD "sudo passwd \"$username\""

    else

        sudo passwd "$username"

    fi

}

# Suppression de l'utilisateur

function supprimer_utilisateur() {

    read -p "Nom d'utilisateur à supprimer : " username

    if [[ -n "$SSH_CMD" ]]; then

        $SSH_CMD "sudo deluser \"$username\""

    else

        sudo deluser "$username"

    fi

}

# Désactivation de l'utilisateur

function desactiver_utilisateur() {

    read -p "Nom d'utilisateur à désactiver : " username

    if [[ -n "$SSH_CMD" ]]; then

        $SSH_CMD "sudo usermod -L \"$username\""

    else

        sudo usermod -L "$username"

    fi

}



# Menu principal

while true; do

    echo ""

    echo "Menu de gestion des utilisateurs"

    echo "1. Création de compte utilisateur"

    echo "2. Changement de mot de passe"

    echo "3. Suppression de compte utilisateur"

    echo "4. Désactivation de compte utilisateur"

    echo "5. Quitter"

    read -p "Votre choix (1-5) : " choix



    case $choix in

        1) creer_utilisateur ;;

        2) changer_mot_de_passe ;;

        3) supprimer_utilisateur ;;

        4) desactiver_utilisateur ;;

        5) break ;;

        *) echo "Choix invalide." ;;

    esac

done

  