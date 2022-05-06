#!/bin/bash
repo_folder=$(cat repos-location.txt)

get_node_app() {
    repo=""
    flag=0
    # While repo does not contains a valid git repo
    while [ $flag == 0 ]; do
        echo "Enter the git repo url (e.g. 'https://github.com/User/repo')"
        read repo
        # If repo is not a valid git repo
        git ls-remote "$repo" > /dev/null 2>&1
        if [ "$?" -ne 0 ]; then
            echo "[ERROR] Unable to read from '$repo'"
        else
            flag=1
        fi
    done
    cd ~
    mkdir $repo_folder
    cd ~/$repo_folder
    # Clone the repo
    git clone $repo
    # Create a variable for the directory name
    dir=$(echo $repo | rev | cut -d"/" -f 1 | rev)
    # Change to the directory
    cd ./$dir
    # Install NPM dependencies
    npm install
}

run_node_app() {
    # build the app
    npm run build
    npm i pm2 -g
    IP_ADDRESS=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    echo Your website will soon be available at http://$IP_ADDRESS:3000
    name=$(pwd | rev | cut -d"/" -f 1 | rev)
    pm2 start --name $name npm -- start 
    pm2 log
}

main() {
    get_node_app
    run_node_app
}
main
