# Check if TeamViewer is installed in the standard directory
if (Test-Path "C:\Program Files (x86)\TeamViewer\TeamViewer.exe") {
    Write-Host "TeamViewer is installed in the standard directory. Opening..."
    Start-Process "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
}
# Check if TeamViewer is installed in the "Program Files" directory
elseif (Test-Path "C:\Program Files\TeamViewer\TeamViewer.exe") {
    Write-Host "TeamViewer is installed in the 'Program Files' directory. Opening..."
    Start-Process "C:\Program Files\TeamViewer\TeamViewer.exe"
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
    
    # Open TeamViewer
    Start-Process "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
}

# Wait for TeamViewer to open
Write-Host "Waiting for TeamViewer to open..."
Start-Sleep -Seconds 10  # Adjust the sleep duration as needed

# Script ends
Write-Host "Script completed."
