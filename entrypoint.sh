#!/bin/bash

# Start services
service dbus start
service bluetooth start

# Wait for services to start
msg="Waiting for services to start..."
time=0
echo -n $msg
while [[ "$(pidof start-stop-daemon)" != "" ]]; do
    sleep 1
    time=$((time + 1))
    echo -en "\r$msg $time s"
done
echo -e "\r$msg done! (in $time s)"

# Reset Bluetooth adapter by restarting it
hciconfig hci0 down
hciconfig hci0 up

# Start application
python3 /app/gatt_server_example.py
