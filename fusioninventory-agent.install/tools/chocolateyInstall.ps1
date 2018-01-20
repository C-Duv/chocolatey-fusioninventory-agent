$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4/fusioninventory-agent_windows-x86_2.4.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4/fusioninventory-agent_windows-x64_2.4.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '91796158da18bc53b11154ca9ac409b6915f9a7052caef5d671702ad2516ed32'
    checksumType   = 'sha256'
    checksum64     = '9a823580df4dd0cffa20d14c6266f1d05aeea789a4102f4026f98028912b49de'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs