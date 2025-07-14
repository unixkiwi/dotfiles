#!/bin/bash
while :; do
	title=$(playerctl metadata title 2>/dev/null)
	status=$(playerctl status 2>/dev/null)

	if [ "$status" = "Paused" ]; then
		output=" $title"
	else
		output=" $title"
	fi

	jq -nc --arg text "$output" --arg tooltip "$(playerctl metadata --format '{{artist}} - {{album}} - {{title}}')" '{"text":$text,"tooltip":$tooltip}'

done
