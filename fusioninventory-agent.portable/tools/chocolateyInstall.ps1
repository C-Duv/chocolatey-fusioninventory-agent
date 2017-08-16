$packageName = 'fusioninventory-agent.portable'

$ErrorActionPreference = 'Stop'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.21/fusioninventory-agent_windows-x86_2.3.21-portable.exee' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.21/fusioninventory-agent_windows-x64_2.3.21-portable.exe'
    checksum       = '586a2e3c807e047cb4abecf3f18eb68522f995b3b0f373681ef7d7730810d9ca'
    checksumType   = 'sha256'
    checksum64     = 'ff2d1b03da7feb24fb5de4ed7e9e09d574b4b29eea17edb11d7dee9233f0b2a4'
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