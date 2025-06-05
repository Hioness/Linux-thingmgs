# Linux System Configuration and Update Scripts
This repository contains configurations and helpful scripts for various Linux distributions including openSUSE, Fedora, and Debian-based systems, documenting things as they are figured out.

-------------------------------------------------------------------------------

The following will be descriptions of what all the files in this repo are made to do:


- SUSE.sh - This script automates initial openSUSE setup. It refreshes repositories, performs a distribution upgrade, adds the Packman repository (Tumbleweed URL), installs Flatpak, and adds the Flathub remote.
- update-fedora.sh - Updates system packages (DNF) and Flatpaks on Fedora. Optionally updates Ollama and Open WebUI.
- update-opensuse.sh - Updates system packages (Zypper) and Flatpaks on openSUSE. Optionally updates Ollama and Open WebUI.
- update-debian.sh - Updates system packages (APT) and Flatpaks on Debian/Ubuntu. Optionally updates Ollama and Open WebUI.
- killing-packagekit.txt - Contains commands to stop or kill the PackageKit service, which can be useful if it interferes with manual package management operations.
