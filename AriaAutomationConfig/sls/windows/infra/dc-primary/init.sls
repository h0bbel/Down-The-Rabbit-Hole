# Name: windows/infra/dc-primary/init.sls
# Version 0.1
#
# Description: Create new AD domain
#
# Note: Edit source: path to salt://{{ slspath }}

{% set AppID = ['ADDomainController'] %}


install_role:
  win_servermanager.installed:
    - recurse: True
    - features:
      - AD-Domain-Services
      - RSAT-AD-Tools
      - DNS
      - RSAT-DNS-Server
    - restart: False

create_domain:
  cmd.script:
    - source: salt://infra/scripts/create-domain/create-domain.ps1
    - shell: powershell
    - restart: True
    
roles:   
   grains.present:
    - value: {{ AppID }}