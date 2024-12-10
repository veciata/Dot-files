@import url("./theme/redblue.css");

* {
  border: none;
  border-radius: 0px;
  opacity: 1;
  font-family:
    Iosevka,
    FontAwesome,
    Noto Sans CJK;
  font-size: 14px;
  font-style: normal;
  min-height: 0;
}
#waybar {
}
window#waybar {
  background: @color1;
  background-color: rgba(123, 123, 123, 0.1);
  border-bottom: 3px solid @color1;
  color: @color5;
}

#custom-date,
#custom-swaync,
#custom-dunst_history,
#wlr-taskbar,
#custom-clock,
#custom-weather,
#battery,
#cpu,
#memory,
#disk,
#custom-hyprpicker,
#bluetooth,
#tray,
#pulseaudio,
#network,
#custom-randwall,
#backlight,
#custom-updates,
#custom-launcher {
  background: @color2;
  padding: 2px 4px;
  margin: 1px 3px 5px 3px;
  border-radius: 8px;
}
