#!/usr/bin/env bash
# a Bash script that sets up your web servers
sudo apt-get update
sudo apt-get install nginx -y

sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
sudo touch /data/web_static/releases/test/index.html
sudo sh -c 'echo "<!DOCTYPE html>
<html>
  <head>
      <title>Your Page Title</title>
  </head>
  <body>
      <h1>Welcome to Your Website</h1>
  </body>
</html>
" > /data/web_static/releases/test/index.html'
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo cp /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/default.bak
sudo sed -i '39 i\ \tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-enabled/default
sudo service nginx restart
