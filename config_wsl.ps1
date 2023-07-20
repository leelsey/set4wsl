function  Check-SysInfo {
    $sysInfo = Get-CimInstance Win32_ComputerSystem
    $totalRam = [Math]::Ceiling($sysInfo.TotalPhysicalMemory / 1GB)

    $cpuInfo = Get-CimInstance Win32_Processor
    $cpuCore = $cpuInfo.NumberOfCores

    return $cpuCore, $totalRam
}

function GenerateFile($configPath, $configCPU, $configRam) {
    $configContents = "`n[wsl2]`nmemory=$totalRam`nprocessors=$configCPU\GB`nswap=$configRam\GB"
    $configContents | Out-File $configPath -Encoding utf8
}

function Configure-WSL($confOption, $cpuCore, $totalRam) {
    $configFile = "$env:USERPROFILE\.wslconfig"
    $configFileBck = "$env:USERPROFILE\.wslconfig.bck"
    
    if(Test-Path $configFile) {
        Move-Item -Path $configFile -Destination $configFileBck -Force
    }

    switch($confOption) {
        1 { GenerateFile $configFile $cpuCore $totalRam $totalRam }
        2 { GenerateFile $configFile $cpuCore $($totalRam * 0.8) }
        3 { GenerateFile $configFile $([Math]::Round($cpuCore * 0.5)) $($totalRam * 0.5) }
        4 { GenerateFile $configFile 1 $([Math]::Floor($cpuCore * 0.3)) $($totalRam * 0.3) }
        default { Write-Host "Invalid option. Please choose a valid option (between 1-4)." }
    }

    Write-Host "Generated file $configFile"
}

function main {
    Write-Host "`nSet4wsl`n - Configuration WSL"

    $cpuCore, $totalRam = Check-SysInfo
    Write-Host "System Information`n - CPU: $cpuCore Core`n - RAM: $totalRam GB`n"

    Write-Host "Set4wsl`n  1) Everything  Share`n  2) High Performance`n  3) Balance Control`n  4) Limited Resource"
    $confOption = Read-Host "Choose option:  "
    Configure-WSL $confOption $cpuCore $totalRam

    Write-Host "Finish!`nIf you running WSL, please restart WSL: wsl --shutdown"
}

main
 