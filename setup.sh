cd `dirname "$0"`
setup_path=`pwd`

# Install Dependencies
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs npm
sudo apt-get -y install git monit nginx

# Set up user
sudo useradd markshow
sudo mkdir /home/markshow
sudo mkdir /home/markshow/log
sudo chown -r markshow:markshow /home/markshow

# Clone repo
rm -rf ~/markshow
git clone git@github.com:ericvicenti/markshow.git ~/markshow