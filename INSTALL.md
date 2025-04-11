
## 🔧 Prérequis techniques à l'exécution des scripts

### 1. Prérequis généraux
Avant d'exécuter les scripts, assurez-vous que votre environnement est correctement configuré. Les exigences peuvent varier selon votre système d'exploitation (Windows ou Linux).

---

### 2. Prérequis pour Windows 🖥️

- **Système d'exploitation :** Windows Server 2022 (GUI) SRVWIN01
- **Langage de script :** PowerShell Core dernière version LTS (7.4).
  - **PowerShell :** Assurez-vous que PowerShell est installé et fonctionnel.
- **Dépendances réseau:** Ip : 172.16.10.5, masque : 255.255.255.0
- **Permissions :** Assurez-vous d'avoir les droits administratifs sur votre système pour installer certains paquets ou exécuter des scripts nécessitant des privilèges élevés.
-Connexion as distance en ssh.
Travail déjà réalisé

---

### 3. Prérequis pour Linux 🐧

- **Système d'exploitation :** Debian 12 (CLI) SRVLX01
- **Langage de script :** Shell bash
  - **Bash :** Préinstallé sur la plupart des distributions Linux modernes.
- **Dépendances réseau:** Ip : 172.16.10.10, masque : 255.255.255.0 
  - **Gestionnaire de paquets :** Utilisez `apt` (pour Debian/Ubuntu).
- **Permissions :** Vous devrez peut-être exécuter certains scripts avec des privilèges superutilisateur (`sudo`) pour installer des paquets ou effectuer certaines actions.
Connexion as distance en ssh.

---

## ❓ FAQ

### 1. **Comment exécuter un script Bash sous Linux ?**
   - Ouvrez un terminal, naviguez jusqu'au répertoire contenant votre script, et tapez :
     ```bash
     ./mon_script.sh
     ```
   - Si vous rencontrez une erreur de permissions, donnez des droits d'exécution avec :
     ```bash
     chmod +x mon_script.sh
     ```

### 2. **Le script ne fonctionne pas, que faire ?**
   - **Lisez les messages d'erreur :** Ils peuvent vous indiquer la cause du problème, comme une dépendance manquante ou un problème de permissions.
   - **Vérifiez les dépendances :** Assurez-vous que toutes les bibliothèques ou paquets requis par le script sont installés.
   - **Consultez la documentation :** Vérifiez les sections "Dépendances" et "Installation" de cette documentation.
   - **Sur Linux :**
     Utilisez votre gestionnaire de paquets pour mettre à jour les packages nécessaires :
     ```bash
     sudo apt-get update
     sudo apt-get upgrade nom_du_package
     ```

### 3. **Pourquoi certaines commandes échouent-elles ?**
   - Certaines commandes nécessitent des privilèges élevés pour être exécutées. Sur Linux, utilisez `sudo` pour exécuter le script ou la commande avec des droits administrateur.
   - Sur Windows, essayez d'exécuter l'invite de commande en tant qu'administrateur (clic droit > "Exécuter en tant qu'administrateur").

### 4. **Le script semble se bloquer ou se ralentir, que faire ?**
   - Vérifiez l'utilisation des ressources système via le gestionnaire de tâches (Windows) ou la commande `top` (Linux).
- Certains scripts peuvent prendre du temps en fonction de leur tâche (par exemple, le téléchargement de fichiers lourds). Si possible, attendez que le processus se termine ou surveillez son progrès.

Pour toute autre question, veuillez consulter la documentation complète ou contacter l'administrateur système.

