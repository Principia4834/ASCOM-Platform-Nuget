# ASCOM Platform NuGet Package

This package was professionally developed by [Tigra Astronomy][tigra]. The code is open-source and is licensed under the [Tigra Astronomy MIT license][license]. The ASCOM assemblies themselves are licensed by [The ASCOM Initiative][ascom] using a Creative Commons license, details can be found in the [Ownership and Licensing][ascom-license] page of the ASCOM web site.

Important Note: The assemblies contained in the package are licensed only for use on your development computer; they are not licensed for redistribution with a derivative product. Therefore **you must not redistribute these assemblies** (see Caveats, below).

## Purpose

This package contains verbatim copies of the assemblies contained in the ASCOM Developer Tools installer.

Tigra Astronomy originally built this package as a convenience, because we were using a build server with multiple build agents and we didn't want to have to install ASCOM and keep it up to date on all the build agents. Having the ASCOM assemblies in a NuGet package allows the build process to pull in the assemblies as needed and eliminates the dependency on a particular machine.

We have since stopped using the build server but found that there are still some advantages to this approach, especially if you use multiple computers for development and testing. Therefore we have continued the practice of consuming ASCOM via NuGet.

## Caveats

### Assembly Redistribution

The ASCOM assemblies _should not be included in your installer_. ASCOM assemblies should only ever be placed on target systems by the [ASCOM Platform Installer][ascom]. This package has therefore been marked as a _development dependency_ which means dependency on the ASCOM assemblies will not propagate to any dependent code.

Nevertheless, by default, Visual Studio will copy the assemblies into your build output directory. It is then very easy to make the mistake of including the ASCOM assemblies in your target system and/or its installer. Take care not to do this! The ASCOM assemblies are not licensed for redistribution and users should be required to install the ASCOM Platform.

### ASCOM Profile Store

While everything will build correctly, the ASCOM assemblies have a dependency on the ASCOM Profile Store. This is a registry area that is created by the ASCOM Platform Installer and updated by driver installers and drivers. Most ASCOM assemblies will throw exceptions if this storage is missing. This means that any compiled code, particularly unit tests, will likely fail unless the ASCOM Profile Store is present.

We have provided a PowerShell script as part of the package that will create the minimum necessary registry keys for ASCOM assemblies to run and allow unit tests to execute and pass, but this is not an adequate environment for target code to run successfully. The full ASCOM Platform must be installed on any end-user PC and we recommend making this a launch condition of your installer.

[license]: http://tigra.mit-license.org "MIT license details"
[tigra]: http://tigra-astronomy.com/ "Tigra Astronomy home page"
[ascom]: https://ascom-standards.org
[ascom-license]: https://ascom-standards.org/About/Licensing.htm
