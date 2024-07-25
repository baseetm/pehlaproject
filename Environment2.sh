###########################
######Environment Install#######
sudo apt update
sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt install php libapache2-mod-php php-mysql
sudo nano /var/www/html/index.php
