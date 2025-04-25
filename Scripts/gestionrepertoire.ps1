# Demander l'adresse IP et l'utilisateur distant une seule fois
$ip = Read-Host "Entrez l'adresse IP de la machine distante"
$user = Read-Host "Entrez le nom d'utilisateur distant"
$cred = Get-Credential "$user"
$session = New-PSSession -ComputerName $ip -Credential $cred -Authentication Default

while ($true) {
    Write-Host ""
    Write-Host "Choisissez une option :"
    Write-Host "1. Créer un répertoire"
    Write-Host "2. Renommer un répertoire"
    Write-Host "3. Supprimer un répertoire"
    Write-Host "4. Quitter"

    $choix = Read-Host "Votre choix"

    switch ($choix) {
        "1" {
            $nom = Read-Host "Nom du répertoire à créer"

            Invoke-Command -Session $session -ScriptBlock {
                param($nom)
                if (Test-Path -Path $nom -PathType Container) {
                    Write-Output "Existe déjà."
                } else {
                    New-Item -ItemType Directory -Path $nom | Out-Null
                    Write-Output "Créé avec succès."
                }
            } -ArgumentList $nom
        }

        "2" {
            $ancien = Read-Host "Ancien nom du répertoire"

            $exists = Invoke-Command -Session $session -ScriptBlock {
                param($ancien)
                return Test-Path -Path $ancien -PathType Container
            } -ArgumentList $ancien

            if ($exists) {
                $nouveau = Read-Host "Nouveau nom"

                Invoke-Command -Session $session -ScriptBlock {
                    param($ancien, $nouveau)
                    Rename-Item -Path $ancien -NewName $nouveau
                    Write-Output "Renommé en $nouveau."
                } -ArgumentList $ancien, $nouveau
            } else {
                Write-Host "Le répertoire '$ancien' n'existe pas."
            }
        }

        "3" {
            $nom = Read-Host "Nom du répertoire à supprimer"

            Invoke-Command -Session $session -ScriptBlock {
                param($nom)
                if (Test-Path -Path $nom -PathType Container) {
                    Remove-Item -Path $nom -Recurse -Force
                    Write-Output "Supprimé."
                } else {
                    Write-Output "Le répertoire '$nom' n'existe pas."
                }
            } -ArgumentList $nom
        }

        "4" {
            Write-Host "Fin de script"
            Remove-PSSession $session
            break
        }
    }
}