$fucntionFolders=@('Public','Internal','Classes')

foreach ($folder in $fucntionFolders){
    $folderPath=Join-Path -Path $PSScriptRoot -ChildPath $folder
    if(Test-Path -path $folderPath){
        Write-Verbose -Message "Importing from $folder"
        $functions=Get-ChildItem -Path $folderPath -filter '*.ps1'
        foreach($function in $functions){
            Write-Verbose -Message "Importing $($function.basename)"
        }
    }
}

$publicFunctions=(Get-ChildItem -Path "$PSScriptRoot\Public" -Filter '*.ps1').BaseName
Export-ModuleMember -Function $publicFunctions

