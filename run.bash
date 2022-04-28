
update_system() {
    apt update
    apt upgrade -y
}

install_NPM () {
    apt install curl git -y
    curl -sL https://deb.nodesource.com/setup_16.x | bash -
    apt install nodejs -y
}

install_Docker() {
    sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
    # Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

install_Docker_Compose() {
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
}

run_Docker_Compose() {
    docker-compose up -d
}

get_node_app() {
    repo=""
    while [$repo !=~ "/"]; do
        # Prompt for the name of the github repo
        echo "Enter the name of the github repo you want to clone (e.g. 'MyUsername/my-node-app'):"
        read repo
    done
    # Clone the repo
    git clone https://github.com/$repo
    # Create a variable for the directory name
    dir=$(echo $repo | cut -d'/' -f2)
    # Change to the directory
    cd $dir
    # Install NPM dependencies
    npm install
}

run_node_app() {
    # build the app
    npm run build
    # serve the app
    npm run serve
}

main() {
    update_system
    install_NPM
    # install_Docker
    # install_Docker_Compose
    # run_Docker_Compose
    # get_node_app
    # run_node_app
}

main