#! /bin/sh
LIGHT=/sys/class/backlight/$(ls /sys/class/backlight)
logger "acpi backlight control - backlight: $LIGHT"
case "$1" in
	+)
		echo $(($( < "$LIGHT"/brightness) + 300)) > "$LIGHT"/brightness
		;;
	-)
		echo $(($( < "$LIGHT"/brightness) - 300)) > "$LIGHT"/brightness
		;;
	*)
		logger "Bad script execution $1 - Use + or -"
		;;
esac
