# Linux System Configuration and Update Scripts
This repository contains configurations and helpful scripts for various Linux distributions including openSUSE, Fedora, and Debian-based systems, documenting things as they are figured out.

## Prerequisites

Before using these scripts, ensure you have the following installed:

**Required:**
- `bash` - All scripts use Bash shell
- `sudo` - Administrative privileges needed for system updates
- `flatpak` - For Flatpak application updates

**Optional (depending on which features you want to use):**
- `curl` - Required for Ollama updates
- `docker` - For Docker image pruning

## Usage

1. **Make scripts executable:**
   ```bash
   chmod +x update-debian.sh update-fedora.sh update-opensuse.sh SUSE.sh
   ```

2. **Run the appropriate script for your distribution:**
   ```bash
   # For Debian/Ubuntu:
   ./update-debian.sh
   
   # For Fedora:
   ./update-fedora.sh
   
   # For openSUSE:
   ./update-opensuse.sh
   ```

3. **Answer prompts** for optional updates (Ollama)

4. **Review the summary** at the end to see what succeeded or failed

-------------------------------------------------------------------------------

## File Descriptions


- **common.sh** - Shared library containing error handling logic and common update functions. All update scripts source this file to provide non-blocking error reporting and reduce code duplication.
- **SUSE.sh** - This script automates initial openSUSE setup. It refreshes repositories, performs a distribution upgrade, adds the Packman repository (Tumbleweed URL), installs Flatpak, and adds the Flathub remote.
- **update-fedora.sh** - Updates system packages (DNF) and Flatpaks on Fedora. Optionally updates Ollama. Uses `common.sh` for error handling.
- **update-opensuse.sh** - Updates system packages (Zypper) and Flatpaks on openSUSE. Optionally updates Ollama. Uses `common.sh` for error handling.
- **update-debian.sh** - Updates system packages (APT) and Flatpaks on Debian/Ubuntu. Optionally updates Ollama. Uses `common.sh` for error handling.
- **killing-packagekit.txt** - Contains commands to stop or kill the PackageKit service, which can be useful if it interferes with manual package management operations.
- **alacritty-config** - Configuration file for the Alacritty terminal emulator. Removes window decorations, adds transparency (97% opacity), sets a custom window size (97x26 characters), applies Nord color scheme with a dark background, and configures an underlined blinking cursor with 14pt Monospace font.

