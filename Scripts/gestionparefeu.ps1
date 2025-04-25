# Demander IP et utilisateur une seule fois
$ip = Read-Host "Entrez l'adresse IP de la machine distante"
$user = Read-Host "Entrez le nom d'utilisateur distant"
$cred = Get-Credential "$user"
$session = New-PSSession -ComputerName $ip -Credential $cred -Authentication Default

while ($true) {
    Write-Host ""
    Write-Host "Menu - Gestion du Pare-feu sur $ip"
    Write-Host "1) Activer le pare-feu (avec accès RDP/WinRM)"
    Write-Host "2) Désactiver le pare-feu"
    Write-Host "3) Afficher les règles"
    Write-Host "4) Quitter"

    $choix = Read-Host "Choisissez une option"

    switch ($choix) {
        "1" {
            Write-Host "Activation du pare-feu sur $ip..."
            Invoke-Command -Session $session -ScriptBlock {
                # Réinitialiser le pare-feu et autoriser WinRM et RDP
                netsh advfirewall reset
                netsh advfirewall set allprofiles state on
                netsh advfirewall firewall add rule name="Autoriser WinRM" dir=in action=allow protocol=TCP localport=5985
                netsh advfirewall firewall add rule name="Autoriser RDP" dir=in action=allow protocol=TCP localport=3389
                "Pare-feu activé avec accès WinRM/RDP"
            }
        }

        "2" {
            Write-Host "Désactivation du pare-feu sur $ip..."
            Invoke-Command -Session $session -ScriptBlock {
                netsh advfirewall set allprofiles state off
                "Pare-feu désactivé"
            }
        }

        "3" {
            Write-Host "Règles de pare-feu sur $ip..."
            Invoke-Command -Session $session -ScriptBlock {
                netsh advfirewall firewall show rule name=all
            }
        }

        "4" {
            Write-Host "Fin du script."
            Remove-PSSession $session
            break
        }

        default {
            Write-Host "Option invalide."
        }
    }
}