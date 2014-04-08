echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee -a /etc/apt/sources.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install curl libpq-dev postgresql-9.3 -y
\curl -sSL https://get.rvm.io | bash -s stable
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.0
rvm use 2.0
bundle
sudo su vagrant -c "createuser vagrant -s -d -R -w"
