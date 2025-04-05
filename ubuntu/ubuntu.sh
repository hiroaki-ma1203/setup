# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - docker
# - pyenv
# - python 3.13
# - n
# - node.js(lts)
# - aws-cli
# - aws-sam-cli
# - jq

export NEEDRESTART_MODE=a
sudo apt-get update && sudo apt-get upgrade -y

# Install Docker
echo "Docker install start..."
## Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
## Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
## Install Docker:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
## Add your user to the docker group
sudo usermod -aG docker $USER
# newgrp docker
# ## Test Docker installation
# docker run --rm hello-world
# docker rmi hello-world
echo "Docker install end..."

# Install pyenv
echo "pyenv and python install start..."
curl -fsSL https://pyenv.run | bash
# Add pyenv to PATH
## Add to ~/.bashrc
echo '' >> ~/.bashrc
echo '# set PATH for pyenv' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
## Add to ~/.profile
echo '' >> ~/.profile
echo '# set PATH for pyenv' >> ~/.profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init - bash)"' >> ~/.profile
# refresh the shell
source ~/.bashrc
pyenv update
# Install Python 3.13
pyenv install 3.13.0
pyenv global 3.13.0
echo "pyenv and python install end..."

# Install n and Node.js
echo "Node.js install start..."
sudo apt-get install -y nodejs npm
npm install n -g
n install lts
sudo apt purge -y nodejs npm
echo "Node.js install end..."

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

# Install jq
echo "jq install start..."
sudo apt-get install -y jq
echo "jq install end..."
