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
