#!/bin/bash
while :; do
	title=$(playerctl metadata title 2>/dev/null)
	status=$(playerctl status 2>/dev/null)

	if [ "$status" = "Paused" ] || [ "$status" = "" ]; then
		if [ "$title" = "" ]; then
			output="  (ᴗ_ᴗ)"
		else
			output=" $title"
		fi
	else
		output=" $title"
	fi

	jq -nc --arg text "$output" --arg tooltip "$(playerctl metadata --format '{{artist}} - {{album}} - {{title}}')" '{"text":$text,"tooltip":$tooltip}'

done
