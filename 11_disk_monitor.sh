DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Current Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt 80 ]
then
    echo "Disk usage is above 80%" | mail -s "Disk Space Alert" YOUR_EMAIL
    echo "Email notification triggered"
else
    echo "Disk usage is normal"
fi
