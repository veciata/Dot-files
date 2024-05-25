# Hyprland Configuration for my 2 Monitor Setup

Welcome to my Hyprland configuration repository! This setup is optimized for a dual monitor system.

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Keybindings](#keybindings)
- [Screenshots](#screenshots)
- [Credits](#credits)

## Introduction
This repository contains my personal configuration files for [Hyprland](https://github.com/hyprwm/Hyprland), a dynamic tiling Wayland compositor. The configuration is tailored for a two-monitor setup and includes settings for various applications and utilities to enhance productivity.

## Installation
To use this configuration, follow these steps:

1. Clone the repository:
   ```sh
   git clone https://github.com/veciata/Dot-files.git

    Copy the configuration files to your home directory:

2. manually link your config or clone like here
    ```sh

    cp -r Dot-files/.config/ ~/
    cp Dot-files/.zshrc ~/
3. install nesseserry packages
    ```sh
   sudo pacman -Syu hyprland waybar rofi zsh alacritty neovim swaybg wl-clipboard brightnessctl pavucontrol grim slurp thunar network-manager-applet playerctl ttf-jetbrains-mono papirus-icon-theme




Keybindings

Here are some of the keybindings defined in the configuration:

    Super + Return: Open terminal
    Super + D: Open application launcher (rofi)
    Super + Q or Alt + F4: Close focused window
    Super + H/J/K/L: Move focus between windows
    Super + Shift + H/J/K/L: Move windows
    Super + F: Toggle fullscreen
    Super + E: File manager
    Super + W: Web browser
    Super + (1-0): Workspaces 1 to 10 monitor 1
    SuperAlt + (1-0): Workspaces 11-20 monitor 2

Screenshots


Credits

    Hyprland
    Waybar
    Rofi

Feel free to customize and extend the configuration to suit your needs. If you encounter any issues or have suggestions, please open an issue on this repository.
