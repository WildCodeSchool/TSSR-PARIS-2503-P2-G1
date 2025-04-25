  #!/bin/bash
######### Mohamed # Script projet 2 VO.1.0 - 15/04/25 ####
###### Etat de l'ordinateur via SSH

# Vérification si on gère un système distant
read -p "Gérer un système distant via SSH ? (o/n) : " is_remote

if [[ "$is_remote" == "o" || "$is_remote" == "O" ]]; then
    read -p "Entrez l'adresse IP ou le nom d'hôte du client : " remote_host
    read -p "Entrez l'utilisateur SSH (avec droits sudo) : " remote_user
    SSH_CMD="ssh -t ${remote_user}@${remote_host}"
else
    SSH_CMD=""
fi

# Fonction pour exécuter une commande, localement ou à distance
function executer() {
    if [[ -n "$SSH_CMD" ]]; then
        $SSH_CMD "$1"
    else
        eval "$1"
    fi
}

# Fonction pour verrouiller la session
function verrouiller_session() {
    if [[ -n "$SSH_CMD" ]]; then
        $SSH_CMD "command -v gnome-screensaver-command >/dev/null && gnome-screensaver-command -l || \
                  command -v loginctl >/dev/null && loginctl lock-session || \
                  echo 'Aucune méthode de verrouillage supportée sur le système distant.'"
    else
        if command -v gnome-screensaver-command >/dev/null; then
            gnome-screensaver-command -l
        elif command -v loginctl >/dev/null; then
            loginctl lock-session
        else
            echo "Aucune méthode de verrouillage supportée sur ce système."
        fi
    fi
}

# Menu principal
while true; do
    clear
    echo "   Menu Principal "
    echo "Choisissez une option :"
    echo "1. Arrêt"
    echo "2. Redémarrage"
    echo "3. Verrouillage"
    echo "4. Quitter le script"

    read -p "Entrez votre choix (1-4) : " choix

    case $choix in
        1)
            echo "Arrêt de l'ordinateur..."
            executer "sudo shutdown -h now"
            break
            ;;
        2)
            echo "Redémarrage de l'ordinateur..."
            executer "sudo reboot"
            break
            ;;
        3)
            echo "Verrouillage de la session..."
            verrouiller_session
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;
        4)
            echo "Fermeture du script."
            break
            ;;
        *)
            echo "Choix invalide. Veuillez réessayer."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
    esac
done
