$packageName = 'fusioninventory-agent.portable'
$url = 'http://forge.fusioninventory.org/attachments/download/1470/fusioninventory-agent_windows-x86_2.3.9-portable.exe' # NB: Theses EXE are 7z SFX
$url64 = 'http://forge.fusioninventory.org/attachments/download/1466/fusioninventory-agent_windows-x64_2.3.9-portable.exe'

try { 
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}
  
  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  $file = Join-Path $tempDir "$($packageName).exe" # Using ".exe" here to match extension of file located at $url/$url64
  Get-ChocolateyWebFile "$packageName" "$file" "$url" "$url64"

  Start-Process `"$file`" -ArgumentList "-o`"$installDir`" -y" -Wait # Downloaded file is a 7z SFX: just execute it

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}