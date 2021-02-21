# based on: https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyinstall.ps1

$ErrorActionPreference = 'Stop';

$packageName    = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = "https://github.com/drasyl-overlay/drasyl/releases/download/v$($packageVersion)/drasyl-$($packageVersion).zip"
$checksum       = (Invoke-RestMethod "$($url).sha256").Trim()
$checksumType   = 'sha256'
$drasylHome    = Join-Path $toolsDir "drasyl-$($packageVersion)"

Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType

# Remove Unix file
Remove-Item "$($drasylHome)\bin\drasyl"

Install-ChocolateyEnvironmentVariable -variableName 'DRASYL_HOME' -variableValue $drasylHome -variableType 'Machine'

Install-ChocolateyPath "`%DRASYL_HOME`%\bin" 'Machine'

Write-Warning "You must start a new prompt, or re-read the environment for the drasyl command to be available in your command line environment."