# Name: linux/infra/mountnfs/init.sls
# Version 0.1
#
# Description: 
# 1. Install nfs-common package if it isn't already installed.
# 2. create /mnt/nfs mountpoint
# 3. mount nfs


install nfs-common:
  pkg.installed:
    - name: nfs-common
    - test: True

create_mount_point:
  file.directory:
    - name: /mnt/nfs

mount_data:
  mount.mounted:
    - name: /mnt/nfs
    - device: netapp:/data1
    - mkmnt: True
    - fstype: nfs
    - require:
      - file: create_mount_point

demo_create_file:
  file.managed:
    - name: /mnt/nfs/minions/{{grains["id"]}}
