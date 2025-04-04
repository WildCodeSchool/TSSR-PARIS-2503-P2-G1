# TSSR-PARIS-2503-P2-G1
The scripting project

# Projet 2: Administration de Machines Distantes via Scripts Bash et PowerShell

## 1. Présentation du Projet

Ce projet vise à développer deux scripts permettant l'administration de machines distantes sur un réseau unique :

Un script Bash pour administrer des machines Ubuntu depuis un serveur Debian.

Un script PowerShell pour administrer des machines Windows depuis un serveur Windows Server.

(Tâches secondaires) : Un script Bash pour administrer des machines Windows et un script PowerShell pour administrer des machines Ubuntu.

Les scripts devront interagir avec les machines distantes et permettre :

L'exécution de commandes d'administration (création/suppression d'utilisateurs, gestion des groupes, gestion des services, etc.).

La collecte d'informations système (utilisateurs locaux, services, partitions, etc.).



## 2. Objectifs du Sprint 1

**Analyse des besoins et définition des objectifs :** Comprendre les actions d'administration et les informations à collecter.

Installation et configuration des machines virtuelles sur Proxmox : Mettre en place les environnements serveurs et clients.

Mise en réseau des machines (clients et serveurs) : Assurer la communication entre le serveur et les clients.

Structure du menu d'administration avec une navigation ergonomique : Concevoir un menu interactif pour naviguer dans les différentes actions et informations.

Début du développement des scripts (Bash et PowerShell).

Planification de la documentation (README.md, INSTALL.md, USER_GUIDE.md).

## 3. Travail déjà réalisé

Installation et configuration des machines virtuelles sur Proxmox : Les machines serveurs et clients ont été mises en place.

Mise en réseau des machines clients et serveurs.

Conception de la structure du menu d'administration interactif: Un menu interactif avec navigation ergonomique a été conçu, permettant de choisir des actions à effectuer ou de rechercher des informations.

Premier jet des scripts d'administration (Bash et PowerShell) : Les scripts de base ont été créés pour exécuter certaines actions et collecter des informations.

Initialisation des fichiers de documentation (README.md, INSTALL.md, USER_GUIDE.md) sur GitHub.

## 4. Ce qui reste à faire ( Sprint 2 et suivants)

Finaliser les scripts avec toutes les fonctionnalités listées.

Effectuer des tests et corrections.

Compléter la documentation utilisateur et administrateur.

Optimiser la navigation dans les menus et sous-menus.

Intégrer des logs et des options de débogage.

## 5. Plan de la documentation (README.md,INSTALL.md,USER_GUIDE.md)

**README.md (Documentation générale) :** Présentation générale du projet : Décrire l'objectif du projet, la mise en place des machines virtuelles et des scripts d'administration.   
**Objectifs finaux :** Détails sur l'administration des machines via Bash et PowerShell, la collecte d'informations, et la gestion des utilisateurs/ordinateurs.  
**Technologies utilisées :** Bash, PowerShell, Proxmox, serveurs Debian et Windows.  

**INSTALL.md (Documentation administrateur):** Instructions d'installation et de configuration.

**USER_GUIDE.md (Documentation utilisateur) :** Manuel utilisateur avec explications des commandes.

## 6. Organisation et rôles de l'équipe

**Chaque membre est assigné à une partie du projet et assure le suivi des daily meetings:**

Omar PO (Product Owner) de cette prémière semaine est le représentant du client. 
Il est responsable de la définition des besoins et de la priorisation des tâches. Il veille à ce que le projet réponde aux attentes du client.

Mohamed Keita SM (Scrum Master) cette semaine est le garant de la bonne application de la méthode Scrum. 
Il est responsable de la communication entre les membres de l'équipe et de la bonne réalisation des tâches.

Priscilla et Mohamed Mben Slim (Dev), Développeurs qui collaborent avec le PO et le Scrum Master pour mettre en œuvre les fonctionnalités du projet, en particulier le développement des scripts et la gestion de la documentation.

## 7. Pseudo-code/Squelette des scripts  
**Utilisateur (sur les machines distantes) :**  
**Actions :**  

Création de compte utilisateur  

Changement de mot de passe  

Suppression ou désactivation de compte utilisateur  

Ajout/retrait de groupes  

**Informations :**  

Dernière connexion, date de modification du mot de passe  

Liste des sessions ouvertes  

Groupes d’appartenance, historique des commandes, permissions sur fichiers/dossiers  

**Ordinateur Client (sur les machines distantes) :**  
**Actions :**  

Arrêt, redémarrage, verrouillage, mise à jour du système  

Création, modification, suppression de répertoires  

Exécution de script à distance, gestion du pare-feu, désinstallation de logiciels  

**Informations :**  

Version du système d'exploitation, partitions, espace disque  

Liste des lecteurs, applications installées, services en cours d'exécution  

## 8. Début du code shell bash  et PowerShell
**Voici un squelette de code Bash qui pourrait être utilisé pour administrer une machine Ubuntu à partir d’un serveur Debian :** 

#!/bin/bash  

#Menu principal  
echo "Choisissez une action :"  
echo "1. Créer un utilisateur"  
echo "2. Supprimer un utilisateur"  
echo "3. Changer mot de passe"  
echo "4. Voir les informations de l'utilisateur"  
echo "5. Quitter"  
read choice  

case $choice in  
  1)  
    #Créer un utilisateur  
    echo "Entrez le nom d'utilisateur:"  
    read username  
    sudo adduser $username  
    ;;  
  2)  
    #Supprimer un utilisateur  
    echo "Entrez le nom d'utilisateur à supprimer:"  
    read username  
    sudo deluser $username  
    ;;  
  3)  
    #Changer le mot de passe  
    echo "Entrez le nom d'utilisateur:"  
    read username  
    sudo passwd $username  
    ;;  
  4)  
    #Afficher des informations sur l'utilisateur  
    echo "Entrez le nom d'utilisateur:"  
    read username  
    lastlog -u $username  
    ;;  
  5)  
    #Quitter  
    exit 0  
    ;;  
  *)  
    echo "Choix invalide."  
    ;;  
esac  

**Voici un squelette de code PowerShell qui pourrait être utilisé pour administrer une machine Windows à partir d’un Windows Server :**

function Show-MainMenu {
    Clear-Host
    Write-Host "========================="
    Write-Host "      MENU PRINCIPAL     "
    Write-Host "========================="
    Write-Host "1. Cible : Ordinateur"
    Write-Host "2. Cible : Utilisateur"
    Write-Host "3. Quitter"
    Write-Host "========================="
    $choice = Read-Host "Choisissez une option"
    
    switch ($choice) {
        1 { Show-ComputerMenu }
        2 { Show-UserMenu }
        3 { exit }
        default { Write-Host "Option invalide !"; Start-Sleep -Seconds 1; Show-MainMenu }
    }
}

function Show-UserMenu {
    Clear-Host
    Write-Host "--- Actions sur un utilisateur ---"
    Write-Host "1. Création de compte utilisateur"
    Write-Host "2. Changement de mot de passe"
    Write-Host "3. Suppression de compte utilisateur local"
    Write-Host "4. Informations sur l'utilisateur"
    Write-Host "5. Retour au menu principal"
    $choice = Read-Host "Choisissez une option"
    
    switch ($choice) {
        1 { $user = Read-Host "Nom de l'utilisateur"; New-LocalUser -Name $user -NoPassword }
        2 { $user = Read-Host "Nom de l'utilisateur"; Set-LocalUser -Name $user -Password (Read-Host -AsSecureString "Nouveau mot de passe") }
        3 { $user = Read-Host "Nom de l'utilisateur"; Remove-LocalUser -Name $user }
        4 { Show-UserInfoMenu }
        5 { Show-MainMenu }
        default { Write-Host "Option invalide !"; Start-Sleep -Seconds 1; Show-UserMenu }
    }
}

function Show-UserInfoMenu {
    Clear-Host
    Write-Host "--- Informations sur un utilisateur ---"
    Write-Host "1. Groupes d’appartenance"
    Write-Host "2. Retour"
    $choice = Read-Host "Choisissez une option"
    
    switch ($choice) {
        1 { $user = Read-Host "Nom de l'utilisateur"; Get-LocalGroupMember -Group $user }
        2 { Show-UserMenu }
        default { Write-Host "Option invalide !"; Start-Sleep -Seconds 1; Show-UserInfoMenu }
    }
}

function Show-ComputerMenu {
    Clear-Host
    Write-Host "--- Actions sur l'ordinateur ---"
    Write-Host "1. Arrêt"
    Write-Host "2. Redémarrage"
    Write-Host "3. Informations sur l'ordinateur"
    Write-Host "4. Retour au menu principal"
    $choice = Read-Host "Choisissez une option"
    
    switch ($choice) {
        1 { Stop-Computer -Force }
        2 { Restart-Computer -Force }
        3 { Show-ComputerInfoMenu }
        4 { Show-MainMenu }
        default { Write-Host "Option invalide !"; Start-Sleep -Seconds 1; Show-ComputerMenu }
    }
}

function Show-ComputerInfoMenu {
    Clear-Host
    Write-Host "--- Informations sur l'ordinateur ---"
    Get-ComputerInfo | Select-Object CsName, OsName, OsArchitecture, WindowsVersion
    Read-Host "Appuyez sur Entrée pour continuer..."
    Show-ComputerMenu
}

Show-MainMenu

## Conclusion  


