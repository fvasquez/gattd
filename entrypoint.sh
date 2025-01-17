#!/bin/bash

# Start services
service dbus start
service bluetooth start

# Reset Bluetooth adapter by restarting it
hciconfig hci0 down
hciconfig hci0 up

# Start application
python3 /app/gatt_server_example.py
