# Auteur : Zampa

# Version : 1.1 - Script PowerShell d'administration distante simple



# Saisie des informations de connexion

$remoteHost = Read-Host "Adresse IP"

$remoteUser = Read-Host "Nom d'utilisateur distant (format Domaine\Utilisateur)"

$securePassword = Read-Host "Mot de passe" -AsSecureString

$cred = New-Object System.Management.Automation.PSCredential ($remoteUser, $securePassword)



function Show-Menu {

    Clear-Host

    Write-Host "===== Menu ====="

    Write-Host "1. Derniere connexion"

    Write-Host "2. Dernier changement de mot de passe"

    Write-Host "3. Session ouvertes"

    Write-Host "4. Quitter"

}



do {

    Show-Menu

    $choice = Read-Host "Choix (1-4)"



    switch ($choice) {

        '1' {

            $user = Read-Host "Nom d'utilisateur"

            Invoke-Command -ComputerName $remoteHost -Credential $cred -ScriptBlock {

                param($u)

                Get-WinEvent -FilterHashtable @{ LogName = 'Security'; Id = 4624 } -MaxEvents 5000 |

                    Where-Object { $_.Properties[5].Value -eq $u } |

                    Select-Object -First 1 -ExpandProperty TimeCreated

            } -ArgumentList $user

            Pause

        }

        '2' {

            $user = Read-Host "Nom d'utilisateur"

            Invoke-Command -ComputerName $remoteHost -Credential $cred -ScriptBlock {

                param($u)

                net user $u 2>$null | Where-Object { $_ -match "Dernier changement" }

            } -ArgumentList $user

            Pause

        }

        '3' {

            $user = Read-Host "Nom d'utilisateur"

            Invoke-Command -ComputerName $remoteHost -Credential $cred -ScriptBlock {

                param($u)

                quser 2>$null | Select-String $u | ForEach-Object { $_.Line }

            } -ArgumentList $user

            Pause

        }

        '4' { break }

        default { Pause }

    }

} while ($choice -ne '4')