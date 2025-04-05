# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - pyenv
# - python 3.13

sudo apt-get update && sudo apt-get upgrade -y

# Install pyenv and python
echo "pyenv and python install start..."
## Install dependencies
sudo apt-get install -y \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  curl \
  git \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev
## Install pyenv
curl -fsSL https://pyenv.run | bash
## Add pyenv to PATH
### Add to ~/.bashrc
echo '' >> ~/.bashrc
echo '# set PATH for pyenv' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
### Add to ~/.profile
echo '' >> ~/.profile
echo '# set PATH for pyenv' >> ~/.profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init - bash)"' >> ~/.profile
## refresh the shell
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
## Update pyenv and install Python 3.13
pyenv update
pyenv install 3.13.2
pyenv global 3.13.2
echo "pyenv and python install end..."
