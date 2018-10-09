$packageName = 'fusioninventory-agent.portable'

$ErrorActionPreference = 'Stop'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.1/fusioninventory-agent_windows-x86_2.4.1-portable.exe' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.1/fusioninventory-agent_windows-x64_2.4.1-portable.exe'
    checksum       = 'd000b6d337c7ac9e2e6e23f5969de16ba0e702e419368346b256eee79525a4e8'
    checksumType   = 'sha256'
    checksum64     = '1fa8d4b3b2d18ec86decd15e04ae0310d0332424d18abb26aae81e106565a1fc'
    checksumType64 = 'sha256'
}

$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}

$tempDir = "$env:TEMP\chocolatey\$($packageName)"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

$file = Join-Path $tempDir "$($packageName).exe" # Using ".exe" here to match extension of file located at $url/$url64
$packageDownloadArgs.Add('FileFullPath', $file)
Get-ChocolateyWebFile @packageDownloadArgs

Start-Process `"$file`" -ArgumentList "-o`"$installDir`" -y" -Wait # Downloaded file is a 7z SFX: just execute it