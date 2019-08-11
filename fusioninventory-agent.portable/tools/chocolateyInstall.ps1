$packageName = 'fusioninventory-agent.portable'

$ErrorActionPreference = 'Stop'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.3/fusioninventory-agent_windows-x86_2.4.3-portable.exe' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4.3/fusioninventory-agent_windows-x64_2.4.3-portable.exe'
    checksum       = 'fa815fdf8a464f14371be33a188a8915027f7e4459f85b1218dd8919bb28621e'
    checksumType   = 'sha256'
    checksum64     = '458643485edcf56b137e73c6823e197d9cdc069c12fad1af593153c057e036fc'
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