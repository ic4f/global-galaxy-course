#!/bin/bash
# We have a directory of messages with timestamps.
# If they have not been sent and time > their time, we send them.
# Once sent, we document this in a logfile.
NOW=$(date +%s)
LOGFILE=~/.config/slack-bot

for fn in scheduled/*.json; do
	ds=$(echo "$fn" | sed 's|scheduled/||g' | cut -c1-25)
	ts=$(date -d "$ds" +%s)
	if (( ts < NOW )); then
		# This message is ready to send
		grep -F -q "$fn" "$LOGFILE";
		ec=$?
		if (( ec != 0 )); then
			echo Sending!
			curl -X POST -H 'Content-type: application/json' --data "@$fn" "${SLACK_URL}"
			echo "$fn" >> "$LOGFILE";
		else
			# already sent
			true
		fi
	else
		# We're not sending this yet
		true
	fi
done
