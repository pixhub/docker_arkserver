#!/bin/bash

START_SERVER="/home/ark/ark-server/ShooterGame/Binaries/Linux/ShooterGameServer"
PARAMS="TheIsland?listen?MultiHome=$IP?MaxPlayers=$MAX_PLAYERS?QueryPort=$QPORT?RCONPort=$RCPORT?Port=$PORT"

echo "session required pam_limits.so" >> /etc/pam.d/common-session

$START_SERVER $PARAMS
