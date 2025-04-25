# Mohamed - Script PowerShell Projet 2 VO.2.0 - 24/04/25
# Gestion des groupes utilisateurs localement ou à distance via WinRM

# Connexion distante ou locale
$isRemote = Read-Host "Gérer un système distant via WinRM ? (o/n)"

if ($isRemote -eq "o" -or $isRemote -eq "O") {
    $remoteComputer = Read-Host "Nom d'hôte ou IP de la machine distante"
    $remoteUser = Read-Host "Nom d'utilisateur (format : domaine\utilisateur ou ordinateur\utilisateur)"
    $remotePassword = Read-Host "Mot de passe" -AsSecureString
    $cred = New-Object System.Management.Automation.PSCredential ($remoteUser, $remotePassword)

    function Executer($scriptBlock, $args) {
        Invoke-Command -ComputerName $remoteComputer -Credential $cred -ScriptBlock $scriptBlock -ArgumentList $args
    }
} else {
    function Executer($scriptBlock, $args) {
        & $scriptBlock @args
    }
}

# Ajouter un utilisateur au groupe Administrateurs
function Add-UserToAdminGroup {
    $username = Read-Host "Nom d'utilisateur à ajouter"
    if (-not $username) {
        Write-Host "Nom d'utilisateur vide. Action annulée."
        return
    }
    $script = { param($u) Add-LocalGroupMember -Group "Administrateurs" -Member $u }
    Executer $script @($username)
    Write-Host "$username ajouté au groupe Administrateurs."
}

# Ajouter un utilisateur à un groupe local
function Add-UserToLocalGroup {
    $username = Read-Host "Nom d'utilisateur à ajouter"
    $groupname = Read-Host "Nom du groupe"
    if (-not $username -or -not $groupname) {
        Write-Host "Informations incomplètes. Action annulée."
        return
    }
    $script = { param($g, $u) Add-LocalGroupMember -Group $g -Member $u }
    Executer $script @($groupname, $username)
    Write-Host "$username ajouté au groupe $groupname."
}

# Retirer un utilisateur d'un groupe local
function Remove-UserFromLocalGroup {
    $username = Read-Host "Nom d'utilisateur à retirer"
    $groupname = Read-Host "Nom du groupe"
    if (-not $username -or -not $groupname) {
        Write-Host "Informations incomplètes. Action annulée."
        return
    }
    $script = { param($g, $u) Remove-LocalGroupMember -Group $g -Member $u }
    Executer $script @($groupname, $username)
    Write-Host "$username retiré du groupe $groupname."
}

# Afficher les groupes locaux et leurs membres
function Show-GroupsAndMembers {
    $script = {
        Get-LocalGroup | ForEach-Object {
            $group = $_.Name
            $members = (Get-LocalGroupMember -Group $group | Select-Object -ExpandProperty Name) -join ", "
            [PSCustomObject]@{ Groupe = $group; Membres = $members }
        }
    }
    $resultats = Executer $script @()
    $resultats | Format-Table -AutoSize
    Write-Host ""
}

# Menu principal
do {
    Write-Host ""
    Write-Host "Menu de gestion des groupes utilisateurs"
    Write-Host "1. Ajouter un utilisateur au groupe Administrateurs"
    Write-Host "2. Ajouter un utilisateur à un groupe local"
    Write-Host "3. Retirer un utilisateur d'un groupe local"
    Write-Host "4. Quitter"
    Write-Host "5. Afficher tous les groupes et leurs membres"
    $choix = Read-Host "Votre choix (1-5)"

    switch ($choix) {
        "1" { Add-UserToAdminGroup }
        "2" { Add-UserToLocalGroup }
        "3" { Remove-UserFromLocalGroup }
        "4" { Write-Host "Fermeture du script."; break }
        "5" { Show-GroupsAndMembers }
        default { Write-Host "Choix invalide. Veuillez réessayer." }
    }
} while ($true)   

