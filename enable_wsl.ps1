Write-Host "`nSet4wsl`n - Enable WSL`n"

dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestar
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestar

Write-Host "`nPlease restart your computer to apply changes."
