
Redash - Opensource Database visualization tool

Installation
--------------

https://computingforgeeks.com/how-to-install-redash-data-visualization-dashboard-on-ubuntu-18-04-lts/

Automated install script
------------------------
  wget https://raw.githubusercontent.com/getredash/redash/master/setup/setup.sh

Make the script executable and run it

  chmod +x setup.sh
  ./setup.sh


The script will:

1)Install both Docker and Docker Compose.
2)Download  Docker Compose configuration files and bootstrap Redash environment
3)Start all Redash docker containers


Access Redash Dashboard
--------------------------
Once Redash is installed, the service will be available on your server IP or DNS name assigned.
Point your browser to the server address to access it.
