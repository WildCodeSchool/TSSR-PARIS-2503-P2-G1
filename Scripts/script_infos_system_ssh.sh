#################################################################
#!/bin/bash
#Auteur : Priscilla 
#Description : 
#Version : 0.0
##################################################################


# Saisie des informations de connexion SSH
read -p "Adresse IP ou nom du client Ubuntu : " SSH_HOST
read -p "Nom d'utilisateur SSH : " SSH_USER

# Commande SSH permettant de tout exécuter à distance 
run_ssh() {
    ssh "$SSH_USER@$SSH_HOST" "$1"
}

# Fonctions distantes 
info_system() {
    echo "Version de l'OS"
    run_ssh "lsb_release -a 2>/dev/null || cat /etc/os-release"
    echo

    echo "Nombre de disques physiques"
    run_ssh "lsblk -d | grep -v 'loop' | wc -l"
    echo

    echo "Détails des partitions"
    run_ssh "lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT"
    echo

    echo "Espace disque restant"
    run_ssh "df -h"
    echo

    read -p "Entrez le chemin d’un dossier pour connaître son espace disque (ex: /home) : " folder
    echo "Espace occupé par le dossier $folder"
    run_ssh "du -sh '$folder'" 2>/dev/null || echo "Dossier invalide"
    echo

    echo "Lecteurs montés"
    run_ssh "lsblk"
    echo
}

info_applications() {
    echo "Liste des paquets/applications installés"
    run_ssh "dpkg -l" | less
}

info_services() {
    echo "Services en cours d'exécution"
    run_ssh "systemctl list-units --type=service --state=running"
}

info_users() {
    echo "Utilisateurs locaux"
    run_ssh "cut -d: -f1 /etc/passwd"
}

info_ram() {
    echo "Mémoire RAM totale"
    run_ssh "grep MemTotal /proc/meminfo"
    echo

    echo "Utilisation actuelle de la RAM"
    run_ssh "free -h"
    echo
}

# Menu principal 
menu_ordinateur() {
    while true; do
        echo "MENU D'ADMINISTRATION DU CLIENT UBUNTU ($SSH_HOST)"
        echo "1. Informations système et disques"
        echo "2. Applications installées"
        echo "3. Services actifs"
        echo "4. Utilisateurs locaux"
        echo "5. Mémoire RAM"
        echo "6. Quitter"
        read -p "Votre choix : " choix

        case $choix in
            1) info_system ;;
            2) info_applications ;;
            3) info_services ;;
            4) info_users ;;
            5) info_ram ;;
            6) echo "Déconnexion. À bientôt !" ; break ;;
            *) echo "Choix invalide. Veuillez sélectionner une option du menu." ;;
        esac
    done
}

# Lancement du script 
menu_ordinateur
