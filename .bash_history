sudo apt-get install mysql-server
sudo apt install gnupg
cd /tmp
wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
ls
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb 
sudo apt update
sudo apt install mysql-server
sudo apt install -y curl gnupg2 dirmngr git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
sudo apt update sudo apt-get install -y nodejs
sudo apt update | sudo apt-get install -y nodejs
sudo apt-get install -y nodejs
node -v
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get update
sudo apt install -y nodejs
node -v
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
