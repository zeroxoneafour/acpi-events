#! /bin/bash
# Installs the files. Run as root! unless your system is mighty misconfigured

mkdir -p /etc/acpi/events
mkdir -p /etc/acpi/handlers
cp -t /etc/acpi/events vol-u vol-d vol-m bl-u bl-d
cp -t /etc/acpi/handlers volume.sh backlight.sh
systemctl restart acpid.service
