# based on: https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyinstall.ps1

$ErrorActionPreference = 'Stop';

$packageName    = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = "https://github.com/drasyl-overlay/drasyl/releases/download/v$($packageVersion)/drasyl-$($packageVersion)-windows-amd64.zip"
$checksum       = "547a95be3f0bbcbb98f171d319816fdd934d12ac808061c1e4809953470d4845"
$checksumType   = 'sha256'
$drasylHome     = Join-Path $toolsDir "drasyl-$($packageVersion)-windows-amd64"

Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType

Install-ChocolateyEnvironmentVariable 'DRASYL_HOME' $drasylHome 'Machine'

Install-ChocolateyPath "`%DRASYL_HOME`%\bin" 'Machine'

Write-Warning "You must start a new prompt, or re-read the environment for the drasyl command to be available in your command line environment."
