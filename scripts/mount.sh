#!/bin/bash
# mount.sh

set -e

# create temporary credentials file from doppler secrets
umask 0077
echo -e "username=${SMB_USER}\npassword=${SMB_PASS}" > /home/rstudio/.smbcredentials

# create mounting points for servers
mkdir -p /mnt/datasets /mnt/datasets

# Find the user id for rstudio
MOUNT_UID=$(id -u rstudio)
MOUNT_GID=$(id -g rstudio)

# mount datasets server using temporary credentials file
mount -t cifs -o credentials=/home/rstudio/.smbcredentials,uid=${MOUNT_UID},gid=${MOUNT_GID},file_mode=0777,dir_mode=0777 //resfs.home.ku.edu/groups_hipaa/lsi/jgirard/general/datasets /mnt/datasets

# mount projects server using temporary credentials file
mount -t cifs -o credentials=/home/rstudio/.smbcredentials,uid=${MOUNT_UID},gid=${MOUNT_GID},file_mode=0777,dir_mode=0777 //resfs.home.ku.edu/groups_hipaa/lsi/jgirard/general/projects /mnt/projects

# securely delete temporary credentials file
shred -u /home/rstudio/.smbcredentials
