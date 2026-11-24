echo "Checking Nginx service..."

if sudo systemctl is-active --quiet nginx
then
    echo "Nginx is already running"
else
    echo "Nginx is not running. Starting Nginx..."

    sudo systemctl start nginx

    if sudo systemctl is-active --quiet nginx
    then
        echo "Nginx started successfully"
    else
        echo "Failed to start Nginx"
    fi
fi
