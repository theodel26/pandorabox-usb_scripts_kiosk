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
- sudo ./deploy-kiosk.sh (after replacing "pandora" with the correct user in PANDORA_USER)  

  <b>WARNING</b> : The pandora-box.desktop and start-pandora.sh scripts have the parent directory as /home/pandora by default.  
  This will also need to be changed if the username is not "pandora" !

- sudo reboot

Pandora-box will now be full screen without title bar !  
HMI limited for more security !!
