#!/bin/bash

# Demander l'adresse IP et l'utilisateur distant une seule fois
read -p "Entrez l'adresse IP de la machine distante : " ip
read -p "Entrez le nom d'utilisateur distant : " user

# Boucle principale
while true
do
    # Menu principal
    echo
    echo "Choisissez une option :"
    echo "1. Installation de logiciel"
    echo "2. Désinstallation de logiciel"
    echo "3. Exécution de script sur la machine distante"
    echo "4. Quitter"
    read -p "Entrez votre choix : " choix

    case $choix in
        1)
            read -p "Entrez le nom du logiciel à installer : " logiciel
            ssh -t "$user@$ip" "sudo apt-get update && sudo apt-get install -y $logiciel"
            echo "Installation de $logiciel terminée sur $ip."
            ;;
        2)
            read -p "Entrez le nom du logiciel à désinstaller : " logiciel
            ssh -t "$user@$ip" "sudo apt-get remove -y $logiciel"
            echo "Désinstallation de $logiciel terminée sur $ip."
            ;;
        3)
            read -p "Entrez le chemin du script local à envoyer : " script
            scp "$script" "$user@$ip:/tmp/"
            ssh -t "$user@$ip" "bash /tmp/$(basename "$script")"
            echo "Script exécuté sur la machine distante $ip."
            ;;
        4)
            echo "Fin du script."
            break
            ;;
    esac
done