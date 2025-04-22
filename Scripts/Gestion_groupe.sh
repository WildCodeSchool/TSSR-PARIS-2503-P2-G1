 #!/bin/bash
######### Mohamed # Script projet2 VO.0.0 - 15/04/25 ####
##### Gestion Groupe via SSH

# Connexion SSH
read -p "Gérer un système distant via SSH ? (o/n) : " is_remote

if [[ "$is_remote" == "o" || "$is_remote" == "O" ]]; then
    read -p "Entrez l'adresse IP ou le nom d'hôte du client : " remote_host
    read -p "Entrez l'utilisateur SSH (avec droits sudo) : " remote_user
    SSH_CMD="ssh -t ${remote_user}@${remote_host}"
else
    SSH_CMD=""  # Exécution locale
fi

# Ajout utilisateur au groupe admin
function ajouter_au_groupe_admin() {
    read -p "Entrez le nom d'utilisateur à ajouter au groupe admin : " username
    if [[ -n "$SSH_CMD" ]]; then
        $SSH_CMD "sudo usermod -aG sudo \"$username\" && echo 'Utilisateur $username ajouté au groupe admin.'"
    else
        sudo usermod -aG sudo "$username" && echo "Utilisateur $username ajouté au groupe admin."
    fi
}

# Ajout utilisateur à un groupe local
function ajouter_au_groupe_local() {
    read -p "Entrez le nom d'utilisateur à ajouter à un groupe local : " username
    read -p "Entrez le nom du groupe local : " groupname
    if [[ -n "$SSH_CMD" ]]; then
        $SSH_CMD "sudo usermod -aG \"$groupname\" \"$username\" && echo 'Utilisateur $username ajouté au groupe $groupname.'"
    else
        sudo usermod -aG "$groupname" "$username" && echo "Utilisateur $username ajouté au groupe $groupname."
    fi
}

# Retrait utilisateur d'un groupe local
function retirer_du_groupe_local() {
    read -p "Entrez le nom d'utilisateur à retirer d'un groupe local : " username
    read -p "Entrez le nom du groupe local : " groupname
    if [[ -n "$SSH_CMD" ]]; then
        $SSH_CMD "sudo gpasswd -d \"$username\" \"$groupname\" && echo 'Utilisateur $username retiré du groupe $groupname.'"
    else
        sudo gpasswd -d "$username" "$groupname" && echo "Utilisateur $username retiré du groupe $groupname."
    fi
}

# Affichage menu
while true; do
    echo ""
    echo " Menu de Gestion des Groupes "
    echo "1. Ajouter au Groupe Admin"
    echo "2. Ajouter à un Groupe Local"
    echo "3. Retirer d'un Groupe Local"
    echo "4. Quitter"
    read -p "Entrez votre choix (1-4) : " choix
    choix=$(echo "$choix" | tr -d '[:space:]')  

    case $choix in
        1) ajouter_au_groupe_admin ;;
        2) ajouter_au_groupe_local ;;
        3) retirer_du_groupe_local ;;
        4) echo "Au revoir !"; break ;;
        *) echo "Option invalide. Veuillez réessayer." ;;
    esac
done
