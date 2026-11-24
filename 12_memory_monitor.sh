
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')

echo "Current Memory Usage: $MEMORY_USAGE%"

if [ "$MEMORY_USAGE" -gt 80 ]
then
    echo "Memory usage is above 80%" | mail -s "Memory Usage Alert" YOUR_EMAIL
    echo "Email notification triggered"
else
    echo "Memory usage is normal"
fi
