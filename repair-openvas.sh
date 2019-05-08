#!/bin/bash

# Reset OpenVAS Vulnerability Scanner Script V1.0
# By: Jared Haviland

# This script will remove and reinstall OpenVAS
# It is designed for Kali Linux but should work on any Linux system using apt-get

# Remove OpenVAS from the system
apt-get autoremove openvas 

# Update and install OpenVAS.
apt-get update && apt-get install -y openvas

# Setup, sync and check OpenVAS installation.
openvas-setup && openvas-scapdata-sync && openvas-certdata-sync && openvas-check-setup && openvas-stop 

#Configure admin account for OpenVAS with default login of admin/admin
#Replace username and password as desired.
openvasmd --create-user=admin --role=Admin
openvasmd --user=admin --new-password=admin

#Start OpenVAS services and display portal address.
openvas-start
echo "Log into OpenVAS via your web broswer by going to https://127.0.0.1:9392"
