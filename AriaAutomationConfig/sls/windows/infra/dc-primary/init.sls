# Name: infra/dc-primary/init.sls
# Description: Create new AD domain

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