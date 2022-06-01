#!/bin/bash

sudo zypper dist-upgrade

sudo zypper ref

sudo zypper update

sudo zypper ar -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman

sudo zypper install flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
