set -e

echo "Updating package information..."
sudo dnf makecache

echo "Installing Java..."
sudo dnf install java-21-amazon-corretto -y

echo "Checking Java version..."
java -version

echo "Downloading Apache Tomcat..."
cd /opt

sudo wget -O apache-tomcat-10.1.49.tar.gz \
https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.49/bin/apache-tomcat-10.1.49.tar.gz

echo "Extracting Tomcat..."
sudo tar -xzf apache-tomcat-10.1.49.tar.gz -C /opt

echo "Creating Tomcat directory..."
sudo mv /opt/apache-tomcat-10.1.49 /opt/tomcat

echo "Creating Tomcat user..."
sudo useradd --system --no-create-home --shell /sbin/nologin tomcat

echo "Setting directory permissions..."
sudo chown -R tomcat:tomcat /opt/tomcat

sudo chmod +x /opt/tomcat/bin/*.sh

echo "Creating Tomcat service..."

JAVA_HOME=$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")

sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat Server
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment="JAVA_HOME=$JAVA_HOME"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling Tomcat..."
sudo systemctl enable tomcat

echo "Starting Tomcat..."
sudo systemctl start tomcat

echo "Tomcat installation completed!"
