<h2>Set up graphical kiosk mode for pandora-box</h2>

<p>First start by installing pandora-box : <a href="https://github.com/dbarzin/pandora-box">https://github.com/dbarzin/pandora-box</a></p>

<h3>Kiosk mode configuration</h3>

<p>Enable autologin with <code>sudo nano /etc/gdm3/custom.conf</code> :</p>

<pre><code>[daemon]
AutomaticLoginEnable = True
AutomaticLogin = pandora (or the corresponding user)</code></pre>

<p>And enter the following commands on the terminal :</p>

<ul>
  <li><code>sudo apt install -y git</code></li>
  <li><code>cd /home/pandora</code></li>
  <li><code>git clone https://github.com/theodel26/pandorabox-usb_scripts_kiosk</code></li>
  <li><code>cd /home/pandora/pandorabox-usb_scripts_kiosk</code></li>
  <li><code>git pull</code></li>
  <li><code>sudo ./deploy-kiosk.sh</code> (before entering the command, ensure that the correct user is configured in the script with <code>sudo nano deploy-kiosk.sh</code>)</li>
</ul>

<p>The startup script <code>start-pandora.sh</code> includes a fallback mechanism in case the Pandora service crashes on startup, displaying the <code>maintenance.png</code> image to keep kiosk mode active.<br>
Only four actions are required for this to work :</p>

<ul>
  <li><code>sudo apt install feh -y</code> (installs the display software)</li>
  <li><code>sudo cp /home/pandora/pandorabox-usb_scripts_kiosk/french_images/maintenance-fr.png /home/pandora/pandora-box/images/maintenance.png</code> (copies the image to the correct directory)</li>
  <li><code>sudo chown pandora:pandora /home/pandora/pandora-box/images/maintenance.png</code> (sets the correct permissions)</li>
  <li><code>sudo visudo -f /etc/sudoers.d/display</code></li>
</ul>

<p>And insert these two lines into the blank display file :</p>

<img width="582" height="85" alt="image" src="https://github.com/user-attachments/assets/42a3868c-578f-4e2e-b356-79c3031e9582" />

<h3>🌍 Language Management</h3>

<p>The kiosk interface is configured with French images by default. You can easily switch the interface language using the provided automated scripts.</p>

<p>Navigate to the repository folder:</p>
<pre><code>cd /home/pandora/pandorabox-usb_scripts_kiosk</code></pre>

<p>Run the desired script:</p>
<ul>
  <li><code>bash switch-to-english.sh</code> (Switches the interface to English)</li>
  <li><code>bash switch-to-french.sh</code> (Restores the interface to French)</li>
</ul>
<p><em>(Note: If your system user is not "pandora", remember to edit the PANDORA_USER variable inside the scripts before running them).</em></p>

<h3>🔄 Automated Maintenance</h3>
<p>A daily safe reboot is automatically scheduled during the deployment phase using the <code>safe_reboot.sh</code> script. This ensures the kiosk remains stable without interfering with ongoing user scans.</p>

<br>
<p>And to finish : <strong>sudo reboot</strong></p>

<p>Pandora-box will now be full screen without title bar !<br>
HMI limited for more security !!</p>
