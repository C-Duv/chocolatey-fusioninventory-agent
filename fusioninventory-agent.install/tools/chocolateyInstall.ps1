$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.2/fusioninventory-agent_windows-x86_2.4.2.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.2/fusioninventory-agent_windows-x64_2.4.2.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '3f412487c068c952c0c9d630c1c9a4a20d054b338fb3bde64a21e3d8544bc5ca'
    checksumType   = 'sha256'
    checksum64     = '10796ec2206f9f8970b117938fd82616cefbddcb996535c6b1ba74d9a54eb3fe'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs