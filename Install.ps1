Clear-Host

Get-Help New-PlasterManifest
get-help New-PlasterManifest -Examples
get-help New-PlasterManifest -Detailed

Get-InstalledModule
#------------------------------------------------------------------------------------------------------
Clear-Host
$here=Get-Location
$outputDir=Join-Path -Path "$here" -ChildPath 'Output'
$outputFirstDemo=(new-item -Path "$outputDir\FirstDemo" -ItemType Directory -Force -Verbose)
write-host $outputFirstDemo.FullName

#New-PlasterManifest -TemplateName NewPowerShellItem -TemplateType Item
$manifestPath=Join-Path -Path "$outputFirstDemo" -ChildPath 'PlasterManifest.xml'

if (!(Test-Path $manifestPath)){
    New-PlasterManifest -Path "$manifestPath" -TemplateName 'myFirstPlaster' -TemplateType 'Item'
}


#Invoke-Plaster from existing template
Invoke-Plaster -TemplatePath "$outputFirstDemo" -DestinationPath "$outputDir\FirstDemoOutput" -Force -Verbose

#-------------------------------------------------------

<parameter name='ModuleName' type='text' prompt='Enter the name of the module'/>
<parameter name='ModuleDesc' type='text' prompt='Brief description of the module'/>
<parameter name='ModuleVersion' type='text' prompt='Version number' default='0.0.0.1'/>
<parameter name='ModuleAuthor' type='user-fullname' prompt='author'/>
<parameter name='ModuleName' type='text' prompt='Enter the name of the module'/>

<parameter name='Include Argus' type='choice' default='0' store='text' prompt='Include Argus Installation package?'>
  <choice label='&amp;Yes' help="Will download Argus packages from server." value="$true"/>
  <choice label='&amp;Not' help="Please copy the folder to VM image" value="$false"/>
</parameter>