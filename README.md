# Set4wsl
Easily configure your WSL environment.

* [I. Install WSL](#i-install-wsl)
* [II. Install Linux](#ii-install-linux)
* [III. Configure WSL](#iii-configure-wsl)
* [IV. Use WSL GUI](#iv-use-wsl-gui)
* [V. Work Environmnet](#v-work-environment)

## I. Install WSL
Before you start it, RUN  Terminal(CMD/POWERSHELL) as ADMINISTRATOR.
### 1. Powershell Security Bypass
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
### 2. Setup WSL
Setup WSL on Windows. Run this and restart Windows.
###### Option A
Download Set4wsl and run the PowerShell script.
```powershell
.\enable_wsl.ps1
```
###### Option B
If can't donwload, try manually.
```powershell
dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all
```
### 3. Use WSL2
If not Windows 11 or Windows 10 2004 and higher, follow this and setup WSL2.
###### Option A
Download Set4wsl and run the PowerShell script.
```powershell
.\set_wsl.ps1
```
###### Option B
If can't donwload, try manually.
```powershell
curl -L -o \wsl_update_x64.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
.\wsl_update_x64.msi /quiet
Remove-Item .\wsl_update_x64.msi
wsl --set-default-version 2
```

## II. Install Linux
### 1. Update WSL
Update WSL on Windows.
```powershell
wsl --update
```
### 2. Download Linux
Install Default(Ubuntu) via WSL.
```powershell
wsl --install
# or use this: wsl --install ubuntu 
```
Install Alterantive(Debian/Kali) via WSL.
```powershell
wsl --install debian
# or
wsl --install kali-linux
```

## III. Configure WSL
Run this script on Windows for configure WSL. Before run this, you need minimum 3GB storage space.
```powershell
.\config_wsl.ps1
```

## IV. Use WSL GUI
This all command use on Linux.
### 1. Update Linux
Update and upgrade Linux.
```shell
sudo apt update && sudo apt -y upgrade
```
### 2. WSLg
Then install gui application.
```shell
sudo apt install -y [AppName]
# e.g. sudo apt install -y epiphany-browser
```
Run GUI application.
```shell
[AppName] &
# e.g. epiphany-browser &
```
### 3. Win-Kex
If you use Kali Linux, try Win-Kex with seamless mode.
```shell
sudo apt install -y kali-win-kex
```
#### 1) Window Mode
###### Start
Use Win-Kex Window Mode.
```shell
kex --win
```
###### Stop
Stop Win-Kex Window Mode.
```shell
kex --win --stop
```
#### 2) Seamless Mode
###### Start
Use Win-Kex Seamless Mode.
```shell
kex --sl
```
###### Stop
Stop Win-Kex Seamless Mode.
```shell
kex --sl --stop
```
#### 3) Useful Command
Turn on Kali Linux sound.
```shell
kex --win --sound
```

## V. Work Environment
### 1. Kali Linux
Setup Kali Environment
#### 1) Upgrade for Kali
Update all packages
```shell
sudo apt update && sudo apt full-upgrade -y
```
#### 2) Metapackages
##### Default Packages
Setup to install default Kali tools
```shell
sudo apt install -y kali-linux-default
```
##### Full Packages
Setup to install all Kali tools
```shell
sudo apt install -y kali-linux-everything
```
