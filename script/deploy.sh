#!/bin/sh

ssh ubuntu@52.66.239.5 <<EOF
    cd ~/node-app
    git pull origin main
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    . ~/.nvm/nvm.sh
    nvm install v14.18.1
    npm install
    npm install -g nodemon pm2
    pm2 restart ecosystem.config.js
    exit
EOF