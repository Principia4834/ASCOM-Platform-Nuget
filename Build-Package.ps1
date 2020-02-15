# This script should be run in the project root directory.
# It will create the package taking account of ASCOM.Platform.nuspec.
# Packages are placed in the .\Nuget-Packages directory, which will be created if necessary.
# The package version will be set based on the Git commit history using GitVersion.

$gitVersion = GitVersion.exe | ConvertFrom-Json
$semver = $gitVersion.SemVer
$majorVersion = $gitVersion.Major
$minorVersion = $gitVersion.Minor
$nugetVersion = $gitVersion.NuGetVersion

New-Item -ErrorAction Ignore -ItemType directory -Path Nuget-Packages
nuget pack .\root\ASCOM.Platform.nuspec -OutputDirectory .\Nuget-Packages -Version $nugetVersion