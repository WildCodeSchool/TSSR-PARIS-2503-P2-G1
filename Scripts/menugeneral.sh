#!/bin/bash

# Script: menugeneral.sh
# Description: Script général avec deux menus principaux

clear

while true
do

    echo "1. Script info systéme"
    echo "2. Script gestion utilisateur"
    echo "3. Script Etat de l'ordinateur"
    echo "4. Script information utilisateur"
    echo "5. Script de mise à jour du système"
    echo "6. Quitter"

    read -p "Choisissez une option: " choix

    case $choix in
        1)
            echo "Vous avez choisi le Script info systéme"
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/script_infos_system_ssh.sh
            ;;
        2)
            echo "Vous avez choisi le Script gestion utilisateur"
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/menu_script_G1.sh
            ;;
        3)  
            echo "Vous avez choisi le Script Etat de l'ordinateur"
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/Etat_ordi.sh
            ;;
        4)
            echo "Vous avez choisi le Script information utilisateur"
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/info_utilisateur.sh
            ;;
        5)
            echo "Vous avez choisi le Script de mise à jour du système"
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/maj.sh
            ;;

        6)    echo "Fin du menu"
            exit 0
            ;;
    esac
done