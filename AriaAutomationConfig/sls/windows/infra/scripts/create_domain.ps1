# Name: create-domain.ps1
# Description: Creates domain with pre-defined variables
# Declare variables

Set-Content -Path 'C:\saltstack.txt' -Value 'create_domain.ps1 powershell running'

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