<h2>Set up graphical kiosk mode for pandora-box</h2>

First start by installing pandora-box : https://github.com/dbarzin/pandora-box

<h3>Kiosk mode configuration</h3>

Enable autologin with sudo nano /etc/gdm3/custom.conf :

[daemon]  
AutomaticLoginEnable = True  
AutomaticLogin = pandora  (or the corresponding user)

And enter the following commands on the terminal :

- sudo apt install -y git
- cd /home/pandora
- git clone https://github.com/theodel26/pandorabox-usb_scripts_kiosk
- cd /home/pandora/pandorabox-usb_scripts_kiosk
- git pull
- sudo ./deploy-kiosk.sh (before entering the command, ensure that the correct user is configured in the script)  

  <b>WARNING</b> : 
The pandora-box.desktop and start-pandora.sh scripts use the parent directory /home/pandora by default. You will also need to modify the directories in these files before restarting the machine if the username is not "pandora" !

   *Example: If the user is “pandoraa”, use /home/<b>pandoraa</b> instead of /home/<b>pandora</b>*

- sudo reboot

Pandora-box will now be full screen without title bar !  
HMI limited for more security !!
