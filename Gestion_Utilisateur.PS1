# Powershell.PS1
# Script PowerShell - Mohamed - Projet 2 VO.1.2 - 24/04/25
# Gestion des utilisateurs localement ou à distance via WinRM

# Connexion WinRam 

$isRemote = Read-Host "Gérer un système distant via WinRM ? (o/n)"

if ($isRemote -eq "o" -or $isRemote -eq "O") {
    $remoteHost = Read-Host "Adresse IP ou nom d'hôte du client"
    $remoteUser = Read-Host "Nom d'utilisateur distant (avec droits admin)"
    $remoteCred = Get-Credential -UserName $remoteUser -Message "Entrez le mot de passe"
} else {
    $remoteHost = $null
    $remoteCred = $null
}

# Execution de la commande localement ou via WinRM

function Invoke-CommandLocalOrRemote {
    param (
        [string]$commande
    )
    if ($remoteHost) {
        Invoke-Command -ComputerName $remoteHost -Credential $remoteCred -ScriptBlock {
            param($cmd)
            Invoke-Expression $cmd
        } -ArgumentList $commande
    } else {
        Invoke-Expression $commande
    }
}

# Création d'utilisateur

function New-UserAccount {
    $username = Read-Host "Nom d'utilisateur à créer"
    Invoke-CommandLocalOrRemote "net user $username /add"
    Write-Host "Utilisateur $username créé avec succès."
}

# Changement de mot de passe

function Set-UserPassword {
    $username = Read-Host "Nom d'utilisateur"
    $password = Read-Host "Nouveau mot de passe" -AsSecureString
    $passPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
    )
    Invoke-CommandLocalOrRemote "net user $username $passPlain"
    Write-Host "Mot de passe pour $username changé avec succès."
}

# Suppression d'utilisateur

function Remove-UserAccount {
    $username = Read-Host "Nom d'utilisateur à supprimer"
    Invoke-CommandLocalOrRemote "net user $username /delete"
    Write-Host "Utilisateur $username supprimé avec succès."
}

# Désactivation d'utilisateur

function Disable-UserAccount {
    $username = Read-Host "Nom d'utilisateur à désactiver"
    Invoke-CommandLocalOrRemote "net user $username /active:no"
    Write-Host "Utilisateur $username désactivé avec succès."
}

# Menu principal

do {
    Write-Host "Menu de gestion des utilisateurs"
    Write-Host "1. Création de compte utilisateur"
    Write-Host "2. Changement de mot de passe"
    Write-Host "3. Suppression de compte utilisateur"
    Write-Host "4. Désactivation de compte utilisateur"
    Write-Host "5. Quitter"
    $choix = Read-Host "Votre choix (1-5)"

    switch ($choix) {
        "1" { New-UserAccount }
        "2" { Set-UserPassword }
        "3" { Remove-UserAccount }
        "4" { Disable-UserAccount }
        "5" { break }
        default {
            Write-Host "Choix invalide. Réessayez."
        }
    }
} while ($true)


