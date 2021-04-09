#! /bin/sh
logger "input: $2"
logger "user: USER"
case "$2" in
	VOLUP)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-mute @DEFAULT_SINK@ false
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-volume @DEFAULT_SINK@ +5%
		;;
	VOLDN)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-mute @DEFAULT_SINK@ false
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-volume @DEFAULT_SINK@ -5%
		;;
	MUTE)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID pactl set-sink-mute @DEFAULT_SINK@ toggle
		;;
	*)
		sudo -u USER XDG_RUNTIME_DIR=/run/user/USERID logger "ACPI not volume related: $2"
		;;
esac
