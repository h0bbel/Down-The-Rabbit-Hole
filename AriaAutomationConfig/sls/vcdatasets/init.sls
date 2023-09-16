# Name: vcdatasets/init.sls
# Version 0.1
#
# Description: Get vSphere Dataset via VMware Tools and set grain based on value
# 1. Copy script from salt master to minion 
# 2. Set role grain based on output from script
# 3. Clean up, delete script from minion
#
# Note: Seems like it's not possible to use jinja templates, aka {{ slspath }} in the cmd.run command.
# That's why the script is copied locally and then executed

copy-script:
  file.managed:
    - name: /tmp/script.sh
    - source: salt://{{ slspath }}/script.sh
    
roles:   
   {% set appid = salt['cmd.run']('/bin/sh -c "/tmp/script.sh"') %}
   grains.present:
    - value: {{ appid }}
    
delete-script:
 file.absent:
    - name: /tmp/script.sh