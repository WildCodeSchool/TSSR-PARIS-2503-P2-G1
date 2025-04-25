#!/bin/bash

# Demander l'IP et l'utilisateur une seule fois
read -p "Entrez l'adresse IP de la machine distante : " ip
read -p "Entrez le nom d'utilisateur distant : " user

# Boucle principale
while true; do
    echo
    echo "Menu - Gestion du Pare-feu sur $ip"
    echo "1) Activer le pare-feu (avec accès SSH)"
    echo "2) Désactiver le pare-feu"
    echo "3) Afficher les règles"
    echo "4) Quitter"
    read -p "Choisissez une option : " choix

    case $choix in
        1)
            echo "Activation du pare-feu sur $ip..."
            ssh -t "$user@$ip" "
                sudo iptables -P INPUT DROP
                sudo iptables -P FORWARD DROP
                sudo iptables -P OUTPUT ACCEPT
                sudo iptables -F
                sudo iptables -A INPUT -i lo -j ACCEPT
                sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
                sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
            "
            echo "Pare-feu activé sur $ip"
            ;;
        2)
            echo "Désactivation du pare-feu sur $ip..."
            ssh -t "$user@$ip" "
                sudo iptables -P INPUT ACCEPT
                sudo iptables -P FORWARD ACCEPT
                sudo iptables -P OUTPUT ACCEPT
                sudo iptables -F
            "
            echo "Pare-feu désactivé sur $ip"
            ;;
        3)
            echo "Affichage des règles du pare-feu sur $ip..."
            ssh -t "$user@$ip" "sudo iptables -L -v -n"
            ;;
        4)
            echo "Fin du script."
            exit 0
            ;;
    esac
done