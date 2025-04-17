## TSSR-PARIS-2503-P2-G1

### The scripting project : Administration de Machines Distantes via Scripts Bash et PowerShell

### 1. Présentation du Projet

Ce projet vise à développer deux scripts permettant l'administration de machines distantes sur un réseau unique :

Un script Bash pour administrer des machines Ubuntu depuis un serveur Debian.

Un script PowerShell pour administrer des machines Windows depuis un serveur Windows Server.

(Tâches secondaires) : Un script Bash pour administrer des machines Windows et un script PowerShell pour administrer des machines Ubuntu.

Les scripts devront interagir avec les machines distantes et permettre :

L'exécution de commandes d'administration (création/suppression d'utilisateurs, gestion des groupes, gestion des services, etc.).

La collecte d'informations système (utilisateurs locaux, services, partitions, etc.).



### 2. Objectifs du Sprint 3  

Finaliser le développement des scripts Bash pour administrer des machines Ubuntu à distance via SSH depuis un serveur Debian.  

Tester les scripts Bash sur des machines physiques et des machines virtuelles Ubuntu.  

Commencer le développement des scripts PowerShell pour l'administration de machines Windows.  

Mettre à jour la documentation du projet, notamment le fichier README.md, INSTALL.md et USER_GUIDE.md. 

Préparer une démonstration du Sprint 3 avec :

Les scripts Bash finalisés.

Une première version fonctionnelle des scripts PowerShell, en test sur des machines Windows hors de l'environnement Proxmox.

### 3. Travail déjà réalisé

**Scripts Bash**

Tous les scripts Bash sont finalisés.

Les scripts ont été testés avec succès entre plusieurs machines physiques et une machine virtuelle Ubuntu via SSH.

Ils permettent :

L'exécution de commandes d'administration (création et suppression d'utilisateurs, gestion des groupes, gestion des services).

La collecte d'informations système (liste des utilisateurs locaux, état des services, partitions disque, etc.).

Les scripts sont organisés dans le dépôt GitHub, dans le dossier Script.

**Scripts PowerShell**

Le développement des scripts PowerShell a débuté.

Certaines fonctionnalités d'administration de base sont déjà opérationnelles.

Ces scripts seront utilisés pour la démonstration sur des machines Windows (hors Proxmox) pendant la présentation du Sprint 3.

## Documentation

Le fichier README.md a été mis à jour pour refléter l'état actuel du projet et des scripts disponibles.

### 4. Objectif du Sprint 4

Finaliser tous les scripts PowerShell pour l'administration de machines Windows.

Finaliser la configuration de WinRM sur les machines virtuelles sous Proxmox pour permettre la démonstration de l'administration distante.

Compléter et finaliser toute la documentation du projet (incluant la description détaillée des scripts, instructions d'installation et d'utilisation).

Finaliser la création et l'intégration d'un fichier de journalisation log_evt.log :

- Pour les actions réalisées sur les machines Linux.

- Pour les actions réalisées sur les machines Windows.


### 5. Documentation (README.md,INSTALL.md,USER_GUIDE.md)

**README.md (Documentation générale) :** Présentation générale du projet : Décrire l'objectif du projet, la mise en place des machines virtuelles et des scripts d'administration.   
**Objectifs finaux :** Détails sur l'administration des machines via Bash et PowerShell, la collecte d'informations, et la gestion des utilisateurs/ordinateurs.  
**Technologies utilisées :** Bash, PowerShell, Proxmox, serveurs Debian et Windows.  

**INSTALL.md (Documentation administrateur):** Instructions d'installation et de configuration.

**USER_GUIDE.md (Documentation utilisateur) :** Manuel utilisateur avec explications des commandes.

### 6. Organisation et rôles de l'équipe

**Chaque membre est assigné à une partie du projet et assure le suivi des daily meetings:**

**Mohamed Keita (Product Owner)** de cette semaine est le représentant du client. 
Il est responsable de la définition des besoins et de la priorisation des tâches. Il veille à ce que le projet réponde aux attentes du client.

**Omar (Scrum Master)** cette semaine est garant de la bonne application de la méthode Scrum. 
Il est responsable de la communication entre les membres de l'équipe et de la bonne réalisation des tâches.

**Mohamed Mben et Priscilla Manedji (Dev)**, Développeurs qui collaborent avec le PO et le Scrum Master pour mettre en œuvre les fonctionnalités du projet, en particulier le développement des scripts et la gestion de la documentation.

### 7. Problèmes rencontrés

Certains scripts PowerShell ne s'exécutent pas correctement.

Difficultés à faire fonctionner certains outils en WinRM.

Manque de permissions sur certaines commandes systèmes.

Complexité de certaines commandes PowerShell pour un script interactif.

Nécessité de debuggerligne par ligne.

### Conclusion
Le projet avance bien malgré quelques blocages techniques.
Nous avons un environnement de test fonctionnel, un script Bash déjà opérationnel, et les bases sont posées pour le reste.
L’objectif pour le sprint suivant est de stabiliser tous les scripts, avancer sur PowerShell et finaliser la documentation pour rendre le projet complet et présentable.

