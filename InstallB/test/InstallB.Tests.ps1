$ModuleManifestName = 'InstallB.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"
$PSScriptRoot

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}
Import-Module .\InstallB.psm1
testCC

Remove-Module InstallB
