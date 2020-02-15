$gitVersion = GitVersion.exe | ConvertFrom-Json
$semver = $gitVersion.SemVer
$majorVersion = $gitVersion.Major
$minorVersion = $gitVersion.Minor
$nugetVersion = $gitVersion.NuGetVersion

New-Item -ErrorAction Ignore -ItemType directory -Path Nuget-Packages
nuget pack .\root\ASCOM.Platform.nuspec -OutputDirectory .\Nuget-Packages -Version $nugetVersion