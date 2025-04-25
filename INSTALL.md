
## 🔧 Prérequis techniques à l'exécution des scripts

### 1. Prérequis généraux
Avant d'exécuter les scripts, assurez-vous que votre environnement est correctement configuré. Les exigences peuvent varier selon votre système d'exploitation (Windows ou Linux).

---

### 2. Prérequis pour Linux 🐧

- **Système d'exploitation :** Debian 12 (CLI) SRVLX01
- **Langage de script :** Bash
  - **Bash :** Préinstallé sur la plupart des distributions Linux modernes.
- **Dépendances réseau :**  
  - **IP :** 172.16.10.10  
  - **Masque :** 255.255.255.0
- **Gestionnaire de paquets :** Utilisez `apt` (Debian/Ubuntu).
- **Permissions :** Certains scripts nécessitent des privilèges superutilisateur (`sudo`) pour installer des paquets ou exécuter des actions système.
- **Connexion distante :** SSH activé.

---

### 3. Prérequis pour Windows 🖥️

- **Système d'exploitation :** Windows Server 2022 (GUI) SRVWIN01
- **Langage de script :** PowerShell Core dernière version LTS (7.4)
  - **PowerShell :** Vérifiez que PowerShell est installé et opérationnel.
- **Dépendances réseau :**  
  - **IP :** 172.16.10.5  
  - **Masque :** 255.255.255.0
- **Permissions :** Droits administratifs requis pour installer des modules ou exécuter des scripts élevés.
- **Connexion distante :** SSH activé.

  # ⚙️ Installation & Configuration de WinRM

Ce guide décrit les étapes nécessaires pour configurer WinRM sur deux machines (client et serveur) afin de permettre l'exécution de commandes PowerShell à distance.

## 🔧 Configuration côté Serveur (Machine à administrer)

1. **Activer WinRM** :
   ```powershell
   Enable-PSRemoting -Force
   ```

2. **Autoriser l'authentification de base (Basic)** :
   ```powershell
   Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
   ```
3. **Changer le profil réseau en Privé** 

    Get-NetConnectionProfile  

    Note le Name de l’interface (souvent "Réseau non identifié").  

    Puis exécute :  

    Set-NetConnectionProfile -InterfaceAlias "Ethernet" -NetworkCategory Private  

      (⚠️ Remplace "Ethernet" par l’alias que tu as vu à l’étape précédente.)  
  

4. **Ajouter l’utilisateur distant au groupe `Remote Management Users`** :
   ```powershell
   net localgroup "Remote Management Users" NOM_UTILISATEUR /add
   ```

5. **Vérifier si WinRM répond** :
   ```powershell
   Test-WSMan
   ```

---

## 💻 Configuration côté Client (Machine d’administration)

1. **Autoriser le trafic non chiffré** :
   ```powershell
   Set-Item -Path WSMan:\localhost\Client\AllowUnencrypted -Value $true
   ```

2. **Tester la connectivité** avec le serveur :
   ```powershell
   Test-WSMan -ComputerName <IP_ou_Nom_Du_Serveur>
   ```

---

> 📜 Remarque : Assurez-vous que le **port 5985** (HTTP WinRM) est ouvert sur le pare-feu si les machines ne sont pas sur le même réseau local.



---

## ❓ FAQ

### 1. **Comment exécuter un script Bash sous Linux ?**
   - Ouvrez un terminal, naviguez jusqu'au répertoire contenant votre script, puis tapez :
     ```bash
     ./mon_script.sh
     ```
   - Si vous rencontrez une erreur de permissions, appliquez :
     ```bash
     chmod +x mon_script.sh
     ```

### 2. **Le script ne fonctionne pas, que faire ?**
   - **Lisez les messages d'erreur :** Ils peuvent indiquer la cause du problème (dépendance manquante, problème de droits, etc.).
   - **Vérifiez les dépendances :** Assurez-vous que toutes les librairies ou modules requis sont installés.
   - **Consultez la documentation :** Sections "Dépendances" et "Installation" de ce guide.
   - **Sur Linux :**
     ```bash
     sudo apt-get update
     sudo apt-get upgrade nom_du_package
     ```

### 3. **Pourquoi certaines commandes échouent-elles ?**
   - Certaines commandes nécessitent des privilèges élevés.  
     - Sur Linux : Utilisez `sudo`.
     - Sur Windows : Lancez l'invite de commandes en tant qu'administrateur (clic droit > "Exécuter en tant qu'administrateur").

### 4. **Le script semble se bloquer ou ralentir, que faire ?**
   - Surveillez l'utilisation des ressources :
     - **Windows :** Gestionnaire des tâches.
     - **Linux :** Commande `top`.
   - Certains processus peuvent être longs (ex. téléchargement de fichiers lourds). Soyez patient ou suivez l'avancement dans le terminal.

---

👉 Pour toute autre question, veuillez consulter la documentation complète ou contacter l'administrateur système.
