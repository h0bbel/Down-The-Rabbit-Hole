###########################
# Get vSphere Dataset and set role accordingly
#
# Seems like it's not possible to use jinja templates, aka {{ slspath }} in the cmd.run command.

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