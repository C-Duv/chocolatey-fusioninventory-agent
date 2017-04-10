$packageName = 'fusioninventory-agent.portable'

$packageDownloadArgs = @{
    packageName = $packageName
    url         = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.19/fusioninventory-agent_windows-x86_2.3.19-portable.exe' # NB: Theses EXE are 7z SFX
    url64bit    = 'https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.19/fusioninventory-agent_windows-x64_2.3.19-portable.exe'
    checksum       = 'bca45a0e2c55c82b54c78363e8ce62cb66d63d08a196dd61cfbc99f4ee3cda8c'
    checksumType   = 'sha256'
    checksum64     = '529d9acb9beab4f9e3b47678401f6366ca62c6d0124cb025ddf0bc0e63dcf733'
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