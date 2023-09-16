# Name: enable-rdp.sls
# Description: Enable RDP on Windows
# Note: Edit source path

enable-rdp-script:
  cmd.script:
    - source: salt://infra/scripts/enable-RDP/enable-RDP.ps1
    - shell: "powershell"
