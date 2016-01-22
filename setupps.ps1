Enable-PSRemoting –force
Set-Service WinRM -StartMode Automatic
Get-WmiObject -Class win32_service | Where-Object {$_.name -like "WinRM"}
Set-Item WSMan:localhost\Client\TrustedHosts -value *
Get-Item WSMan:\localhost\Client\TrustedHosts
set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1   
