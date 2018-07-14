$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.1/fusioninventory-agent_windows-x86_2.4.1.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.1/fusioninventory-agent_windows-x64_2.4.1.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '10987785b43496ee057aa1af57ec04e97b87962a23103835e79328652ce7ce4a'
    checksumType   = 'sha256'
    checksum64     = '546a2e25bce5c5615dc32723be86effd464372801681bb644f4235e575598f77'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs