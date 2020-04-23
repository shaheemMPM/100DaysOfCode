#!/bin/bash

cd ../media-sync
if [ $# -eq 2 ]
then
    if [ "$1" = "-l" ]
    then
        node app.js l $2
    elif [ "$1" = "-c" ]
    then
        node app.js c $2
    fi
else
    node app.js f $1
fi