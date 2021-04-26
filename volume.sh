#! /bin/sh
logger "acpi volume control - Using system alsa"
case "$1" in
	+)
		amixer set Master 5+
		;;
	-)
		amixer set Master 5-
		;;
	m)
		amixer set Master toggle
		;;
	*)
		logger "Bad script execution $1 - Use +, -, or m"
		;;
esac
