# Name: add_dc.ps1
# Version 0.1
#
# Description: Promote a new server to a domain controller

# Declare variables
$DatabasePath = "c:windowsNTDS"
$DomainMode = "WinThreshold"
$DomainName = "area51.internal"
$DomainNetBIOSName = "AREA51"
$ForestMode = "WinThreshold"
$LogPath = "c:windowsNTDS"
$SysVolPath = "c:windowsSYSVOL"
$Password = (ConvertTo-SecureString -String "Pass1w0rd" -AsPlainText -Force)
# Create New AD Forest
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath $DatabasePath -DomainMode $DomainMode -DomainName $DomainName -SafeModeAdministratorPassword $Password -DomainNetbiosName $DomainNetBIOSName -ForestMode $ForestMode -InstallDns:$true -LogPath $LogPath -NoRebootOnCompletion:$false -SysvolPath $SysVolPath -Force:$true