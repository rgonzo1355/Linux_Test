# Check if TeamViewer is installed in the standard directory
if (Test-Path "C:\Program Files (x86)\TeamViewer\TeamViewer.exe") {
  Write-Host "TeamViewer is installed in the standard directory. Opening..."
  Start-Process "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
  exit # Exit the script after opening TeamViewer
}
# Check if TeamViewer is installed in the "Program Files" directory
elseif (Test-Path "C:\Program Files\TeamViewer\TeamViewer.exe") {
  Write-Host "TeamViewer is installed in the 'Program Files' directory. Opening..."
  Start-Process "C:\Program Files\TeamViewer\TeamViewer.exe"
  exit # Exit the script after opening TeamViewer
}
else {
  # TeamViewer is not installed, so install it
  Write-Host "TeamViewer is not installed. Installing..."

  # Download TeamViewer installer
  $teamViewerInstallerUrl = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
  $teamViewerInstallerPath = "$env:TEMP\TeamViewer_Setup.exe"
  Invoke-WebRequest -Uri $teamViewerInstallerUrl -OutFile $teamViewerInstallerPath

  # Install TeamViewer silently
  Start-Process -FilePath $teamViewerInstallerPath -ArgumentList "/S" -Wait

  Write-Host "TeamViewer installed successfully."
}

# The script should not reach this point
Write-Host "Script completed."
