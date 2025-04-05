# ubuntu setup script
# This script is intended to be run on a fresh Ubuntu installation
# It will install the following:
# - pyenv
# - python 3.13

sudo apt-get update && sudo apt-get upgrade -y

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
