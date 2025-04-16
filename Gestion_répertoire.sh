#!/bin/bash
#Mohamed.B
# Script de gestion de répertoire

# Fonction pour créer un répertoire
creer_repertoire() {
    read -p "Entrez le nom du répertoire à créer : " nom_repertoire
    if [ -d "$nom_repertoire" ]; then
        echo "Le répertoire '$nom_repertoire' existe déjà."
    else
        mkdir "$nom_repertoire"
        echo "Le répertoire '$nom_repertoire' a été créé avec succès."
    fi
}

# Fonction pour renommer un répertoire
modifier_repertoire() {
    read -p "Entrez le nom du répertoire à renommer : " ancien_nom
    if [ -d "$ancien_nom" ]; then
        read -p "Entrez le nouveau nom pour le répertoire : " nouveau_nom
        mv "$ancien_nom" "$nouveau_nom"
        echo "Le répertoire a été renommé de '$ancien_nom' à '$nouveau_nom'."
    else
        echo "Le répertoire '$ancien_nom' n'existe pas."
    fi
}

# Fonction pour supprimer un répertoire
supprimer_repertoire() {
    read -p "Entrez le nom du répertoire à supprimer : " nom_repertoire
    if [ -d "$nom_repertoire" ] 
    then
        rm -r "$nom_repertoire"
        echo "Le répertoire '$nom_repertoire' a été supprimé avec succès."
    else
        echo "Le répertoire '$nom_repertoire' n'existe pas."
    fi
}

# Menu
while true; do
    echo "1. Créer un répertoire"
    echo "2. Modifier un répertoire"
    echo "3. Supprimer un répertoire"
    echo "4. Quitter"
    read -p "Choisissez une option : " choix

    case $choix in
        1) creer_repertoire ;;
        2) modifier_repertoire ;;
        3) supprimer_repertoire ;;
        4) echo "Fin du script"; exit 0 ;;

    esac
done