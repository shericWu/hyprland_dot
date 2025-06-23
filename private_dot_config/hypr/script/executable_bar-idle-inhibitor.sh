#!/usr/bin/env bash

trap 'kill "$SLEEP_PID"; exit 0' SIGTERM
systemd-inhibit --why Bar_inhibit_idle sleep infinity &
SLEEP_PID=$!
wait "$SLEEP_PID"
