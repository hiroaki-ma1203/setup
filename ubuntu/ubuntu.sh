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

sudo apt-get update && sudo apt-get upgrade -y

bash docker.sh
bash pyenv.sh
bash node.sh
bash awscli_samcli.sh
bash jq.sh
