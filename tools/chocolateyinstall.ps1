# based on: https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyinstall.ps1

$ErrorActionPreference = 'Stop';

$packageName    = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://github.com/drasyl-overlay/drasyl/releases/download/v0.3.0/drasyl-0.3.0.zip'
$checksum       = 'A9BB1C28729DBE5C672BA567CD22E91BE570A7E753346C5311DAD90EF7F4D953'
$checksumType   = 'sha256'
$drasylHome    = Join-Path $toolsDir "drasyl-$($packageVersion)"

Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType

# Remove Unix file
Remove-Item "$($drasylHome)\bin\drasyl"

Install-ChocolateyEnvironmentVariable -variableName 'DRASYL_HOME' -variableValue $drasylHome -variableType 'Machine'

Install-ChocolateyPath "`%DRASYL_HOME`%\bin" 'Machine'

Write-Warning "You must start a new prompt, or re-read the environment for the drasyl-cli to be available in your command line environment."