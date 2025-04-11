## Utilisation du script Bash ( Ubuntu vers Ubuntu pour une première phase de test ) 

### Étape 1 :   
Script édité sur VS et enregistré sur le serveur
Au préalable donner les droits d’exécution au script via la commande: chmod *****.sh  

### Étape 2 :  
Se connecter en SSH au client 

### Étape 3 : Lancer le script  
.*****/.sh  

### Étape 4 : Utiliser le menu interactif  
Une fois lancé, le script affiche un menu simple avec plusieurs choix,
Il suffit d’entrer un chiffre pour effectuer une action.   

## Utilisation du script PowerShell (administration d’un client Windows)  
⚠Le script PowerShell est en cours de développement, mais voici les bases :  

### Étape 1 : Activer le PowerShell Remoting sur le client  
Dans une console PowerShell, faire cette commande :  
Enable-PSRemoting -Force  

### Étape 2 : Lancer la commande à distance depuis le serveur Windows  
.\admin_client_windows.ps1  
Ce script affichera des informations sur le système Windows distant (nom de l’OS, utilisateurs, services actifs…).  

### En cas de problème  
Si la connexion SSH échoue : vérifier l'adresse IP, que le serveur a bien la clé SSH du client  

Si le script ne s’exécute pas : ajouter set -x en début de script pour le mode debug  

Pour PowerShell, vérifier que WinRM est activé, et que le pare-feu autorise les connexions  


