#! /bin/bash
# Installs the files. Run as root! unless your system is mighty misconfigured

mkdir /etc/acpi/events
cp -t /etc/acpi/events vol-u vol-d vol-m volume.sh
systemctl restart acpid.service
