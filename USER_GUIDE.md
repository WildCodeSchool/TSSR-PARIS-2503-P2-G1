## Utilisation du script Bash (administration d’un client Ubuntu depuis un serveur Debian)

### Étape 1 : 
Le script est nommé admin_client_ubuntu.sh 
Avant toute chose, il faut donner les droits d’exécution au script via la commande:
chmod +x admin_client_ubuntu.sh

### ✅ Étape 2 : 

### ✅ Étape 3 : Lancer le script
./admin_client_ubuntu.sh

### ✅ Étape 4 : Utiliser le menu interactif
Une fois lancé, le script affiche un menu simple avec plusieurs choix :
1. 
2. 
3. 
4. 
5. 
6. 
7. 
8. 
9. Quitter
10. 
### 👉 Il suffit d’entrer un chiffre pour effectuer une action.

## 🪟 Utilisation du script PowerShell (administration d’un client Windows)
⚠️ Le script PowerShell est en cours de développement, mais voici les bases :

### ✅ Étape 1 : Activer le PowerShell Remoting sur le client
Dans une console PowerShell, faire cette commande :
Enable-PSRemoting -Force

### ✅ Étape 2 : Lancer la commande à distance depuis le serveur Windows
.\admin_client_windows.ps1
Ce script affichera des informations sur le système Windows distant (nom de l’OS, utilisateurs, services actifs…).

### ❌ En cas de problème
Si la connexion SSH échoue : vérifier l'adresse IP, que le serveur a bien la clé SSH du client

Si le script ne s’exécute pas : ajouter set -x en début de script pour le mode debug

Pour PowerShell, vérifier que WinRM est activé, et que le pare-feu autorise les connexions


