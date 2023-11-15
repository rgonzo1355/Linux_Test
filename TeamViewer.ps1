# Check if TeamViewer is installed
$teamViewerInstalled = Test-Path -Path 'C:\Program Files\TeamViewer\TeamViewer.exe'

if (!$teamViewerInstalled) {
    # Download and install TeamViewer
    # Define the URL to download the TeamViewer installer
    $downloadUrl = 'https://download.teamviewer.com/download/teamviewer_setup.exe'

    # Define the path to save the downloaded installer
    $downloadPath = 'C:\Temp\teamviewer_setup.exe'

    # Define the path where to install TeamViewer
    $installPath = 'C:\Program Files\TeamViewer'

    # Download the TeamViewer installer
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($downloadUrl, $downloadPath)

    # Install TeamViewer
    Start-Process -FilePath $downloadPath -ArgumentList '/S' -Wait
}

# Start TeamViewer
Start-Process -FilePath 'C:\Program Files\TeamViewer\TeamViewer.exe' -Wait
