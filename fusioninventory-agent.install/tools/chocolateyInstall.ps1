$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x86_2.3.18.exe'
    url64bit       = 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x64_2.3.18.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '5610705b44d14cb14f8d815a39526dc702eae359f6d64e560b8730bfd230164d'
    checksumType   = 'sha256'
    checksum64     = 'c901531de9c35e6af38b298a00bbc04acf258ebfcdd61a482d7a2a5d19566015'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs