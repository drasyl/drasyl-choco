# based on https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyuninstall.ps1

$ErrorActionPreference = 'Stop';

$packageName    = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackagVersion
$zipName = "drasyl-$($packageVersion).zip"

Uninstall-ChocolateyZipPackage $packageName $zipName

[Environment]::SetEnvironmentVariable('DRASYL_HOME',$null,'Machine')

#Using .NET method prevents expansion (and loss) of environment variables (whether the target of the removal or not)
#To avoid bad situations - does not use substring matching or regular expressions
#Removes duplicates of the target removal path, Cleans up double ";", Handles ending "\"

$PathToRemove = '%DRASYL_HOME%\bin'
foreach ($path in [Environment]::GetEnvironmentVariable("PATH","Machine").split(';'))
{
  If ($Path)
  {
    If (($path -ine "$PathToRemove") -AND ($path -ine "$PathToRemove\"))
    {
      [string[]]$Newpath += "$path"
    }
  }
}
$AssembledNewPath = ($newpath -join(';')).trimend(';')

[Environment]::SetEnvironmentVariable("PATH",$AssembledNewPath,"Machine")
