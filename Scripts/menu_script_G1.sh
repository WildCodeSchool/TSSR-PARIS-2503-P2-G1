#!/bin/bash

# Menu principal
echo "Choisissez un script à exécuter :"
echo "1. Script de mise à jour du système"
echo "2. Script de gestion des répertoires"
echo "3. Script de gestion de groupe"
echo "4. Script de gestion utilisateur"
echo "5. Script de gestion parefeu"
echo "6. Quitter"

read -p "Entrez votre choix : " choix

case $choix in
    1)
        echo "Lancement du script de mise à jour du système"
        ./maj.sh 
        ;;
    2)
        echo "Lancement du script de gestion des répertoires"
        ./Gestion_repertoire.sh  
        ;;
    3)
        echo "Lancement du script de gestion de groupe"
        ./Gestion_groupe.sh  
        ;;

    4)
        echo "Lancement du script de gestion utilisateur"
        ./Gestion_utilisateur.sh 
        ;;
    5)
        echo "Lancement du script de gestion parefeu"
        ./Gestion_parefeu.sh 
        ;;
    6)
        echo "Fin du script"./
        exit 0
        ;;
    

    *)
        echo "Choix invalide. Veuillez réessayer."
        ;;
esac