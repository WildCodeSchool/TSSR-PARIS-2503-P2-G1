# Script de gestion de mise à jour via WinRM avec Invoke-Command

# Demander une seule fois les informations
$ip = Read-Host "Entrez l'adresse IP de la machine distante"
$user = Read-Host "Entrez le nom d'utilisateur distant"
$password = Read-Host "Entrez le mot de passe de l'utilisateur distant" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential ($user, $password)

# Boucle principale
while ($true) {
    Write-Host
    Write-Host "Menu - Maintenance système sur $ip"
    Write-Host "1. Mettre à jour la liste des paquets (winget upgrade --all --accept-source-agreements)"
    Write-Host "2. Mettre à jour tous les paquets (winget upgrade --all)"
    Write-Host "3. Faire une mise à jour complète (update + upgrade)"
    Write-Host "4. Quitter"
    $choix = Read-Host "Votre choix"

    switch ($choix) {
        1 {
            Write-Host "Mise à jour de la liste des paquets..."
            Invoke-Command -ComputerName $ip -Credential $cred -ScriptBlock {
                winget upgrade --all --accept-source-agreements
            }
        }
        2 {
            Write-Host "Mise à jour des paquets installés..."
            Invoke-Command -ComputerName $ip -Credential $cred -ScriptBlock {
                winget upgrade --all
            }
        }
        3 {
            Write-Host "Mise à jour complète (update + upgrade)..."
            Invoke-Command -ComputerName $ip -Credential $cred -ScriptBlock {
                winget upgrade --all --accept-source-agreements
            }
        }
        4 {
            Write-Host "Fin du script !"
            break
        }
        Default {
            Write-Host "Choix invalide. Veuillez réessayer."
        }
    }
}
