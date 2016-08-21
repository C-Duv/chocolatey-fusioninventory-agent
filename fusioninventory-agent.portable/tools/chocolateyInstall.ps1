$packageName = 'fusioninventory-agent.portable'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x86_2.3.18-portable.exe' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x64_2.3.18-portable.exe'
    checksum       = 'fa472f4831f28842e7130bd751d7d1f63242e71428021a908d46f7255c1c97c5'
    checksumType   = 'sha256'
    checksum64     = '07b09f73f06e520b09b5ca91cac291e915bb174f11b3bad420c8de9364d058b2'
    checksumType64 = 'sha256'
}

try { 
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}
  
  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  $file = Join-Path $tempDir "$($packageName).exe" # Using ".exe" here to match extension of file located at $url/$url64
  $packageDownloadArgs.Add('FileFullPath', $file)
  Get-ChocolateyWebFile @packageDownloadArgs

  Start-Process `"$file`" -ArgumentList "-o`"$installDir`" -y" -Wait # Downloaded file is a 7z SFX: just execute it

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}