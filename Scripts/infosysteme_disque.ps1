# Auteur : Priscilla
# Description : Script PowerShell d'administration distante
# Version : 0.0# Saisie des informations de connexion
$remoteHost = Read-Host "Nom d'hôte ou adresse IP du client Windows 11"
$remoteUser = Read-Host "Nom d'utilisateur distant (format Domaine\Utilisateur)"
$securePassword = Read-Host "Mot de passe" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential ($remoteUser, $securePassword)# Fonction principale d'exécution distante
function Run-RemoteCommand {
    param (
        [string]$scriptBlock
    )
    Invoke-Command -ComputerName $remoteHost -Credential $cred -ScriptBlock ([ScriptBlock]::Create($scriptBlock))
}# Fonctions d'administration
function Info-System {
    Write-Host "Version de l'OS"
    Run-RemoteCommand 'Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture'    Write-Host "`nDisques physiques"
    Run-RemoteCommand 'Get-PhysicalDisk | Select-Object FriendlyName, MediaType, Size'    Write-Host "`nPartitions et volumes"
    Run-RemoteCommand 'Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, SizeRemaining, Size'    Write-Host "`nEspace disque"
    Run-RemoteCommand 'Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free'    $folder = Read-Host "Entrez le chemin d’un dossier (ex: C:\Users)"
    Write-Host "`nEspace occupé par le dossier $folder"
    Run-RemoteCommand "Get-ChildItem -Path '$folder' -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum"
}function Info-Applications {
    Write-Host "`nApplications installées"
    Run-RemoteCommand 'Get-WmiObject -Class Win32_Product | Select-Object Name, Version'
}function Info-Services {
    Write-Host "`nServices actifs"
    Run-RemoteCommand 'Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object DisplayName, Status'
}function Info-Users {
    Write-Host "`nUtilisateurs locaux"
    Run-RemoteCommand 'Get-LocalUser | Select-Object Name, Enabled'
}function Info-RAM {
    Write-Host "`nMémoire RAM"
    Run-RemoteCommand 'Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory'
}# Menu principal
function Menu-Ordinateur {
    do {
        Write-Host "`nMENU D'ADMINISTRATION DU CLIENT WINDOWS 11 ($remoteHost)"
        Write-Host "1. Informations système et disques"
        Write-Host "2. Applications installées"
        Write-Host "3. Services actifs"
        Write-Host "4. Utilisateurs locaux"
        Write-Host "5. Mémoire RAM"
        Write-Host "6. Quitter"        $choix = Read-Host "Votre choix"
        switch ($choix) {
            "1" { Info-System }
            "2" { Info-Applications }
            "3" { Info-Services }
            "4" { Info-Users }
            "5" { Info-RAM }
            "6" { Write-Host "Déconnexion. À bientôt !" }
            default { Write-Host "Choix invalide. Veuillez réessayer." }
        }
    } while ($choix -ne "6")
}# Exécution du menu
Menu-Ordinateur