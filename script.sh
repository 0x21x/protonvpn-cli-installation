#!/bin/bash

# Install required dependencies
sudo apt-get update

# Install Proton CLI
curl -sL https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb -O /home/$USER/Downloads/protonvpn-stable-release.deb

sudo apt install /home/$USER/Downloads/protonvpn-stable-release.deb

sudo apt-get install protonvpn-cli

# Clean up
rm /home/$USER/Downloads/protonvpn-stable-release_1.0.3_all.deb

# Verify installation
proton-cli --version

# Log in to ProtonVPN
protonvpn-cli login

# Connect to ProtonVPN
protonvpn-cli connect

# Configure kill switch and DNS leak protection
protonvpn-cli ks --permanent
protonvpn-cli dns --permanent

# Enable kill switch and DNS leak protection
protonvpn-cli ks --on
protonvpn-cli dns --on

# Verify connection
protonvpn-cli status

