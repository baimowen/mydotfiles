#!/usr/bin/env bash

# Check if running as root. If root, script will exit.
if [[ $EUID -eq 0 ]]; then
  echo "This script should not be executed as root! Exiting..."
  exit 1
fi

# Check if using NixOS. If not using NixOS, script will exit.
if [[ ! "$(grep -i nixos </etc/os-release)" ]]; then
  echo "This installation script only works on NixOS! Download an iso at https://nixos.org/download/"
  echo "Keep in mind that this script is not intended for use while in the live environment."
  exit 1
fi