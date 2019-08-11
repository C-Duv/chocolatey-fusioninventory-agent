$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5/fusioninventory-agent_windows-x86_2.5.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5/fusioninventory-agent_windows-x64_2.5.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '57512aa6c155bdbe74c57def07c1330ecec0eec05062b14b22f281fff5289fde'
    checksumType   = 'sha256'
    checksum64     = 'c4b8bb02d2e9a1238414096b085fc13181dade6ae1bbd46588b699817f38209e'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs