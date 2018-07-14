$packageName = 'fusioninventory-agent.portable'

$ErrorActionPreference = 'Stop'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4/fusioninventory-agent_windows-x86_2.4-portable.exe' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.4/fusioninventory-agent_windows-x64_2.4-portable.exe'
    checksum       = '0abdcb03bcd27872bc88af21323904e05ee3ba9e3f6c434fccadef21a4f33d3b'
    checksumType   = 'sha256'
    checksum64     = 'd5a79cec197a6cc63f27a77f4d30e23d062b484cf68fbd850bbcb68afaeb9049'
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