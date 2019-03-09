Clear-Host

Get-Help New-PlasterManifest
get-help New-PlasterManifest -Examples
get-help New-PlasterManifest -Detailed

Get-InstalledModule
$PSScriptRoot
Get-Location


#------------------------------------------------------------------------------------------------------
Clear-Host
$here=Get-Location
$ModuleDir=Join-Path -Path "$here" -ChildPath 'Module'
$outputDir=Join-Path -Path "$here" -ChildPath 'Output'
$outputFirstDemo=(new-item -Path "$outputDir\FirstDemo" -ItemType Directory -Force -Verbose)
write-host $outputFirstDemo.FullName

#New-PlasterManifest -TemplateName NewPowerShellItem -TemplateType Item
$manifestPath=Join-Path -Path "$outputFirstDemo" -ChildPath 'PlasterManifest.xml'

if (!(Test-Path $manifestPath)){
    New-PlasterManifest -Path "$manifestPath" -TemplateName 'myFirstPlaster' -TemplateType 'Item'
}

#copy file to manifest folder
Copy-Item -Path "$ModuleDir\template.psm1" -Destination "$outputFirstDemo" -Force -Verbose


#Invoke-Plaster from existing template
Invoke-Plaster -TemplatePath "$outputFirstDemo" -DestinationPath "$outputDir\FirstDemoOutput" -Force -Verbose
#---------------code----------------------------------------
#code $PSScriptRoot\Module\test.psd1 -Verbose
#Copy-Item -Path "$ModuleDir\template.psm1" -Destination "$outputDir\FirstDemo" -Verbose

#-----------------------------------

copy-item -path ".\Module\basicTest.ps1" -Destination ".\Output\FirstDemo\basicTest.ps1" -Force -Verbose

#---------------Parameters----------------------------------------

<parameter name='ModuleName' type='text' prompt='Enter the name of the module'/>
<parameter name='ModuleDesc' type='text' prompt='Brief description of the module'/>
<parameter name='ModuleVersion' type='text' prompt='Version number' default='0.0.0.1'/>
<parameter name='ModuleAuthor' type='user-fullname' prompt='author'/>
<parameter name='ModuleName' type='text' prompt='Enter the name of the module'/>

<parameter name='Include Argus' type='choice' default='0' store='text' prompt='Include Argus Installation package?'>
  <choice label='&amp;Yes' help="Will download Argus packages from server." value="$true"/>
  <choice label='&amp;Not' help="Please copy the folder to VM image" value="$false"/>
</parameter>

<parameter name='FunctionFolders' type='multichoice' default='0,1,2' store='text' prompt='Select folders to include'>
  <choice label='&amp;Public'
          help="Add a public folder to module root."
          value="Public"/>
  <choice label='P&amp;Internal'
          help="Add an internal folder to module root."
          value="Internal"/>
  <choice label='&amp;Classes'
          help="Add a classes folder to module root."
          value="Classes"/>
  <choice label='&amp;Binaries'
          help="Add a binaries folder to module root."
          value="Binaries"/>
  <choice label='&amp;Binaries'
          help="Add a data folder to module root."
          value="Data"/>
</parameter>

#---------------Content---------------------------------------------------------
<newModuleManifest destination='src\${PLASTER_PARAM_ModuleName}.psd1'
                   moduleVersion='$PLASTER_PARAM_Version'
                   rootModule='${PLASTER_PARAM_ModuleName}.psm1'
                   author='$PLASTER_PARAM_FullName'
                   description='$PLASTER_PARAM_ModuleDesc'
                   encoding='UTF8-NoBOM'
                   powerShellVersion='5.1'/>

<file source='template1.psm1' destination='${Plaster_PARAM_ModuleName}.psm1'/>

#------------------------------------------------------------------------



#------------------------------------------------------------------------
#Get-Content
#Get-Date
#Get-ChildItem
#Get-Item
#Get-ItemProperty
#Get-Module
#Get-Variable
#Test-Path
#Compare-Object

#PLASTER_TemplatePath - The absolute path to the template directory.
#PLASTER_DestinationPath - The absolute path to the destination directory.
#PLASTER_DestinationName - The name of the destinaion directory.
#PLASTER_FileContent - The contents of a file be modified via the <modify> directive.
#PLASTER_DirSepChar - The directory separator char for the platform.
#PLASTER_HostName - The PowerShell host name e.g. $Host.Name
#PLASTER_Version - The version of the Plaster module invoking the template.
#PLASTER_Guid1 - Randomly generated GUID value
#PLASTER_Guid2 - Randomly generated GUID value
#PLASTER_Guid3 - Randomly generated GUID value
#PLASTER_Guid4 - Randomly generated GUID value
#PLASTER_Guid5 - Randomly generated GUID value
#PLASTER_Date - Date in short date string format e.g. 10/31/2016
#PLASTER_Time - Time in short time string format e.g. 5:11 PM
#PLASTER_Year - The four digit year

