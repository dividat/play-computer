#!/bin/sh

# disable power saving, screensaver and screen dimming
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver logout-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gnome.desktop.session idle-delay 0

while true
do
  chromium-browser --disable-infobars --kiosk https://play.dividat.com/
done
