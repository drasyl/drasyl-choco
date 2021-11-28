# based on https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyuninstall.ps1

$ErrorActionPreference = 'Stop';

$packageName    = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackagVersion
$zipName = "drasyl-$($packageVersion)-windows-amd64.zip"

Uninstall-ChocolateyZipPackage $packageName $zipName

Uninstall-ChocolateyEnvironmentVariable 'DRASYL_HOME' 'Machine'