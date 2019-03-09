$moduleRoot=Resolve-Path "$PSScriptRoot\.."
$moduleName=Split-Path $moduleRoot -Leaf

Describe "General project validation: $moduleName" {

    $scripts= Get-ChildItem $moduleRoot -Include *.ps1, *.psm1, *.psd1 -Recurse

    #test case are splateted to the script so we need hashtables

    $testCase=$scripts | ForEach-Object {@{file=$_}}
    it "script<file> should be valid powershell" -testcase $testCase{
        param($file)

        $file.fullname | should exist
        $contents=get-content -Path $file.fullname -ErrorAction Stop
        $error =$null
        $null=[System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
        $errors.count | should be 0

        }

        it "Module '$moduleName' can import cleanly"{
            {import-module (join-path $moduleRoot "$moduleName.psm1") -Force} | should not throw

        }
    } 
    

}