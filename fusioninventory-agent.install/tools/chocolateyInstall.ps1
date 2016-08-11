$packageInstallArgs = @{
    packageName    = 'fusioninventory-agent.install'
    fileType       = 'exe'
    url            = 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x86_2.3.18.exe'
    url64bit       = 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x64_2.3.18.exe'
    silentArgs     = '/S /acceptlicense'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageInstallArgs