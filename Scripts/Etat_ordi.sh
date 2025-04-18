#!/bin/bash

######### Mohamed # Script projet 2 VO.1.0 - 15/04/25 ####

###### Etat de l'ordinateur via SSH

read -p "Gérer un système distant via SSH ? (o/n) : " is_remote



if [[ "$is_remote" == "o" || "$is_remote" == "O" ]]; then

    read -p "Entrez l'adresse IP ou le nom d'hôte du client : " remote_host

    read -p "Entrez l'utilisateur SSH (avec droits sudo) : " remote_user

    SSH_CMD="ssh -t ${remote_user}@${remote_host}"

else

    SSH_CMD=""  # Exécution locale

fi



while true; do

    clear

    echo "====== Menu Principal ======"

    echo "Choisissez une option :"

    echo "1) Arrêt"

    echo "2) Redémarrage"

    echo "3) Verrouillage"

    echo "4) Quitter le script"



    read -p "Entrez votre choix (1-4) : " choix



    case $choix in

        1)

            echo "Arrêt de l'ordinateur..."

            sudo shutdown -h now

            break

            ;;

        2)

            echo "Redémarrage de l'ordinateur..."

            sudo reboot

            break

            ;;

        3)

            echo "Verrouillage de la session..."

            gnome-screensaver-command -l 2>/dev/null || echo "Verrouillage non supporté sur ce système."

            read -p "Appuyez sur Entrée pour revenir au menu..."

            ;;

        4)

            echo "Fermeture du script."

            break

            ;;

        *)

            echo "Choix invalide. Veuillez réessayer."

            read -p "Appuyez sur Entrée pour continuer..."

            ;;

    esac

done