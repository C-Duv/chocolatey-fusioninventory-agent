$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.19/fusioninventory-agent_windows-x86_2.3.19.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.19/fusioninventory-agent_windows-x64_2.3.19.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '31fef37543ccc0139e461577afc4c4154c35419d6700fc06e2d7aacf9b100e51'
    checksumType   = 'sha256'
    checksum64     = '8c53fe14d93e7bbf3d46b9d063702ae87997a619a568fd9524748883b446f092'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs