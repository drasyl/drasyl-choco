# based on: https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyinstall.ps1

$ErrorActionPreference = 'Stop';

$packageName    = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = "https://github.com/drasyl-overlay/drasyl/releases/download/v$($packageVersion)/drasyl-$($packageVersion).zip"
$checksum       = "96858605f50350041f5e332863bb3474329aacf2fb710c38ab77ab600055a2d0"
$checksumType   = 'sha256'
$drasylHome     = Join-Path $toolsDir "drasyl-$($packageVersion)"

Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType

# Remove Unix file
Remove-Item "$($drasylHome)\bin\drasyl"

Install-ChocolateyEnvironmentVariable 'DRASYL_HOME' $drasylHome 'Machine'

Install-ChocolateyPath "`%DRASYL_HOME`%\bin" 'Machine'

Write-Warning "You must start a new prompt, or re-read the environment for the drasyl command to be available in your command line environment."
