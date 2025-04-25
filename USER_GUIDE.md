
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

## 2. Utilisation du script powershell (windows server 2022 → windows 11)

Ce guide explique comment utiliser le script `gestion_des_groupes.ps1` que nous avons choisi comme exemple pour gérer les groupes d'utilisateurs localement ou à distance avec WinRM.


### 1. Lancer le script

Depuis PowerShell (en tant qu'administrateur), accédez au répertoire du script, puis exécutez :
```powershell
.\gestion_des_groupes.ps1
```

### 2. Choix du mode

Une invite vous proposera :
```
Gérer un système distant via WinRM ? (o/n)
```
- `o` pour utiliser une machine distante (WinRM doit être configuré sur les deux machines).
- `n` pour gérer localement.

### 3. Menu de gestion
Une fois lancé, le script propose ce menu :
```
1. Ajouter au groupe Administrateurs
2. Ajouter à un groupe local
3. Retirer d'un groupe local
4. Quitter
```
Saisissez le numéro correspondant à votre choix, puis suivez les invites (nom de l'utilisateur et du groupe).

---

## 📃 FAQ - Questions Fréquemment Posées

### ❓ Le script me retourne "Access is denied", que faire ?
- Assurez-vous que l'utilisateur distant est membre du groupe `Remote Management Users`.
- Activez `AllowUnencrypted` et `Basic Authentication` sur le **serveur** et le **client**.

### ❓ Le groupe "Remote Management Users" est introuvable ?
- Il peut apparaître localement avec le nom "Utilisateurs de gestion à distance" en français. Utilisez ce nom avec la commande `net localgroup`.

### ❓ "The WinRM client cannot process the request..."
- Cela signifie souvent que `AllowUnencrypted` est à `false` sur le client. Utilisez :
  ```powershell
  Set-Item -Path WSMan:\localhost\Client\AllowUnencrypted -Value $true
  ```

### ❓ Comment tester la connexion ?
- Utilisez `Test-WSMan -ComputerName <IP>` pour vérifier la communication.

### ❓ Comment exécuter une commande distante simple ?
- Exemple :
  ```powershell
  Invoke-Command -ComputerName <IP> -Credential (Get-Credential) -Authentication Basic -ScriptBlock { hostname }
  ```


