
# 📚 Guide d'utilisation des Scripts

---

## 1. Utilisation du script Bash (Debian → Ubuntu)

### Étape 1 : Préparation du script
- Le script est édité via Visual Studio Code et enregistré sur le serveur.
- Donner les droits d’exécution au script avec la commande :
  ```bash
  chmod +x nom_du_script.sh
  ```

### Étape 2 : Connexion SSH
- Se connecter au client Ubuntu via SSH.

### Étape 3 : Lancement du script
- Exécuter le script en tapant :
  ```bash
  ./nom_du_script.sh
  ```

### Étape 4 : Navigation dans le menu interactif
- Le script affichera un menu simple proposant plusieurs options.
- Entrer le numéro correspondant pour exécuter l'action souhaitée.

---

## 2. Utilisation du script PowerShell (Administration d'un client Windows)

⚠️ *Le script PowerShell est en cours de développement, voici les étapes pour l'utiliser :*

### Étape 1 : Activer le PowerShell Remoting sur le client
- Ouvrir une console PowerShell en mode administrateur et exécuter :
  ```powershell
  Enable-PSRemoting -Force
  ```

### Étape 2 : Exécuter le script depuis le serveur Windows
- Depuis votre session PowerShell, lancer :
  ```powershell
  .\admin_client_windows.ps1
  ```
- Le script affichera diverses informations sur le système distant (nom de l'OS, utilisateurs, services actifs, etc.).

---

## 3. Dépannage

- **Problème de connexion SSH :**  
  - Vérifier l'adresse IP et la clé SSH sur le serveur.

- **Le script Bash ne s'exécute pas :**  
  - Ajouter `set -x` en début du script pour activer le mode debug.

- **Problème côté PowerShell :**  
  - Vérifier que WinRM est activé.
  - S'assurer que le pare-feu Windows autorise les connexions distantes.

---

# ✅ Remarque
Ce guide sera mis à jour au fur et à mesure de l'avancée du projet, notamment avec la finalisation du script PowerShell.
