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
- sudo ./deploy-kiosk.sh (before entering the command, ensure that the correct user is configured in the script with sudo nano deploy-kiosk.sh)

The startup script start-pandora.sh includes a fallback mechanism in case the Pandora service crashes on startup, displaying the maintenance.png image to keep kiosk mode active.  
Only three actions are required for this to work : 
- apt install feh -y (installe le logiciel d’affichage)
- sudo mv /home/<user>/pandorabox-usb_scripts_kiosk/maintenance.png /home/<user>/pandora-box/images (déplace l’image dans le bon répertoire)
- sudo visudo -f /etc/sudoers.d/display
  
And insert these two lines into the blank display file :  

  <img width="582" height="85" alt="image" src="https://github.com/user-attachments/assets/42a3868c-578f-4e2e-b356-79c3031e9582" />  
  
  And to finish : **sudo reboot**

Pandora-box will now be full screen without title bar !  
HMI limited for more security !!
