<h2>Set up graphical kiosk mode for pandora-box (after installing pandora-box)</h2>

Enable autologin with sudo nano /etc/gdm3/custom.conf :

[daemon]  
AutomaticLoginEnable = True  
AutomaticLogin = user  

And enter the following commands on the terminal :

- sudo apt install -y git
- cd /home/user
- git clone https://github.com/theodel26/pandorabox-usb_scripts_kiosk
- cd /home/user/pandorabox-usb_scripts_kiosk
- git pull
- sudo ./deploy-kiosk.sh (after replacing "user" with the correct user in the script)
- sudo reboot

Pandora-box will now be full screen without title bar !
IHM limited for more security !!
