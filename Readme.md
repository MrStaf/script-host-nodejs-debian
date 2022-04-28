# Script Host Nodejs Debian
Is a bash script that install all the needed to save you time in hosting in productionn Nodejs web application

## Requirements
 - Debian
 - A repositery with nodejs app, where "npm run build" will build your website, and "npm run start" will start it
 - a domain name

## Installation

Clone the repo :
```bash
apt install git
git clone https://github.com/MrStaf/script-host-nodejs-debian
```

Then get into it, and run the installation
```bash
cd script-host-nodejs-debian
bash run.bash
```

## Components
### NodeJS

The script will install [NodeJs]("https://nodejs.org/en/") ver 16.0 LTS

### Nginx proxy manager

[Nginx proxy manager]("https://nginxproxymanager.com/") will help you to establish SSL to your NodeJs application without issues.
You will need to edit it manually, but it's on a nice web page, located in `your-ip/domain:81`.
You can have multiple web applications, with it's proxy.

## Usage

### Add an other app

Just get in the script-host-nodejs-debian directory
```bash
cd script-host-nodejs-debian
```

And run
```bash
bash add.bash
```

### Remove an app

Just get in the script-host-nodejs-debian directory
```bash
cd script-host-nodejs-debian
```

And run
```bash
bash remove.bash
```

### Kill all the app
Just get in the script-host-nodejs-debian directory
```bash
cd script-host-nodejs-debian
```

And run
```bash
bash kill_all.bash
```

### Restart all the app
Just get in the script-host-nodejs-debian directory
```bash
cd script-host-nodejs-debian
```

And run
```bash
bash restart_all.bash
```