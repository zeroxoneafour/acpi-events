#! /bin/sh
logger "acpi volume control - user: USER"
case "$1" in
	+)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-mute @DEFAULT_SINK@ false
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-volume @DEFAULT_SINK@ +5%
		;;
	-)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-mute @DEFAULT_SINK@ false
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-volume @DEFAULT_SINK@ -5%
		;;
	m)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-mute @DEFAULT_SINK@ toggle
		;;
	*)
		logger "Bad script execution $1 - Use +, -, or m"
		;;
esac
