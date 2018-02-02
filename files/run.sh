#!/bin/bash

STEAMCMD="/home/ark/steamcmd/steamcmd.sh"
START_SERVER="/home/ark/ark-server/ShooterGame/Binaries/Linux/ShooterGameServer"
PARAMS="TheIsland?listen?MultiHome=$IP?MaxPlayers=$MAX_PLAYERS?QueryPort=$QPORT?RCONPort=$RCPORT?Port=$PORT"

fn_checkupdates () {
                   echo "==> Checking for updates"
                   $STEAMCMD +login anonymous \
                             +force_install_dir /home/ark/ark-server \
                             +app_update 376030 \
                             +quit
                   if [ $? = 0 ]
                      then
                          echo "==> The Server is Up to Date"
                      else
                          echo "==> An error occured, please resart the service"
                          exit 1
                   fi
}

fn_startserver () {
                  echo "==> Starting Ark Server"
                  $START_SERVER $PARAMS
                  if [ $? = 0 ]
                      then
                          echo "==> Server Started Succefully"
                      else
                          echo "==> Fail Starting Server"
                          exit 1
fi
}

fn_checkupdates
fn_startserver
