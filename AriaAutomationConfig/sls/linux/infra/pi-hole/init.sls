# Name: linux/infra/pi-hole/init.sls
# Version 0.1

# Description: Deploy Pi-hole via curl
# 1. Create /etc/pihole directory 
# 2. Copy setupVars.conf from salt master to minion
# 3. Run installer via curl
# 4. Update minion grain to pihole

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