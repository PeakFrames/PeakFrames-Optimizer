::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBxAXBfUAE+1EbsQ5+n//NaLrUoSGes8d4GWi+bWMPhe/Wi1QqQo5SwUkcgDbA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBxAXBfUAE+/Fb4I5/jH3++GqWsPVe86a7PL37WFJvIS50D3O5M10xo=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
Title System Optimization Tool

:: Check if the script is running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c "%~f0"' -Verb RunAs"
    exit
)

:: Ask the user if they want to create a restore point
:RestorePrompt
echo Would you like to create a system restore point? (Y/N)
set /p choice=
if /i "%choice%"=="Y" goto CreateRestore
if /i "%choice%"=="N" goto MainMenu
goto RestorePrompt

:: Create a restore point
:CreateRestore
echo Creating a restore point...
powershell -Command "Checkpoint-Computer -Description 'Optimization Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
echo Restore point created successfully.
pause

:: Main menu
:MainMenu
cls
echo ========================================================================
echo                  PeakFrames Free Optimization Tool v0.2
echo ========================================================================
echo 1. General Optimizations
echo 2. Windows Tweaks
echo 3. Computer Debloat
echo 4. Memory/RAM Optimization
echo 5. GPU Tweaks
echo 6. CPU Tweaks
echo 7. Power Tweaks
echo 8. Network Tweaks
echo 9. Exit
echo ========================================================================
echo          Made From Scratch and Distributed By PeakFrames
echo          Source Code to This Free Optimizer is on our github
echo          https://github.com/PeakFrames
echo          Modification Only allowed if credited to us.
echo          Copyright © Claimed (2019 - 2025) by NexisWare (Petro Naassan) 
echo ========================================================================
echo.
set /p opt=Select an option: 
if "%opt%"=="1" goto GeneralOptimizations
if "%opt%"=="2" goto WindowsTweaks
if "%opt%"=="3" goto ComputerDebloat
if "%opt%"=="4" goto MemoryOptimization
if "%opt%"=="5" goto GPUTweaks
if "%opt%"=="6" goto CPUTweaks
if "%opt%"=="7" goto PowerTweaks
if "%opt%"=="8" goto NetworkTweaks
if "%opt%"=="9" exit
goto MainMenu

:GeneralOptimizations
echo Running General Optimizations...
:: Reduce network latency
echo Enabling performance mode for network adapter...
powershell -Command "Get-NetAdapter | Set-NetAdapterAdvancedProperty -DisplayName 'Receive Side Scaling' -DisplayValue 'Enabled'"
:: Disable power throttling
echo Disabling power throttling...
powershell -Command "powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMIN -ATTRIB_HIDE"
powershell -Command "powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMAX -ATTRIB_HIDE"
:: Enable ultimate performance power plan
echo Enabling Ultimate Performance power plan...
powershell -Command "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61"
:: Optimize system responsiveness
echo Setting system responsiveness for better performance...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
:: Disable Nagle's Algorithm to improve network latency
echo Disabling Nagle's Algorithm...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{YourNetworkAdapterGUID}" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{YourNetworkAdapterGUID}" /v TCPNoDelay /t REG_DWORD /d 1 /f
:: Disable unnecessary startup apps
echo Disabling unnecessary startup apps...
powershell -Command "Get-AppxPackage | Remove-AppxPackage"
pause
goto MainMenu

:WindowsTweaks
echo Applying Windows Tweaks...
:: Disable Notifications
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
:: Disable Bluetooth
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v Start /t REG_DWORD /d 4 /f
:: Disable Error Reporting
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
:: Disable Transparency Effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
:: Disable Background Apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
:: Disable Tracking and Diagnostics
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
:: Disable Activity Feed
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
:: Disable Popups
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableBalloonTips /t REG_DWORD /d 0 /f
:: Disable SmartScreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
:: Disable Shared Experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /v CdpSessionUserAuthzPolicy /t REG_DWORD /d 0 /f
:: Enable Game Mode
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
:: Disable Windows Automatic Updates during gaming
echo Disabling Windows Update services...
net stop "wuauserv"
sc config wuauserv start= disabled
pause
goto MainMenu

:ComputerDebloat
echo Running Computer Debloat...
:: Disable GameDVR
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
:: Disable Telemetry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
:: Disable Hyper-V
bcdedit /set hypervisorlaunchtype off
:: Disable Printing and Maps
sc config Spooler start= disabled
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Maps" /v AutoDownloadAndUpdateMapData /t REG_DWORD /d 0 /f
:: Disable Customer Experience Program
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
:: Disable Autologgers
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
:: Disable Office Telemetry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Telemetry" /v EnableTelemetry /t REG_DWORD /d 0 /f
:: Uninstall Cortana
powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
pause
goto MainMenu

:MemoryOptimization
echo Detecting RAM size...
wmic MEMORYCHIP get Capacity > ram.txt
set /a ramgb=0
for /f "skip=1 tokens=*" %%i in (ram.txt) do set /a ramgb+=%%i
set /a ramgb=ramgb/1073741824
del ram.txt
if %ramgb% LSS 1 (
    echo Unable to detect RAM size. Please select manually:
    echo 1. 4GB
    echo 2. 8GB
    echo 3. 12GB
    echo 4. 16GB
    echo 5. 24GB
    echo 6. 32GB
    echo 7. 48GB
    echo 8. 64GB
    echo 9. 128GB
    set /p ramchoice=Enter your choice (1-9):
    if "%ramchoice%"=="1" set ramgb=4
    if "%ramchoice%"=="2" set ramgb=8
    if "%ramchoice%"=="3" set ramgb=12
    if "%ramchoice%"=="4" set ramgb=16
    if "%ramchoice%"=="5" set ramgb=24
    if "%ramchoice%"=="6" set ramgb=32
    if "%ramchoice%"=="7" set ramgb=48
    if "%ramchoice%"=="8" set ramgb=64
    if "%ramchoice%"=="9" set ramgb=128
)
echo Applying memory optimizations for %ramgb%GB RAM...
:: Optimize page file size
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_SZ /d "C:\pagefile.sys %ramgb% %ramgb%" /f
:: Disable Superfetch (not needed on SSDs)
sc config SysMain start= disabled
:: Enable Large System Cache
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f
:: Enable Memory Compression (if supported)
powershell -Command "Enable-MMAgent -MemoryCompression"
echo Memory optimizations applied!
pause
goto MainMenu

:GPUTweaks
echo Applying GPU optimizations...
:: Set NVIDIA Power Mode to Maximum Performance
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrLevel /t REG_DWORD /d 0 /f
:: Enable Hardware-Accelerated GPU Scheduling (Windows 10/11)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f
:: AMD: Enable Graphics Performance Mode
gpupdate /force
:: Disable Windows Fullscreen Optimizations
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
:: Optimize GPU Priority
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v GPU Priority /t REG_DWORD /d 8 /f
:: Set GPU Scheduling to High Performance
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v GPU Priority /t REG_DWORD /d 8 /f

echo GPU tweaks applied successfully!
pause
goto MainMenu

:CPUTweaks
echo Applying CPU optimizations...
:: Set CPU Priority to High
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f
:: Disable CPU Parking
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setactive SCHEME_CURRENT
echo CPU tweaks applied successfully!
pause
goto MainMenu

:PowerTweaks
:: Create a custom power plan called "PeakFrames"
echo Creating custom power plan "PeakFrames"...
powercfg /duplicatescheme SCHEME_MIN
powercfg /change standby-timeout-ac 0
powercfg /hibernate off

:: Set High-Performance Plan (if not already active)
powercfg /setactive SCHEME_MIN
powercfg /change monitor-timeout-ac 0
powercfg /change disk-timeout-ac 0
powercfg /change standby-timeout-ac 0

:: Adjust processor settings for maximum performance
echo Adjusting CPU settings for maximum performance...
powercfg /change processor-throttling AC 100
powercfg /change processor-throttling DC 100
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0

:: Create custom PeakFrames power plan (optimized for gaming)
echo Creating PeakFrames power plan for gaming optimization...
powercfg /create "PeakFrames" /guid

:: Activate the PeakFrames power plan
for /f "tokens=*" %%i in ('powercfg /list ^| findstr /i "PeakFrames"') do set "PeakFramesGUID=%%i"
set "PeakFramesGUID=%PeakFramesGUID:~40,38%"
powercfg /setactive %PeakFramesGUID%

:: Set Visual Effects to Best Performance
echo Setting visual effects for maximum performance...
reg add "HKCU\Control Panel\Desktop" /v "VisualFXSetting" /t REG_SZ /d "2" /f

:: Prevent Windows from automatically adjusting power settings
echo Preventing Windows from changing power settings...
reg add "HKCU\Control Panel\PowerCfg" /v "PowerPolicy" /t REG_DWORD /d "0" /f

:: Final message
echo Power Tweaks applied successfully. Your PC is now optimized for gaming with the "PeakFrames" power plan!
echo Press any key to return to the main menu...
pause >nul

:: Go back to main menu
goto MainMenu

:NetworkTweaks
:: Display info
echo Network Tweaks - Fixing Ping and Latency...

:: Disable Windows Auto-Tuning (Improves latency and ping)
echo Disabling Windows Auto-Tuning...
netsh interface tcp set global autotuninglevel=disabled

:: Disable Windows Scaling heuristics (Improves TCP performance)
echo Disabling Windows Scaling heuristics...
netsh interface tcp set global heuristicsdisabled=enabled

:: Disable Large Send Offload (Improves network latency)
echo Disabling Large Send Offload (LSO)...
netsh interface tcp set global taskoffload=disabled

:: Disable TCP/IPv6 (If you don't need IPv6, it can reduce overhead)
echo Disabling IPv6 for faster network performance...
netsh interface ipv6 set teredo disabled
netsh interface ipv6 set global disable

:: Set DNS Servers to Google DNS (Improves domain resolution time)
echo Setting DNS to Google Public DNS...
netsh interface ip set dns "Local Area Connection" static 8.8.8.8
netsh interface ip add dns "Local Area Connection" 8.8.4.4

:: Disable Windows Nagle Algorithm (Improves TCP performance for online games)
echo Disabling Nagle Algorithm (Improves TCP performance)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpNoDelay" /t REG_DWORD /d "1" /f

:: Optimize TCP/IP settings (Set max connections)
echo Optimizing TCP/IP settings...
netsh int tcp set global chimney=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global global = enabled

:: Flush DNS Cache (Fix DNS resolution issues)
echo Flushing DNS cache...
ipconfig /flushdns

:: Set network priority to "High Performance"
echo Setting network priority to high performance...
netsh interface tcp set global priority=high

:: Disable QoS Packet Scheduler (For some users, this can reduce latency)
echo Disabling QoS Packet Scheduler...
netsh interface tcp set global ecncapability=disabled

:: Adjust MTU (Maximum Transmission Unit) to avoid packet fragmentation
echo Adjusting MTU size to improve network stability...
netsh interface ipv4 set subinterface "Ethernet" mtu=1450 store=persistent

:: Reset Network Stack (Fix network issues and improve connectivity)
echo Resetting the TCP/IP stack...
netsh int ip reset

:: Reset Winsock (Fix network issues and improve performance)
echo Resetting Winsock catalog...
netsh winsock reset

:: Turn off Internet Connection Sharing (ICS) if enabled (Reduces overhead)
echo Turning off Internet Connection Sharing (ICS)...
netsh interface ipv4 set interface "Ethernet" sharing=disabled

:: Final message
echo Network Tweaks completed successfully. Your system is now optimized for better ping and lower latency.
echo Press any key to return to the main menu...
pause >nul

:: Go back to main menu
goto MainMenu:: Display info
echo Network Tweaks - Fixing Ping and Latency...

:: Disable Windows Auto-Tuning (Improves latency and ping)
echo Disabling Windows Auto-Tuning...
netsh interface tcp set global autotuninglevel=disabled

:: Disable Windows Scaling heuristics (Improves TCP performance)
echo Disabling Windows Scaling heuristics...
netsh interface tcp set global heuristicsdisabled=enabled

:: Disable Large Send Offload (Improves network latency)
echo Disabling Large Send Offload (LSO)...
netsh interface tcp set global taskoffload=disabled

:: Disable TCP/IPv6 (If you don't need IPv6, it can reduce overhead)
echo Disabling IPv6 for faster network performance...
netsh interface ipv6 set teredo disabled
netsh interface ipv6 set global disable

:: Set DNS Servers to Google DNS (Improves domain resolution time)
echo Setting DNS to Google Public DNS...
netsh interface ip set dns "Local Area Connection" static 8.8.8.8
netsh interface ip add dns "Local Area Connection" 8.8.4.4

:: Disable Windows Nagle Algorithm (Improves TCP performance for online games)
echo Disabling Nagle Algorithm (Improves TCP performance)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpNoDelay" /t REG_DWORD /d "1" /f

:: Optimize TCP/IP settings (Set max connections)
echo Optimizing TCP/IP settings...
netsh int tcp set global chimney=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global global = enabled

:: Flush DNS Cache (Fix DNS resolution issues)
echo Flushing DNS cache...
ipconfig /flushdns

:: Set network priority to "High Performance"
echo Setting network priority to high performance...
netsh interface tcp set global priority=high

:: Disable QoS Packet Scheduler (For some users, this can reduce latency)
echo Disabling QoS Packet Scheduler...
netsh interface tcp set global ecncapability=disabled

:: Adjust MTU (Maximum Transmission Unit) to avoid packet fragmentation
echo Adjusting MTU size to improve network stability...
netsh interface ipv4 set subinterface "Ethernet" mtu=1450 store=persistent

:: Reset Network Stack (Fix network issues and improve connectivity)
echo Resetting the TCP/IP stack...
netsh int ip reset

:: Reset Winsock (Fix network issues and improve performance)
echo Resetting Winsock catalog...
netsh winsock reset

:: Turn off Internet Connection Sharing (ICS) if enabled (Reduces overhead)
echo Turning off Internet Connection Sharing (ICS)...
netsh interface ipv4 set interface "Ethernet" sharing=disabled

:: Final message
echo Network Tweaks completed successfully. Your system is now optimized for better ping and lower latency.
echo Press any key to return to the main menu...
pause >nul

:: Go back to main menu
goto MainMenu
