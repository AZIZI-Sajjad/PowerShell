<#   
.SYNOPSIS   
Script permettant de supprimer des vieux fichiers
    
.DESCRIPTION 
Script permettant de supprimer des fichiers vieux de plusieurs jours / mois / années selon la valeur du paramètre.
	
.PARAMETER Path 
Le chemin du dossier au niveau duquel tous les fichiers seront supprimés de façon récursive

.PARAMETER Year
Le nombre d'années après lequel on veut que les fichiers soit supprimer. Si on est en 2013 et que la valeur du paramètre est 5, tous les fichiers d'avant 2008 seront supprimés

.PARAMETER LogFilePath
Le chemin du fichier de log

.LINK
http://microsofttouch.fr/default/b/sylver/default.aspx

.NOTES   
Nom du scipt : WINDOWS_FILE_remove_old_files_1.0.ps1
Réalisé par  : Sylver SCHORGEN
Blog         : http://microsofttouch.fr/default/b/sylver/default.aspx
Statut       : Production
Version      : 1.0

.EXAMPLE   
.\WINDOWS_FILE_remove_old_files_1.0.ps1 -Path C:\_Data\DemoPS -Year 0.5 -LogFilePath c:\DemoPS\

#>

param(
    [string]$Path,
	[string]$Year,
    [string]$LogFilePath
    )


$items = Get-ChildItem $Path -Recurse
$yearsToCheck = $Year
$thisYear = (Get-Date).year

if($LogFilePath[$LogFilePath.Length - 1] -ne "\") {
    $LogFilePath = $LogFilePath + "\"
}

$fileLog = $LogFilePath + 'file_deleted_log.txt'

foreach ($item in $items) {
    if($item.GetType().Name -eq "FileInfo") {
        
        $fileLastAccessDate = $item.LastAccessTime.Year
        
        if($thisYear - $fileLastAccessDate -gt $yearsToCheck) {
            Remove-Item -Path $item.FullName

            Write-Host "Fichier $($item.FullName) supprimé"
            Write-Output "Fichier supprimé : $($item.FullName)" | Out-File $fileLog -Append
        }
    }
}