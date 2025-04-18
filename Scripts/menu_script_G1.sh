#!/bin/bash

# Menu principal
echo "Choisissez un script à exécuter :"
echo "1. Script de mise à jour du système"
echo "2. Script de gestion des répertoires"
echo "3. Script de gestion de groupe"
echo "4. Quitter"

read -p "Entrez votre choix : " choix

case $choix in
    1)
        echo "Lancement du script de mise à jour du système"
        ./maj.sh  # Assurez-vous que ce script existe et est exécutable
        ;;
    2)
        echo "Lancement du script de gestion des répertoires"
        ./Gestion_repertoire.sh  # Assurez-vous que ce script existe et est exécutable
        ;;
    3)
        echo "Lancement du script de gestion de groupe"
        ./Gestion_groupe.sh  # Assurez-vous que ce script existe et est exécutable
        ;;
    4)
        echo "Sortie du script. À bientôt !"
        exit 0
        ;;
    *)
        echo "Choix invalide. Veuillez réessayer."
        ;;
esac