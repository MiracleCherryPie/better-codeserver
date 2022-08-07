#!/bin/bash
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
cat >> /etc/pacman.conf << EOF
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
pacman -Syyu --noconfirm --needed yay
cat >> /etc/sudoers << EOF
runner ALL=(ALL:ALL) NOPASSWD: ALL
EOF
su -l runner -c "curl -fsSL https://code-server.dev/install.sh | sh"
