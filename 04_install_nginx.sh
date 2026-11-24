
echo "Installing Nginx..."

sudo dnf install nginx -y

echo "Starting Nginx service..."

sudo systemctl start nginx

sudo systemctl enable nginx

echo "Checking Nginx status..."

sudo systemctl status nginx --no-pager
