CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}

echo "Current CPU Usage: $CPU_USAGE%"

if [ "$CPU_USAGE" -gt 80 ]
then
    echo "CPU usage is above 80%" | mail -s "CPU Usage Alert" YOUR_EMAIL
    echo "Email notification sent"
else
    echo "CPU usage is normal"
fi
