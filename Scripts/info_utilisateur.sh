#!/bin/bash

# Demander l'adresse IP et l'utilisateur distant une seule fois
read -p "Entrez l'adresse IP de la machine distante : " ip
read -p "Entrez le nom d'utilisateur distant : " user

# Menu principal
while true; do
    echo
    echo "Choisissez une option :"
    echo "1. Afficher la date de dernière connexion de l'utilisateur"
    echo "2. Afficher la date de dernière modification du mot de passe"
    echo "3. Afficher les sessions ouvertes de l'utilisateur"
    echo "4. Quitter"
    read -p "Votre choix : " choix

    case $choix in
        1)
            read -p "Entrez le nom de l'utilisateur distant : " utilisateur
            ssh -t "$user@$ip" "lastlog -u $utilisateur | tail -n 1"
            ;;
        2)
            read -p "Entrez le nom de l'utilisateur distant : " utilisateur
            ssh -t "$user@$ip" "chage -l $utilisateur | grep 'Last password change'"
            ;;
        3)
            read -p "Entrez le nom de l'utilisateur distant : " utilisateur
            ssh -t "$user@$ip" "who | grep $utilisateur"
            ;;
        4)
            echo "Fin du script."
            break
            ;;
        *)
            echo "Choix invalide. Veuillez choisir une option entre 1 et 4."
            ;;
    esac
done
