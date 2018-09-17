New-Item -ErrorAction Ignore -ItemType directory -Path Nuget-Packages
nuget pack .\root\ASCOM.Platform.nuspec -OutputDirectory .\Nuget-Packages