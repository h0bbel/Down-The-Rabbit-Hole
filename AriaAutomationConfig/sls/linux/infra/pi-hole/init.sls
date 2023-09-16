###########################
# Deploy Pi-hole via curl #
###########################

# Make pihole config dir
make-pihole-dir:
  file.directory:
    - makedirs: True
    - name: /etc/pihole

# deploy the setupVars.conf file:
copy_setupVars_conf:
  file.managed:
    - name: /etc/pihole/setupVars.conf
    - source: salt://{{ slspath }}/files/setupVars.conf

# Install Pihole via curl.
install_pihole_latest:
  cmd.run:
  - name: 'curl -L https://install.pi-hole.net | sudo bash /dev/stdin --unattended'
    
service_installed: #switch to roles (see vsdatasets in home.lab)
 grains.present:
 - value: pihole