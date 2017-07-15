$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.20/fusioninventory-agent_windows-x86_2.3.20.exe'
    url64bit       = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.20/fusioninventory-agent_windows-x64_2.3.20.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
    checksum       = '9db73ac8aa779902219b13e834ec95009f6ac0015e743dfac1de52b6e6777a2c'
    checksumType   = 'sha256'
    checksum64     = '20318a1ee5f3e2a61aa927b5c44032cf032d27dbcbc3e27b86ba2e51d7b96785'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageInstallArgs