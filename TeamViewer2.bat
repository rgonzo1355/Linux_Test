@echo off

echo Checking for TeamViewer...

if not exist C:\Program Files\TeamViewer\TeamViewer.exe (
  echo TeamViewer is not installed. Installing TeamViewer...

  start https://download.teamviewer.com/download/teamviewer_setup.exe

  echo Waiting for TeamViewer installation to complete...

  timeout /t 300

  echo TeamViewer installation complete.
)

echo Starting TeamViewer...

start C:\Program Files\TeamViewer\TeamViewer.exe
