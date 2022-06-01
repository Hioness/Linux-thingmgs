#!/bin/bash

sudo zypper dist-upgrade -y

sudo zypper ref

sudo zypper update -y

sudo dnf update -y

sudo flatpak update -y

sudo snap refresh
