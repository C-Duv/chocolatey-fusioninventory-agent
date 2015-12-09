$packageName = 'fusioninventory-agent.install'
$installerType = 'exe'
$url = 'http://forge.fusioninventory.org/attachments/download/1892/fusioninventory-agent_windows-x86_2.3.17.exe'
$url64 = 'http://forge.fusioninventory.org/attachments/download/1889/fusioninventory-agent_windows-x64_2.3.17.exe'
$silentArgs = '/S /acceptlicense'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes