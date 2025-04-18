#!/bin/bash

# Script: menugeneral.sh
# Description: Script général avec deux menus principaux

clear

while true
do

    echo "1. Script info systéme"
    echo "2. Script gestion utilisateur"
    echo "3. Quitter"

    read -p "Choisissez une option: " choix

    case $choix in
        1)
            echo "Vous avez choisi le Script info systéme"
            # Ajoutez ici les actions pour le Menu Principal 1
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/script_infos_system_ssh.sh
            ;;
        2)
            echo "Vous avez choisi le Script gestion utilisateur"
            # Ajoutez ici les actions pour le Menu Principal 2
            /home/wilder/TSSR-PARIS-2503-P2-G1/Scripts/menu_script_G1.sh
            ;;
        3)
            echo "Fin du menu"
            exit 0
            ;;
    esac
done