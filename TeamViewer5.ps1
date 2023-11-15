# Check if the execution policy allows script execution
$executionPolicy = Get-ExecutionPolicy -Scope Process
if ($executionPolicy -ne "RemoteSigned") {
    Write-Host "Error: Script requires RemoteSigned execution policy."
    Write-Host "Please run the script with the following command:"
    Write-Host "powershell -ExecutionPolicy RemoteSigned -File .\your_script.ps1"
    exit 1
}

# Check if TeamViewer is installed in the standard directory
if (Test-Path "C:\Program Files (x86)\TeamViewer\TeamViewer.exe") {
    Write-Host "TeamViewer is installed in the standard directory. Opening..."
    Start-Process "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
    exit  # Exit the script after opening TeamViewer
}
# Check if TeamViewer is installed in the "Program Files" directory
elseif (Test-Path "C:\Program Files\TeamViewer\TeamViewer.exe") {
    Write-Host "TeamViewer is installed in the 'Program Files' directory. Opening..."
    Start-Process "C:\Program Files\TeamViewer\TeamViewer.exe"
    exit  # Exit the script after opening TeamViewer
}
else {
    Write-Host "TeamViewer is not installed. Installing..."

    # Download TeamViewer installer
    $teamViewerInstallerUrl = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
    $teamViewerInstallerPath = "$env:TEMP\TeamViewer_Setup.exe"
    Invoke-WebRequest -Uri $teamViewerInstallerUrl -OutFile $teamViewerInstallerPath

    # Install TeamViewer silently
    Start-Process -FilePath $teamViewerInstallerPath -ArgumentList "/S" -Wait

    Write-Host "TeamViewer installed successfully."
    
    # Open TeamViewer
    Write-Host "Opening TeamViewer..."
    Start-Process "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
    exit  # Exit the script after opening TeamViewer
}

# The script should not reach this point
Write-Host "Script completed."
