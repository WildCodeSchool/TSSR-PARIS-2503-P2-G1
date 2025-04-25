# Powershell.PS1
# Script PowerShell - Mohamed - Projet 2 VO.1.0 - 24/04/25
# Gestion d’un ordinateur local ou distant via WinRM

# Demande si c'est une machine distante
$isRemote = Read-Host "Gérer un système distant via WinRM ? (o/n)"

if ($isRemote -eq "o" -or $isRemote -eq "O") {
    $remoteHost = Read-Host "Entrez l'adresse IP ou le nom d'hôte du client"
    $remoteUser = Read-Host "Entrez le nom d'utilisateur (domaine\utilisateur ou utilisateur)"
    $remoteCred = Get-Credential -UserName $remoteUser -Message "Entrez les informations d'authentification"
} else {
    $remoteHost = $null
    $remoteCred = $null
}

# Exécution d'une commande locale ou distante
function Executer {
    param([string]$commande)
    if ($remoteHost) {
        Invoke-Command -ComputerName $remoteHost -Credential $remoteCred -ScriptBlock {
            param($cmd)
            Invoke-Expression $cmd
        } -ArgumentList $commande
    } else {
        Invoke-Expression $commande
    }
}

# Verrouillage de la session
function Lock-Session {
    if ($remoteHost) {
        $lockCmd = 'rundll32.exe user32.dll,LockWorkStation'
        Executer $lockCmd
    } else {
        if (Get-Command "rundll32.exe" -ErrorAction SilentlyContinue) {
            rundll32.exe user32.dll,LockWorkStation
        } else {
            Write-Host "Aucune méthode de verrouillage supportée sur ce système."
        }
    }
}

# Détection de l'OS distant (pour affichage)
function Get-RemoteOS {
    if ($remoteHost) {
        try {
            $osInfo = Invoke-Command -ComputerName $remoteHost -Credential $remoteCred -ScriptBlock {
                (Get-CimInstance Win32_OperatingSystem).Caption
            }
            return $osInfo
        } catch {
            Write-Host "Impossible de déterminer l'OS distant : $_"
            return "Inconnu"
        }
    } else {
        return (Get-CimInstance Win32_OperatingSystem).Caption
    }
}

# Affichage de l'OS
if ($remoteHost) {
    $osDistant = Get-RemoteOS
    Write-Host "Système distant détecté : $osDistant"
} else {
    $osLocal = Get-RemoteOS
    Write-Host "Système local détecté : $osLocal"
}
Start-Sleep -Seconds 2

# Menu principal
do {
    Clear-Host
    Write-Host "   Menu Principal "
    Write-Host "Choisissez une option :"
    Write-Host "1. Arrêt"
    Write-Host "2. Redémarrage"
    Write-Host "3. Verrouillage"
    Write-Host "4. Quitter le script"

    $choix = Read-Host "Entrez votre choix (1-4)"

    switch ($choix) {
        "1" {
            Write-Host "Arrêt de l'ordinateur..."
            Executer "Stop-Computer -Force"
            break
        }
        "2" {
            Write-Host "Redémarrage de l'ordinateur..."
            Executer "Restart-Computer -Force"
            break
        }
        "3" {
            Write-Host "Verrouillage de la session..."
            Lock-Session
            Read-Host "Appuyez sur Entrée pour revenir au menu..."
        }
        "4" {
            Write-Host "Fermeture du script."
            break
        }
        Default {
            Write-Host "Choix invalide. Veuillez réessayer."
            Read-Host "Appuyez sur Entrée pour continuer..."
        }
    }
} while ($choix -ne "4")




