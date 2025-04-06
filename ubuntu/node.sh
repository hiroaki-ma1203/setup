# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - n
# - node.js(lts)

sudo apt-get update && sudo apt-get upgrade -y

# Install n and Node.js
echo "Node.js install start..."
sleep 5
sudo apt-get install -y nodejs npm
sudo npm install n -g
sudo n install lts
sudo apt purge -y nodejs npm
echo "Node.js install end..."
sleep 5
