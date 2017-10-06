#!/bin/bash

# setup network manager connections for connecting with Dividat Senso

NM_CONNECTIONS=`nmcli --fields NAME --terse --color no connection`

if [[ ! $NM_CONNECTIONS == *"Internet"* ]]
then
  nmcli c add type ethernet con-name "Internet" ifname "*"
fi

if [[ ! $NM_CONNECTIONS == *"Dividat Senso"* ]]
then
  nmcli c add type ethernet con-name "Dividat Senso" ipv4.method link-local ifname "*"
fi
