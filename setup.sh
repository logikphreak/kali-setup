cat /etc/os-release
cat/proc/version
uname -a
lsb_release -a
 
# Update packages
echo Updating packages
apt-get update && apt-get dist-upgrade
 
# Setup directory layout
echo Setting up directory layout..
cd ~
mkdir pentest
cd pentest
mkdir assessments
 
# Setup vFeed + helper scripts (https://github.com/toolswatch/vFeed, https://gist.github.com/alias1/7554985)
echo Setting up VFeed and helper scripts..
cd ~/pentest
git clone https://github.com/toolswatch/vFeed.git vfeed
cd vfeed
git clone https://gist.github.com/7554985.git bin
cd bin
chmod +x vfeed*.sh
ln -s ~/pentest/vfeed/bin/vfeed.sh /usr/local/bin/vfeed
ln -s ~/pentest/vfeed/bin/vfeedcli.sh /usr/local/bin/vfeedcli
ln -s ~/pentest/vfeed/bin/vfeed_update.sh /usr/local/bin/vfeed_update
 
# Setup nmap.sh (https://gist.github.com/alias1/5963377)
# TODO Link this into /usr/bin or similar? Give it a better name?
echo Setting up nmap-sh..
cd ~/pentest
git clone https://gist.github.com/5963377.git nmap.sh
 
# Setup SecLists
echo Setting up SecLists..
cd ~/pentest
git clone https://github.com/danielmiessler/SecLists.git seclists
 
# Setup Exploit-DB
echo Setting up ExploitDB..
cd ~/pentest
git clone https://github.com/offensive-security/exploit-database.git exploitdb
 
# Setup PwnWiki
echo Setting up PwnWiki..
cd ~/pentest
git clone https://github.com/pwnwiki/pwnwiki.github.io.git pwnwiki
#git clone https://github.com/pwnwiki/pwnwiki-tools.git pwnwiki-tools
 
# Setup KaliWiki
echo Setting up KaliWiki..
cd ~/pentest
git clone https://github.com/pwnwiki/kaliwiki.git kaliwiki
 
# Setup WebAppDefaultsDb
echo Setting up WebAppDefaultsDb..
cd ~/pentest
git clone https://github.com/pwnwiki/webappdefaultsdb webappdefaultsdb
 
# Setup Mubix's tools/etc
echo Setting Up Mubixs stuff..
cd ~/pentest
git clone https://github.com/mubix/post-exploitation-wiki.git mubix-post-exploitation-wiki
git clone https://github.com/mubix/post-exploitation mubix-post-exploitation
#git clone https://github.com/mubix/tools.git mubix-tools
 
# Setup Mainframed
echo Setting up Mainframed..
cd ~/pentest
git clone https://github.com/mainframed/Mainframed.git mainframed
 
# Setup DNSFootprint (http://dnsfootprint.com/)
# TODO: Track this in a git repository if possible (does licence allow it?)
echo Setting up DNSFootprint..
cd ~/pentest
mkdir dnsfootprint
cd dnsfootprint
wget http://dnsfootprint.com/DNSFootprint.zip
unzip DNSFootprint.zip
rm DNSFootprint.zip
 
# Setup Powersploit
echo Setting up Powersploit..
cd ~/pentest
git clone https://github.com/mattifestation/PowerSploit.git powersploit
 
# Setup Dumpmon-mon
echo Setting up Dumpmon-mon
cd ~/pentest
git clone https://github.com/alias1/dumpmonmon.git dumpmonmon
cd dumpmonmon
bundle
#leafpad dumpmonmon.yml &
 
# Setup apt related tools
echo Setting up tools through apt
apt-get update
apt-get install kali-linux-complete mono-complete
 
echo Finished setting things up.
