#!/bin/bash

# @author: ajfernandez
# @last_edit: 07/06/19
# @ssh automation connection script for emergency interventions (ssh server must use key authentication instead password)

host=
port=
user=

# if $myVar; then ... ;fi construct has a security problem, avoid with "case in\n (expre) things to dos \n...esac"

check_connection(){
    state=`ss -tpn | awk '{print $5}' | grep $host:$port`
    if [ $? -eq 0 ]; then
            echo "Connection established `date`"
    elif [ $? -ne 0 ]; then
            echo "Connection lost at `date`"
            echo "Reconnecting..."
            ssh -p $port $user@$host
    fi
}       

while true; do
    check_connection;
    sleep 5;
    done