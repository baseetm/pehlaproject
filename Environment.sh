###############python environment create##############
python3 -m venv myworkspace
source myworkspace /bin/activate
source myworkspace/bin/activate
###############################################
cd myworkspace
sudo nano mysql.sh
apt install python3-pip
pip install Flask mysql-connector-python
python3 app.py
sudo systemctl status mysql
sudo mysql -u root -p
sudo apt update
sudo apt install mysql-server -y
sudo mysql_secure_installation
sudo mysql -u root -p
CREATE DATABASE webapp_db;
CREATE USER 'webapp_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON webapp_db.* TO 'webapp_user'@'%';
FLUSH PRIVILEGES;
EXIT;
apt install net-tools
sudo ufw allow 3306/tcp
#########chmod +x mysql1.sh
#################./mysql1.sh
