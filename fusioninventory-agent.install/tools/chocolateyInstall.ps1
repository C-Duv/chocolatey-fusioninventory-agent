$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.3/fusioninventory-agent_windows-x86_2.4.3.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.3/fusioninventory-agent_windows-x64_2.4.3.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '731c0185164bdb8863c433398f498ba575afda318db448310d4d7e79e187852b'
    checksumType   = 'sha256'
    checksum64     = 'f4e2c6e413bd8799c3fad36d1ca3ebc28800a0571e0a55a2866c99d0b6cb41c7'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs