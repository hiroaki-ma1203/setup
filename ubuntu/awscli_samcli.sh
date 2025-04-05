# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - aws-cli
# - aws-sam-cli

sudo apt-get update && sudo apt-get upgrade -y

# Install AWS CLI
echo "AWS CLI install start..."
sudo apt-get install -y unzip
# Download the AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# Verify the installation
aws --version
# Clean up
rm -rf awscliv2.zip
sudo rm -rf ./aws
echo "AWS CLI install end..."

# Install AWS SAM CLI
echo "AWS SAM CLI install start..."
## Install the AWS SAM CLI using the bundled installer
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install
## Verify the installation
sam --version
## Clean up
rm -rf aws-sam-cli-linux-x86_64.zip
sudo rm -rf ./sam-installation
echo "AWS SAM CLI install end..."
