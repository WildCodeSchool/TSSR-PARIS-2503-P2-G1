#!/bin/bash
# Demander l'adresse IP et l'utilisateur distant une seule fois 
read -p "Entrez l'adresse IP de la machine distante : " ip
read -p "Entrez le nom d'utilisateur distant : " userwhile true
do
    echo
    echo "Choisissez une option :"
    echo "1. Créer un répertoire"
    echo "2. Renommer un répertoire"
    echo "3. Supprimer un répertoire"
    echo "4. Quitter"
    read -p "Votre choix : " choix
    case $choix in
        1)
            read -p "Nom du répertoire à créer : " nom
            ssh -t "$user@$ip" "if [ -d '$nom' ]; then echo 'Existe déjà.'; else mkdir '$nom'; echo 'Créé avec succès.'; fi"
            ;;
        2)
            read -p "Ancien nom du répertoire : " ancien
            if ssh "$user@$ip" "[ -d '$ancien' ]"
            then
                read -p "Nouveau nom : " nouveau
                ssh -t "$user@$ip" "mv '$ancien' '$nouveau'; echo 'Renommé en $nouveau.'"
            else
                echo "Le répertoire '$ancien' n'existe pas."
            fi
            ;;
        3)
            read -p "Nom du répertoire à supprimer : " nom
            ssh -t "$user@$ip" "if [ -d '$nom' ]; then rm -r '$nom'; echo 'Supprimé.'; fi"
            ;;
        4)
            echo "Fin de script"
            break
            ;;
    esac
done
