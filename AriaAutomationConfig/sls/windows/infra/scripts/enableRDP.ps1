# Name: enable-RDP.ps1
# Description: Enabled RDP on Windows

Set-Content -Path 'C:\saltstack.txt' -Value 'enableRDP.ps1 Status is; I ran!'

# Enable RDP 
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
