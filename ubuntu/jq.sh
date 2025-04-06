# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - jq

sudo apt-get update && sudo apt-get upgrade -y

# Install jq
echo "jq install start..."
sleep 5
sudo apt-get install -y jq
echo "jq install end..."
sleep 5
