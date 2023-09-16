# Name: windows/infra/enable-rdp/init.sls
# Version 0.1
#
# Description: Enable RDP on Windows (Server?)
#
# Note: Edit source: path to salt://{{ slspath }}

enable-rdp-script:
  cmd.script:
    - source: salt://infra/scripts/enable-RDP/enable-RDP.ps1
    - shell: "powershell"
