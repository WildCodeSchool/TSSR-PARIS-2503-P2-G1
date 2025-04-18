#!/bin/bash

# Script de gestion de mise à jour via SSH avec pseudo-terminal (-t)

# Demander une seule fois les informations
read -p "Entrez l'adresse IP de la machine distante : " ip
read -p "Entrez le nom d'utilisateur distant : " user

# Boucle principale
while true
do
    echo
    echo "Menu - Maintenance système sur $ip"
    echo "1. Mettre à jour la liste des paquets (apt update)"
    echo "2. Mettre à jour tous les paquets (apt upgrade)"
    echo "3. Faire une mise à jour complète (update + upgrade)"
    echo "4. Quitter"
    read -p "Votre choix : " choix

    case $choix in
        1)
            echo "Mise à jour de la liste des paquets..."
            ssh -t "$user@$ip" "sudo apt update"
            ;;
        2)
            echo "Mise à jour des paquets installés..."
            ssh -t "$user@$ip" "sudo apt upgrade -y"
            ;;
        3)
            echo "Mise à jour complète (update + upgrade)..."
            ssh -t "$user@$ip" "sudo apt update && sudo apt upgrade -y"
            ;;
        4)
            echo "Fin du script. À bientôt !"
            break
            ;;

    esac
done
