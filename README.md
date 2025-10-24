<h2>Set up kiosk mode (after installing pandora-box)</h2>

Enable autologin with sudo nano /etc/gdm3/custom.conf :

[daemon]  
AutomaticLoginEnable = True  
AutomaticLogin = user  

And enter the following commands on the terminal :

- sudo apt install -y git
- cd /home/user
- git clone https://github.com/theodel26/pandorabox-usb_scripts_kiosk
- cd /home/user/pandorabox-usb_scripts_kiosk
- sudo ./deploy-kiosk.sh (after replacing "user" with the correct user in the script)
- sudo reboot
