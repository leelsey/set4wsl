# Set4wsl
Configure WSL Easily

## Install WSL
Before you start it, RUN ADMINISTRATOR Terminal(CMD/POWERSHELL)
### 1. Install Linux
If Windows 11 or Windows 10 2004 and higher, follow this.
#### 1) Update WSL
```powershell
wsl --update
```
#### 2) Download Linux
Install Default(Ubuntu) via WSL.
```powershell
wsl --install
```
Install Alterantive(Debian/Kali) via WSL.
```powershell
wsl --install debian
# or
wsl --install kali
```
### 2. Install WSL2
If not Windows 11 or Windows 10 2004 and higher, follow this.
#### 1) Powershell Security Bypass
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
#### 2) Set WSL
##### 2-1) Set on WSL
###### Option A
```powershell
.\enable-wsl.ps1
```
###### Option B
```powershell
dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestar
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestar
```
##### 2-2) Setup WSL2
###### Option A
```powershell
.\setup-wsl.ps1
```
###### Option B
```powershell
curl -L -o \wsl_update_x64.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
.\wsl_update_x64.msi /quiet
Remove-Item .\wsl_update_x64.msi
wsl --set-default-version 2
wsl --update
```

## Configure WSL
Run this script on Windows:
```powershell
.\config-wsl.ps1
```

## Use WSL GUI
Run this script on Linux:
```shell
sudo apt update && sudo apt -y upgrade
```
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
### Win-Kex
If you use Kali Linux, try Win-Kex with seamless mode.
```shell
sudo apt install -y kali-win-kex
```
#### 1. Window Mode
##### 1) Start
```shell
kex --win
```
##### 2) Stop
```shell
kex --win --stop
```
#### 2. Seamless Mode
##### 1) Start
```shell
kex --sl
```
##### 2) Stop
```shell
kex --sl --stop
```
#### 3. Useful Command
If need Kali sound:
```shel
kex --win --sound
```



