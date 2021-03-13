# Release

This file describes how to make a new release for chocolatey.

## Making a release

* Change the version inside the `drasyl.nuspec`. It must match the GitHub releases version without the `v` prefix.
* Change the `checksum` inside the `tools/chocolateyinstall.ps1` to the current value of the `drasyl-$($packageVersion).zip.sha256` file
* Run `choco pack`
* Run `choco push drasyl.<version>.nupkg --source https://push.chocolatey.org/` (to execute this command you must have an API key)
* Wait for review
