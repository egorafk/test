#!/bin/bash


LOG="/var/log/monitoring.log"
PID_FILE="/tmp/test.pid"

PID=$(pgrep -x "test")

if [ "PID" ]; then
	if [ -f "PID_FILE" ]; then
		OLD=$(cat "$PID_FILE")
		if [ "$OLD" != "$PID" ]; then
			echo "Service was restarted" >> "$LOG"
		fi
	fi
	echo "$PID" > "$PID_FILE"

	curl -s -f -L -o /dev/null --connect-timeout 10 "https://test.com/monitoring/test/api"
	if [ $? -ne 0 ]; then
		echo "Monitoring server unavalaible" >> "$LOG"
	fi
else
	rm -f "$PID_FILE"
fi
