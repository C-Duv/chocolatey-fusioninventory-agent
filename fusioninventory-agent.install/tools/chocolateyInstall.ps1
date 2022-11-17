$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.6/fusioninventory-agent_windows-x86_2.6.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.6/fusioninventory-agent_windows-x64_2.6.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '350d6efa3fa05a1a823740054f16ab6a9596c8b23eedf81e2c986d6baa872752'
    checksumType   = 'sha256'
    checksum64     = '56482bd4ea451526f59d13c776d6bda2e066b887bd5a8c97f54a375b5db5b340'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs