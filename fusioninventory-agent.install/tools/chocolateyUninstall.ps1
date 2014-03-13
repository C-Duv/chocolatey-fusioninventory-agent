$packageName = 'fusioninventory-agent.install'
try {
  if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent') {
    $uninstallerPath = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent').UninstallString
  } elseif (Test-Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent') {
    $uninstallerPath = (Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\FusionInventory-Agent').UninstallString
  } else {
    $uninstallerPath = ''
  }
  
  if ($uninstallerPath -and (Test-Path $uninstallerPath)) {
    Uninstall-ChocolateyPackage $packageName 'EXE' -SilentArgs '/S' -file $uninstallerPath
  }
  Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}