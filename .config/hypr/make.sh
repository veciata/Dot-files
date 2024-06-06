# Genel ayarlar dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/general.conf
echo 'monitor=eDP-1,1920x1080@144,0x0,1
monitor=HDMI-A-1,1366x768@60,1920x0,1

general {
    layout=master
    sensitivity=1.0
    gaps_in=12
    gaps_out=8
    border_size=2
    col.active_border=0xff5e81ac
    col.inactive_border=0xaaaaaaaa
    apply_sens_to_raw=0
}

gestures { 
    workspace_swipe=true 
    workspace_swipe_min_speed_to_force=5
}

misc {
    disable_hyprland_logo=true
    disable_splash_rendering=true
    mouse_move_enables_dpms=true
    vfr=false
}' >~/.config/hypr/general.conf

# Çalışma alanları dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/workspaces.conf
echo '# Workspaces for $m1
workspace=1,monitor:eDP-1
workspace=2,monitor:eDP-1
workspace=3,monitor:eDP-1
workspace=4,monitor:eDP-1
workspace=5,monitor:eDP-1
workspace=6,monitor:eDP-1
workspace=7,monitor:eDP-1
workspace=8,monitor:eDP-1
workspace=9,monitor:eDP-1
workspace=10,monitor:eDP-1

# Workspaces for $m2
workspace=11,monitor:HDMI-A-1
workspace=12,monitor:HDMI-A-1
workspace=13,monitor:HDMI-A-1
workspace=14,monitor:HDMI-A-1
workspace=15,monitor:HDMI-A-1
workspace=16,monitor:HDMI-A-1
workspace=17,monitor:HDMI-A-1
workspace=18,monitor:HDMI-A-1
workspace=19,monitor:HDMI-A-1
workspace=20,monitor:HDMI-A-1' >~/.config/hypr/workspaces.conf

# Yürütülecek komutlar dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/exec.conf
echo 'exec-once=waybar
exec-once=[workspace 21 silent]syncthing
exec-once=[workspace 21 silent]kdeconnect-app
exec-once=/usr/lib/polkit-kde-authentication-agent-1
exec-once=whatsapp-for-linux
exec-once=dunst
exec-once=swww init
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=fcitx5 -D
exec-once=~/.config/hypr/scripts/screenlock.sh
exec-once=~/.config/hypr/scripts/startpage.sh
exec-once=blueman-applet
exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=~/.config/hypr/scripts/screensharing.sh
exec-once=systemctl --user import-environment &
exec-once=hash dbus-update-activation-environment 2>/dev/null &
exec-once=dbus-update-activation-environment --systemd &

# Environment Variables
env=XCURSOR_SIZE=21
env=wayland,x11
env=QT_QPA_PLATFORM,wayland;xcb
env=CLUTTER_BACKEND,wayland
env=QT_QPA_PLATFORMTHEME,qt5ct
env=MOZ_ENABLE_WAYLAND,1
env=LIBVA_DRIVER_NAME,nvidia
env=XDG_SESSION_TYPE,wayland
env=GBM_BACKEND,nvidia-drm
env=__GLX_VENDOR_LIBRARY_NAME,nvidia
env=WLR_NO_HARDWARE_CURSORS,1' >~/.config/hypr/exec.conf

# Görünüm ve dekorasyon dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/appearance.conf
echo 'decoration {
    rounding=6
    inactive_opacity=0.80
    blur {
        enabled=true
        size=12
        passes=8
    }
    drop_shadow=true
    shadow_range=25
    col.shadow=0xffa7caff
    col.shadow_inactive=0x50000000
}

blurls=waybar
blurls=lockscreen' >~/.config/hypr/appearance.conf

# Giriş dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/input.conf
echo 'input {
    kb_options=caps:swapescape
    kb_layout=tr
    repeat_rate=50
    repeat_delay=240
}' >~/.config/hypr/input.conf

# Animasyonlar dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/animations.conf
echo 'animations {
    enabled=1
    bezier=overshot,0.05,0.9,0.1,1.1
    bezier=overshot,0.13,0.99,0.29,1.1
    animation=windows,1,4,overshot,popin
    animation=fade,1,10,default
    animation=workspaces,1,6,overshot,slide
    animation=border,1,10,default
}

dwindle {
    pseudotile=false
    force_split=1
    smart_split=true
    no_gaps_when_only=true
}

master {
    new_on_top=true
    no_gaps_when_only=true
}' >~/.config/hypr/animations.conf

# Klavye kısayolları dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/keybindings.conf
echo 'bind=SUPER,X,exec,swaylock
bind=SUPER,Q,killactive
bind=SUPER,B,exec,onlyoffice
bind=SUPER,F,fullscreen,1
bind=SUPERSHIFT,F,fullscreen,0
bind=SUPER,RETURN,exec,kitty
bind=SUPER,C,killactive
bind=SUPER,M,exit
bind=SUPER,E,exec,nautilus
bind=SUPER,D,exec,rofi -show drun
bind=SUPER,S,exec,~/.config/hypr/rofi-web-search.sh
bind=SUPER,R,exec,rofi -show run
bind=SUPER,P,pseudo
bind=SUPER,ESCAPE,exec,sudo systemctl suspend
bind=SUPER,W,exec,floorp
bind=SUPERSHIFT,W,exec,floorp -p "web page"

bind=,XF86AudioMute,exec,~/.config/hypr/scripts/volume mute
bind=,XF86AudioLowerVolume,exec,~/.config/hypr/scripts/volume down
bind=,XF86AudioRaiseVolume,exec,~/.config/hypr/scripts/volume up
bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle

bindle=,XF86MonBrightnessUp,exec,~/.config/hypr/scripts/brightness.sh up
bindle=,XF86MonBrightnessDown,exec,~/.config/hypr/scripts/brightness.sh down
bind=SUPERSHIFT,C,exec,bash ~/.config/hypr/scripts/hyprPicker.sh
bind=SUPERSHIFT,E,exec,wlogout
bind=SUPER,T,togglefloating
bind=SUPERSHIFT,P,exec,pomotroid --in-process-gpu

bind=SUPERCTRLSHIFT,S,exec,grim -g "$(slurp)" - | swappy -f -
bind=SUPERSHIFT,S,exec,zsh ~/Scripts/screen.sh
bind=SUPERSHIFT,R,exec,wf-recorder -g "$(slurp)"
bind=SUPER,O,exec,lutris
bind=SUPER,P,exec,lollypop

bind=SUPER,j,movefocus,d
bind=SUPER,k,movefocus,u
bind=SUPER,h,movefocus,l
bind=SUPER,l,movefocus,r

bind=SUPER,left,resizeactive,-40 0
bind=SUPER,right,resizeactive,40 0
bind=SUPER,up,resizeactive,0 -40
bind=SUPER,down,resizeactive,0 40

bind=SUPERSHIFT,h,movewindow,l
bind=SUPERSHIFT,l,movewindow,r
bind=SUPERSHIFT,k,movewindow,u
bind=SUPERSHIFT,j,movewindow,d

bind=SUPER,1,workspace,1
bind=SUPER,2,workspace,2
bind=SUPER,3,workspace,3
bind=SUPER,4,workspace,4
bind=SUPER,5,workspace,5
bind=SUPER,6,workspace,6
bind=SUPER,7,workspace,7
bind=SUPER,8,workspace,8
bind=SUPER,9,workspace,9
bind=SUPER,0,workspace,10

bind=SUPERSHIFT,1,movetoworkspace,1
bind=SUPERSHIFT,2,movetoworkspace,2
bind=SUPERSHIFT,3,movetoworkspace,3
bind=SUPERSHIFT,4,movetoworkspace,4
bind=SUPERSHIFT,5,movetoworkspace,5
bind=SUPERSHIFT,6,movetoworkspace,6
bind=SUPERSHIFT,7,movetoworkspace,7
bind=SUPERSHIFT,8,movetoworkspace,8
bind=SUPERSHIFT,9,movetoworkspace,9
bind=SUPERSHIFT,0,movetoworkspace,10' >~/.config/hypr/keybindings.conf

# Pencere kuralları dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/windowrules.conf
echo 'windowrule = float,class:^(Calculator|calamares|pavucontrol|bitwarden|Qalculate-gtk)$
windowrule = float,title:^(Waydroid)$
windowrule = float,windowtype:popup
windowrule = workspace,6,steam
windowrule = workspace,8,discord
windowrule = workspace,9,whatsapp-for-linux
windowrule = workspace,10,code-oss' >~/.config/hypr/windowrules.conf

# Ana yapılandırma dosyasını oluştur ve içeriğini yaz
touch ~/.config/hypr/hyprland.conf
echo 'include general.conf
include workspaces.conf
include exec.conf
include appearance.conf
include input.conf
include animations.conf
include keybindings.conf
include windowrules.conf' >~/.config/hypr/hyprland.conf
