#!/bin/bash
curr=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$curr" = "'default'" ]; then 
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
    xfconf-query -c xfwm4 -p /general/theme -s "adw-gtk3-dark-small"
    xfconf-query -c xsettings -p /Net/ThemeName -s "adw-gtk3-dark"
    kvantummanager --set KvMojave
else
    gsettings set org.gnome.desktop.interface color-scheme default
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
    xfconf-query -c xfwm4 -p /general/theme -s "adw-gtk3-small"
    xfconf-query -c xsettings -p /Net/ThemeName -s "adw-gtk3"
    kvantummanager --set KvMojaveLight
fi
