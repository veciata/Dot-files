#!/bin/bash
[ ! -d ~/Pictures/Screenshots ] && mkdir -p ~/Pictures/Screenshots
hyprshot -m region -o ~/Pictures/Screenshots/ -z
