# Name: add_dc.ps1
# Description: Promote a new server to a domain controller
# Required credentials — Need to find a script that works.
# Declare variables

Set-Content -Path 'C:\saltstack.txt' -Value 'add_dc.ps1 Status is; I ran!'

Set-DNSClientServerAddress "Ethernet0" -ServerAddresses ("10.2.11.190")

$DatabasePath = "c:windowsNTDS"
$DomainName = "area51.internal"
$DomainNetBIOSName = "AREA51"
$LogPath = "c:windowsNTDS"
$SysVolPath = "c:windowsSYSVOL"
$Password = (ConvertTo-SecureString -String "Pass1w0rd" -AsPlainText -Force)

# Add New DC
Install-ADDSDomainController -CreateDnsDelegation:$false -DatabasePath $DatabasePath -DomainName $DomainName -SafeModeAdministratorPassword $Password -LogPath $LogPath -InstallDns:$true -NoRebootOnCompletion:$false -SysvolPath $SysVolPath -Force:$true