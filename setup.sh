#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

# install git
sudo apt-get install -y git
sudo apt-get install -y curl

sudo apt-get update 
sudo apt-get -y upgrade

# install apache

sudo apt-get install -y apache2

sudo service apache2 restart



# install php
sudo apt-get install -y libapache2-mod-php5

# sudo a2enmod php5


# install mysql
sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql

# Download Drupal v7.
cd /var/www
sudo wget http://ftp.drupal.org/files/projects/drupal-7.24.tar.gz
sudo tar zxvf drupal-7.24.tar.gz
sudo mv drupal-7.24 d7

# Install modules
cd d7/sites/all/modules

# Download ctools, token, pathauto, views, i18n, admin menu, webform
sudo wget http://ftp.drupal.org/files/projects/views-7.x-3.7.tar.gz
sudo tar zxvf views-7.x-3.7.tar.gz

sudo wget http://ftp.drupal.org/files/projects/pathauto-7.x-1.2.tar.gz
sudo tar zxvf pathauto-7.x-1.2.tar.gz
 
sudo wget http://ftp.drupal.org/files/projects/token-7.x-1.5.tar.gz
sudo tar zxvf token-7.x-1.5.tar.gz

sudo wget http://ftp.drupal.org/files/projects/panels-7.x-3.3.tar.gz
sudo tar zxvf panels-7.x-3.3.tar.gz

sudo wget http://ftp.drupal.org/files/projects/i18n-7.x-1.10.tar.gz
sudo tar zxvf i18n-7.x-1.10.tar.gz

sudo wget http://ftp.drupal.org/files/projects/ctools-7.x-1.3.tar.gz
sudo tar ctools-7.x-1.3.tar.gz

sudo wget http://ftp.drupal.org/files/projects/admin_menu-7.x-3.0-rc4.tar.gz
sudo tar zxvf admin_menu-7.x-3.0-rc4.tar.gz

sudo wget http://ftp.drupal.org/files/projects/webform-7.x-3.19.tar.gz
sudo tar zxvf webform-7.x-3.19.tar.gz

sudo wget http://ftp.drupal.org/files/projects/wysiwyg-7.x-2.2.tar.gz
sudo tar wysiwyg-7.x-2.2.tar.gz

sudo wget http://ftp.drupal.org/files/projects/google_analytics-7.x-1.4.tar.gz
sudo tar zxvf google_analytics-7.x-1.4.tar.gz

# Potential candidates to be added into standard package
# XML sitemap, Rules, CAPTCHA

# Download theme framework

cd ../themes

# Download zen framework
sudo wget http://ftp.drupal.org/files/projects/zen-7.x-5.4.tar.gz
sudo tar zen-7.x-5.4.tar.gz

# Create subtheme
sudo cp -r zen/STARTERKIT .
sudo mv STARTERKIT pilgrim
sudo mv pilgrim/STARTKIT.info.txt pilgrim/pilgrim.info
sudo sed -i  's/Zen Sub-theme Starter Kit/Pilgrim' pilgrim.info
