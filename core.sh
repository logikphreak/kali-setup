# Kali Setup Script V1.0
# Created by Jared Haviland - Sr. Researcher / Critical Assets
# Updated and maintained by Patrick Kelley - Sr. Researcher / Hyperion Avenue Labs

# This script installs a pre-determined set of tools and add-ons 
# to increase the functionality of a Kali Linux Installation. It is 
# meant to be run on virtual machines with fresh installs.

# Update System
apt-get update && apt-get upgrade

# Installs open vm tools 
apt-get install open-vm-tools

# Setup database for Metasploit 
service postgresql start
service metasploit start

# Install Discover scripts to /opt/discover
cd /opt/
git clone https://github.com/leebaird/discover.git
cd discover/
./setup.sh

# Install Smbexec to /opt/smbexec
cd /opt/
git clone https://github.com/pentestgeek/smbexec.git
cd smbexec
./install.sh
# need to figure out way to incorporate the following automatically
# choose 1
# install to /opt/ (default, just hit enter)
./install.sh
# choose 4
# hit any key
# choose 5

# Install Veil to /opt/Veil
cd /opt/
git clone https://github.com/veil-evasion/Veil.git
cd /Veil/setup
./setup.sh

# Download WCE to ~/Desktop/wce
cd ~/Desktop
wget http://www.ampliasecurity.com/research/wce_v1_41beta_universal.zip
unzip -d ./wce wce_v1_41beta_universal.zip
rm wce_v1_41beta_universal.zip

# Download Mimikatz to ~/Desktop/mimikatz
cd ~/Desktop
wget http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip
unzip -d ./mimikatz mimikatz_trunk.zip
rm mimikatz_trunk.zip

# Download password lists
d ~/Desktop
mkdir password-list && cd password-list
wget http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
wget http://downloads.skullsecurity.org/passwords/facebook-pastebay.txt.bz2
bzip2 -d rockyou.txt.bz2 facebook-pastebay.txt.bz2
wget https://www.dropbox.com/s/ucreldsa3qt1rms/crackstation-human-only.txt.gz?dl=0
mv crackstation-human-only.txt.gz\?dl\=0 crackstation-human-only.txt.gz
gunzip -d crackstation-human-only.txt.gz 

# Install peepeingtom to /opt/peepingtom
cd /opt/
git clone https://bitbucket.org/LaNMaSteR53/peepingtom.git
cd peepingtom/
wget https://gist.github.com/nopslider/5984316/raw/423b02c53d225fe8dfb4e2df9a20bc800cc78e2c/gnmap.pl
wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-i686.tar.bz2
tar xvjf phantomjs-1.9.2-linux-i686.tar.bz2
rm phantomjs-1.9.2-linux-i686.tar.bz2 
cp phantomjs-1.9.2-linux-i686/bin/phantomjs .

# Add banner-plus.nse script to nmap scripts
cd /usr/share/nmap/scripts
wget https://raw.github.com/hdm/scan-tools/master/nse/banner-plus.nse

# Install PowerSploit to /opt/PowerSploit
cd /opt
git clone https://github.com/mattifestation/PowerSploit.git
cd PowerSploit
wget https://raw.github.com/obscuresec/random/master/StartListener.py
wget https://raw.github.com/darkoperator/powershell_scripts/master/ps_encoder.py

# Install Responder to /opt/Responder
cd /opt
git clone https://github.com/SpiderLabs/Responder.git

# Install bypassuac to cd /opt/bypassuac, then add it to Metasploit
cd /opt
wget http://trustedsec.com/files/bypassuac.zip
unzip bypassuac.zip
rm bypassuac.zip
cp bypassuac/bypassuac.rb /opt/metasploit/apps/pro/msf3/scripts/meterpreter
mv bypassuac/uac /opt/metasploit/apps/pro/msf3/data/exploits

# Install uzzing scripts for BeEF to /opt/SecLists
cd /opt
git clone https://github.com/danielmiessler/SecLists.git

# Install Gitrob 
cd /opt
git clone https://github.com/logikphreak/gitrob.git
cd gitrob
