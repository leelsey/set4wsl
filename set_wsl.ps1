Write-Host "`nSet4wsl - Setup WSL2`n"

curl -L -o \wsl_update_x64.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
.\wsl_update_x64.msi /quiet
Remove-Item .\wsl_update_x64.msi
wsl --set-default-version 2
wsl --update

Write-Host "`nDone! Now you can use WSL!"
