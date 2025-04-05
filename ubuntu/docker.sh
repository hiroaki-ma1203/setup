# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - docker

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
newgrp docker
## Test Docker installation
docker run --rm hello-world
docker rmi hello-world
echo "Docker install end..."