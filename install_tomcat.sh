#!/bin/bash

# Update package lists
sudo apt update

# Install the default JDK
sudo apt install -y default-jdk

# Check the Java version
java -version

# Create a tomcat user
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat

# Download Apache Tomcat
wget -c https://downloads.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz

# Extract Tomcat to the appropriate directory
sudo tar xf apache-tomcat-9.0.91.tar.gz -C /opt/tomcat

# Create a symbolic link to the Tomcat directory
sudo ln -s /opt/tomcat/apache-tomcat-9.0.91 /opt/tomcat/updated

# Change ownership of the Tomcat directory
sudo chown -R tomcat: /opt/tomcat/*

# Make the Tomcat scripts executable
sudo sh -c 'chmod +x /opt/tomcat/updated/bin/*.sh'

# Create the Tomcat service file
sudo bash -c 'cat <<EOL > /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Restart=always
RestartSec=10
Environment="JAVA_HOME=/usr/lib/jvm/default-java"
Environment="CATALINA_PID=/opt/tomcat/updated/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat/updated"
Environment="CATALINA_BASE=/opt/tomcat/updated"
ExecStart=/opt/tomcat/updated/bin/startup.sh
ExecStop=/opt/tomcat/updated/bin/shutdown.sh
LimitNOFILE=4096
LimitNPROC=4096
TimeoutStartSec=30

[Install]
WantedBy=multi-user.target
EOL'

# Reload systemd to recognize the new Tomcat service
sudo systemctl daemon-reload

# Start the Tomcat service
sudo systemctl start tomcat

# Check the status of the Tomcat service
systemctl status tomcat.service

# Install net-tools package
sudo apt install -y net-tools

# Display network interfaces
ifconfig
