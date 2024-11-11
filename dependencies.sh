#!/bin/bash

# Function to check if a command exists
function command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for Git
if ! command_exists git; then
  echo "Git not found. Installing..."

  # Try different package managers
  if command_exists apt; then
    sudo apt update
    sudo apt install git
  elif command_exists yum; then
    sudo yum install git
  elif command_exists dnf; then
    sudo dnf install git
  elif command_exists pacman; then
    sudo pacman -Sy git
  elif command_exists zypper; then
    sudo zypper install git
  else
    echo "Unable to install Git. Please install it manually."
    exit 1
  fi
fi

# Check for ripgrep
if ! command_exists rg; then
  echo "ripgrep not found. Installing..."

  # Try different package managers
  if command_exists apt; then
    sudo apt update
    sudo apt install ripgrep
  elif command_exists yum; then
    sudo yum install ripgrep
  elif command_exists dnf; then
    sudo dnf install ripgrep
  elif command_exists pacman; then
    sudo pacman -Sy ripgrep
  elif command_exists zypper; then
    sudo zypper install ripgrep
  else
    echo "Unable to install ripgrep. Please install it manually."
    exit 1
  fi
fi

# Check for GCC
if ! command_exists gcc; then
  echo "GCC not found. Installing..."

  # Try different package managers
  if command_exists apt; then
    sudo apt update
    sudo apt install build-essential
  elif command_exists yum; then
    sudo yum groupinstall "Development Tools"
  elif command_exists dnf; then
    sudo dnf groupinstall "Development Tools"
  elif command_exists pacman; then
    sudo pacman -Sy base-devel
  elif command_exists zypper; then
    sudo zypper install gcc
  else
    echo "Unable to install GCC. Please install it manually."
    exit 1
  fi
fi

echo "All required tools are now installed."
