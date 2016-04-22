#!/bin/bash

# make the script exit as soon as any command errors
set -ev

MACHINE=$1

# Install packages
PACKAGES="fish lightdm vim xorg-x11-server-Xdmx"
if $(ping -w 1 -c 1 google.com &>/dev/null); then
	dnf install -y $PACKAGES
else
	dnf install -y --cacheonly $PACKAGES || true
fi

# Set fish as the default shell
chsh -s /usr/bin/fish pdragons

# Allow TCP port listening for X
LIGHTDMCONF=/etc/lightdm/lightdm.conf
LINE=`grep -n '\[XDMCPServer\]' "$LIGHTDMCONF" | cut -d: -f1`
LINE=$((LINE+1))
sed --in-place 's/#xserver-allow-tcp=true/xserver-allow-tcp=true/' "$LIGHTDMCONF"
sed --in-place 's/#xserver-allow-tcp=false/xserver-allow-tcp=true/' "$LIGHTDMCONF"
# This also requires the GUI changes via 'gnome-control-center user-accounts'
sed --in-place 's/#autologin-user=/autologin-user=pdragons/' "$LIGHTDMCONF"
#sed --in-place 's/#autologin-user-timeout=0/autologin-user-timeout=0/' "$LIGHTDMCONF"
sed --in-place "$LINE""s/#enabled=false/enabled=true/" "$LIGHTDMCONF"

# Enable X11Forwarding
sed --in-place 's/#X11Forwarding\ yes/X11Forwarding yes/' /etc/ssh/sshd_config

# Disable GDM; enable LightDM
systemctl disable gdm.service
systemctl enable lightdm.service

# Enable SSH
systemctl enable sshd

# Allow X connections from anywhere by running "xhost +" when the user logs in
mkdir -p ~pdragons/.config/fish
echo "xhost +" | dd of=~pdragons/.config/fish/config.fish
chown -R pdragons:pdragons ~pdragons/.config/fish

# Set hostname manually
echo "tdt-$MACHINE" | dd of=/etc/hostname

# Restart
shutdown -r 0
