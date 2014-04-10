# sudo apt-get update -y
# sudo apt-get install curl -y
# sudo \curl -sSL https://get.rvm.io | bash -s stable
# sudo PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.0
rvm use 2.0
cd /vagrant && sudo bundle
