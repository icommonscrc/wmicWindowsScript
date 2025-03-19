# Ensure you are running this script with administrator privileges.

# List of applications to install
$applications = @(
    # Applications available via PatchMyPC
    "paint.net",
    "notepad++.notepad++",
    "putty",
    "Posit.RStudio",
    "Microsoft.VisualStudioCode",
    "VideoLAN.VLC",
    "Mozilla.Firefox",
    "WiresharkFoundation.Wireshark",
    "WinSCP.WinSCP",
    "7zip.7zip",
    "HandBrake.HandBrake",
    "OBSProject.OBSStudio",

    # Applications to install manually or with winget
    "Zoom.Zoom",
    "JetBrains.IntelliJIDEA.Community",
    "AivarAnnamaa.Thonny",
    "Insecure.Nmap",
    "JetBrains.PyCharm.Community",
    "eclipse.eclipse"
)

# Iterate through the applications and install each
foreach ($app in $applications) {
    Write-Host "Installing $app..." -ForegroundColor Green
    
    try {
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
        
        if ($?) {
            Write-Host "$app installed successfully!" -ForegroundColor Cyan
        } else {
            Write-Host "Installation of $app may have encountered an issue." -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Failed to install $app. Check the logs for details." -ForegroundColor Red
    }
}
