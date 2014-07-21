#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

# Install git
sudo apt-get install -y git

# install zip and unzip
sudo apt-get install -y zip unzip

sudo apt-get update 
sudo apt-get -y upgrade

# Install apache

sudo apt-get install -y apache2

# Install php
sudo apt-get install -y libapache2-mod-php5 php5-gd php5-intl php5 php5-dev

sudo service apache2 restart

# Enable rewrite module
sudo a2enmod rewrite
sudo service apache2 restart

# Install mysql
sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql

# Install phpmyadmin
sudo apt-get install -y phpmyadmin

# Setup phpmyadin
sudo sed -i "\$aInclude /etc/phpmyadmin/apache.conf" /etc/apache2/apache2.conf

# Download Drupal v7.
cd /var/www
sudo wget http://ftp.drupal.org/files/projects/drupal-7.26.tar.gz
sudo tar zxvf drupal-7.26.tar.gz
sudo mv drupal-7.26 d7

# Set up file system
sudo mkdir /var/www/d7/sites/default/files
sudo chmod 777 files

# Copy settings.php
sudo cp /var/www/d7/sites/default/default.settings.php /var/www/d7/sites/default/settings.php
sudo chmod a+w /var/www/d7/sites/default/settings.php 

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
sudo tar zxvf ctools-7.x-1.3.tar.gz

sudo wget http://ftp.drupal.org/files/projects/admin_menu-7.x-3.0-rc4.tar.gz
sudo tar zxvf admin_menu-7.x-3.0-rc4.tar.gz

sudo wget http://ftp.drupal.org/files/projects/webform-7.x-3.19.tar.gz
sudo tar zxvf webform-7.x-3.19.tar.gz

sudo wget http://ftp.drupal.org/files/projects/wysiwyg-7.x-2.2.tar.gz
sudo tar zxvf wysiwyg-7.x-2.2.tar.gz

sudo wget http://ftp.drupal.org/files/projects/google_analytics-7.x-1.4.tar.gz
sudo tar zxvf google_analytics-7.x-1.4.tar.gz

sudo wget http://ftp.drupal.org/files/projects/fontyourface-7.x-2.8.tar.gz
sudo tar zxvf fontyourface-7.x-2.8.tar.gz 

sudo wget http://ftp.drupal.org/files/projects/nice_menus-7.x-2.5.tar.gz
sudo tar zxvf nice_menus-7.x-2.5.tar.gz



# Potential candidates to be added into standard package
# XML sitemap, Rules, CAPTCHA

# Download theme framework

cd ../themes

# Download zen framework
sudo wget http://ftp.drupal.org/files/projects/zen-7.x-5.4.tar.gz
sudo tar zxvf zen-7.x-5.4.tar.gz

# Create and update subtheme
sudo cp -r zen/STARTERKIT .
sudo mv STARTERKIT pilgrim
sudo mv pilgrim/STARTERKIT.info.txt pilgrim/pilgrim.info
cd pilgrim
sudo sed -i -e 's/Zen Sub-theme Starter Kit/Pilgrim/' pilgrim.info
sudo sed -i '/description = /c\description = Pilgrim theme' pilgrim.info 
sudo sed -i 's/STARTERKIT/pilgrim/' template.php
sudo sed -i 's/STARTERKIT/pilgrim/' theme-settings.php
sudo echo "Zen sub-theme Pilgrim installed."


# Set up complete
sudo echo "Set up completed!"
## Need specific instructions to create mysql db and set up drupal
sudo echo "You can now create MySQL database and set up Drupal."
## TODO: What is 'd7' content? Where in 'D7'?
## Need specific instructions to enable clean url
sudo echo "Copy content from 'd7' to '/etc/apache2/sites-available/default' to enable clean url."
