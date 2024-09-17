#!/bin/bash
[ ! -d ~/Pictures/Screenshots ] && mkdir -p ~/Pictures/Screenshots
grimblast --notify copysave area ~/Pictures/Screenshots/$(date +'%s_screenshot.png')
