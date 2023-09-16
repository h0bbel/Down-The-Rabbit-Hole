# Name: enable-rdp.sls
# Description: Enable RDP on Windows (Server?)

enable-rdp-script:
  cmd.script:
    - source: salt://infra/scripts/enable-RDP/enable-RDP.ps1
    - shell: "powershell"
