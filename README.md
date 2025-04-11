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



### 2. Objectifs du Sprint 2

===> Développer plusieurs scripts Bash avec différentes fonctionnalités d'administration.

===> Tester les scripts sur un vrai réseau entre deux machines virtuelles (Debian et Ubuntu).

===> Lancer le développement du script PowerShell côté Windows.

===> Structurer et documenter tout le projet sur GitHub.

===> Commencer à gérer les retours d’erreurs et problèmes de compatibilité.

### 3. Travail déjà réalisé

===> Mise en réseau de 2 machines : une Debian (serveur) et une Ubuntu (client) en réseau interne.

===> Développement de 4 scripts Bash :  
✅ 1 script fonctionne parfaitement  
⚠️ 3 scripts rencontrent encore des bugs (chemins, commandes non reconnues ou permissions)  

===> Menu interactif côté Bash en cours d’amélioration.  

===> Dépôt GitHub initialisé avec la structure de fichiers.  


### 4. Objectif du Sprint 3

===> Corriger les erreurs dans les 3 scripts Bash restants.

===> Ajouter de nouvelles fonctionnalités (ex : logs, amélioration des menus).

===> Continuer le développement du script PowerShell.  

===> Finaliser une première version complète du projet.

===> Renforcer la documentation (README, INSTALL, USER_GUIDE).

### 5. Documentation (README.md,INSTALL.md,USER_GUIDE.md)

**README.md (Documentation générale) :** Présentation générale du projet : Décrire l'objectif du projet, la mise en place des machines virtuelles et des scripts d'administration.   
**Objectifs finaux :** Détails sur l'administration des machines via Bash et PowerShell, la collecte d'informations, et la gestion des utilisateurs/ordinateurs.  
**Technologies utilisées :** Bash, PowerShell, Proxmox, serveurs Debian et Windows.  

**INSTALL.md (Documentation administrateur):** Instructions d'installation et de configuration.

**USER_GUIDE.md (Documentation utilisateur) :** Manuel utilisateur avec explications des commandes.

### 6. Organisation et rôles de l'équipe

**Chaque membre est assigné à une partie du projet et assure le suivi des daily meetings:**

**Mohamed Ben Slim (Product Owner)** de cette deuxième semaine est le représentant du client. 
Il est responsable de la définition des besoins et de la priorisation des tâches. Il veille à ce que le projet réponde aux attentes du client.

**Priscilla MANEDJI NGOUANA (Scrum Master)** cette semaine est garante de la bonne application de la méthode Scrum. 
Elle est responsable de la communication entre les membres de l'équipe et de la bonne réalisation des tâches.

**Mohamed KEITA et OMAR (Dev)**, Développeurs qui collaborent avec le PO et le Scrum Master pour mettre en œuvre les fonctionnalités du projet, en particulier le développement des scripts et la gestion de la documentation.

### 7. Problèmes rencontrés

Quelques scripts Bash ne s'exécutent pas correctement (erreurs de chemin, mauvaise détection etc.).

Difficultés à faire fonctionner certains outils en SSH sur Ubuntu.

Manque de permissions sur certaines commandes systèmes.

Complexité de certaines commandes Bash pour un script interactif.

Nécessité de debug ligne par ligne.

### Conclusion
Le projet avance bien malgré quelques blocages techniques.
Nous avons un environnement de test fonctionnel, un script Bash déjà opérationnel, et les bases sont posées pour le reste.
L’objectif pour le sprint suivant est de stabiliser tous les scripts, avancer sur PowerShell et finaliser la documentation pour rendre le projet complet et présentable.

