#!/bin/bash

repo=$(cat repos-location.txt)

list_webapps() {
    ls ~/$repo/
    echo "ls ~/"$repo"/"
    echo "Enter the name of the webapp you want to remove"
    read webapp
    # Check if webapp exists
    if [ -d ~/$repo/$webapp ]; then
        echo "Removing $webapp"
        pm2 delete $webapp
        rm -rf ~/$repo/$webapp
    else
        echo "Webapp $webapp does not exist"
    fi
}
list_webapps
