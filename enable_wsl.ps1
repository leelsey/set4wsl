Write-Host "`n   ____    __  ____            __`n  / __/__ / /_/ / /_    _____ / /`n _\ \/ -_) __/_  _/ |/|/ (_-</ /`n/___/\__/\__/ /_/ |__,__/___/_/"
Write-Host "`nSet4wsl - Enable WSL`n"

dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all

Write-Host "`nDone! Please restart your computer to apply changes."
