$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent_windows-x86_2.5.1.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent_windows-x64_2.5.1.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '9709d46bc2a88c78420a17d76c8c9ba9eeb137ca2abd938a8972e7eb5393b204'
    checksumType   = 'sha256'
    checksum64     = '81c6f082c4aab64bbea106c4b388403c7874e4739aeae06c5063b136e45ac131'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs