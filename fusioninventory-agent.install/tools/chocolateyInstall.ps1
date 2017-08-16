$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.21/fusioninventory-agent_windows-x86_2.3.21.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.21/fusioninventory-agent_windows-x64_2.3.21.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '08de922e012bec687f7671bba38906fd024e80e63d593fc39c59e75b57e1a84d'
    checksumType   = 'sha256'
    checksum64     = '302dfa9b6108cf093c0d290b1dabebb328142d6e57c3bfee2b14c835d85afbd0'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs