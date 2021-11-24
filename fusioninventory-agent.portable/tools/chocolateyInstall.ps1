$packageName = 'fusioninventory-agent.portable'

$ErrorActionPreference = 'Stop'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.6/fusioninventory-agent_windows-x86_2.6-portable.exe' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.6/fusioninventory-agent_windows-x64_2.6-portable.exe'
    checksum       = '092d7405eda8659fac487ca6d4b611185ea6494a8e1697512fd2f29c9d756d9e'
    checksumType   = 'sha256'
    checksum64     = 'e1899ea5f28d28e8b6ec5d79494247fc50d9a5fa87dd0a87e9fb2d4195c2f86a'
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
