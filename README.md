# Linux System Configuration and Update Scripts
This repository contains configurations and helpful scripts for various Linux distributions including openSUSE, Fedora, and Debian-based systems, documenting things as they are figured out.

-------------------------------------------------------------------------------

The following will be descriptions of what all the files in this repo are made to do:


- **SUSE.sh** - This script automates initial openSUSE setup. It refreshes repositories, performs a distribution upgrade, adds the Packman repository (Tumbleweed URL), installs Flatpak, and adds the Flathub remote.
- **update-fedora.sh** - Updates system packages (DNF) and Flatpaks on Fedora. Optionally updates Ollama and Open WebUI. Includes commented-out sections for updating Qwen Code and Gemini CLI via npm (uncomment to enable).
- **update-opensuse.sh** - Updates system packages (Zypper) and Flatpaks on openSUSE. Optionally updates Ollama and Open WebUI. Includes commented-out sections for updating Qwen Code and Gemini CLI via npm (uncomment to enable).
- **update-debian.sh** - Updates system packages (APT) and Flatpaks on Debian/Ubuntu. Optionally updates Ollama and Open WebUI. Includes commented-out sections for updating Qwen Code and Gemini CLI via npm (uncomment to enable).
- **killing-packagekit.txt** - Contains commands to stop or kill the PackageKit service, which can be useful if it interferes with manual package management operations.
- **alacritty-config** - Configuration file for the Alacritty terminal emulator. Removes window decorations, adds transparency (97% opacity), sets a custom window size (97x26 characters), applies Nord color scheme with a dark background, and configures an underlined blinking cursor with 14pt Monospace font.

## Optional npm Package Updates

The update scripts include optional sections (currently commented out) for updating:
- **Qwen Code** (`@qwen-code/qwen-code`) - AI-powered code assistant
- **Gemini CLI** (`@google/gemini-cli`) - Google's Gemini API command-line interface

To enable these updates on a specific machine, uncomment the relevant sections in your update script. npm will automatically check if updates are needed before installing.
