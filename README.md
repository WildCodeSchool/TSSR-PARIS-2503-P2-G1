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






