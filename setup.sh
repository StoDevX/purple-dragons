#!/bin/bash

# make the script exit as soon as any command errors
set -ev

# INVARIANTS
# 1. Install Fedora on the machine *by hand*.
# 2. Set netmask (255.255.255.0), static IP (192.168.1.XY), and gateway (0.0.0.0) *by hand*.
# 3. sshpass is installed on master.
# 4. The machine is connected to St. Olaf Guest.
# 5. ssh has been run: systemctl enable sshd && systemctl start sshd
# 6. The machine's password is set to "p" via "sudo passwd pdragons"
# 7. The machine has been set to auto-login via the GUI (gnome-control-center user-accounts)

MACHINE=$1
PASSWORD='p'

sshpass -p "$PASSWORD" scp -r ~/.ssh 192.168.1.$MACHINE:~/

scp ~/setup-remote.sh 192.168.1.$MACHINE:~/
ssh -X -t pdragons@192.168.1.$MACHINE "echo \"$PASSWORD\" | sudo -S bash ~/setup-remote.sh $MACHINE"
