#!/bin/bash
#collection of commands to be carried out directly after fresh install of xUbuntu 18.04
#using a local screen, keyboard and mouse. Note after this script the login GUI is dectivated
#A GUI for this machine will be only be available via VNC
#to be executed from the directory the
#get system to most rescent state
sudo apt-get -y update
sudo apt-get -y upgrade

#synaptic gnome disk, open ssh, vnc4server
#logged in as user
sudo apt-get install -y synaptic gnome-disk-utility openssh-server build-essential vnc4server xfce4 xfce4-goodies chromium-browser tree gnome-system-monitor baobab

#set chromium as default browser
xdg-settings set default-web-browser chromium-browser.desktop

#setup vnc - dialogue box should be requested
echo "please enter vnc password for user minknow"
vncpasswd

#copy working xstartup to .vnc directory
cp add_config_files/xstartup ~/.vnc/
chmod +x ~/.vnc/xstartup

#create script folder for starting vnc server:
mkdir ~/scripts/
cp  add_config_files/vnc_start.sh ~/scripts
chmod +x ~/scripts/vnc_start.sh

#To disable the GUI for login - otherwise usually for GPU systems
sudo systemctl set-default multi-user.target
#echo "reboot system now"
#dialogue before reboot to find possible errors that might occur
read -p "please enter y for immidiate reboot" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo reboot
fi
