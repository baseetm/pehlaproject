###############python environment create##############
pip install python3
python3 -m venv myworkspace2
source myworkspace2 /bin/activate
source myworkspace2/bin/activate
###############################################
cd myworkspace2
apt install python3-pip
pip install Flask mysql-connector-python
sudo apt update
sudo apt install mysql-server -y
sudo mysql_secure_installation
apt install net-tools
sudo ufw allow 3306/tcp
#########chmod +x mysql1.sh
#################./mysql1.sh


##python
##mysql
##flask
##shell
