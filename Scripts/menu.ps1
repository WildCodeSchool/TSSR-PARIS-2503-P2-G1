# Menu.ps1

function Show-Menu {
    Clear-Host
    Write-Host "1) État de la machine"
    Write-Host "2) Gestion des groupes"
    Write-Host "3) Gestion des utilisateurs"
    Write-Host "4) Gestion du pare-feu"
    Write-Host "5) Gestion des répertoires"
    Write-Host "6) Mise à jour du système"
    Write-Host "7) Quitter`n"
}

do {
    Show-Menu
    $choix = Read-Host "Choisissez une option (1-7)"

    switch ($choix) {
        "1" { .\Etat_ordi.PS1 }
        "2" { .\Gestion_groupe.PS1 }
        "3" { .\Gestion_Utilisateur.PS1 }
        "4" { .\gestionparefeu.ps1 }
        "5" { .\gestionrepertoire.ps1 }
        "6" { .\maj.ps1 }
        "7" {
            Write-Host "Fin du script" -ForegroundColor Green
            break
        }
        default {
            Write-Host "`nOption invalide. Veuillez entrer un chiffre entre 1 et 7." -ForegroundColor Red
        }
    }

    if ($choix -ne "7") {
        Write-Host "`nAppuyez sur Entrée pour revenir au menu..."
        [void][System.Console]::ReadLine()
    }

} while ($choix -ne "7")
