
cd `dirname "$0"`

setup_path=`pwd`

# # Install Dependencies
# sudo apt-get install python-software-properties
# sudo add-apt-repository ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get -y install nodejs npm
# sudo apt-get -y install git monit

# # Set up user
# sudo useradd markshow
# sudo mkdir /home/markshow
# sudo mkdir /home/markshow/log
# sudo chown -r markshow:markshow /home/markshow

# # Clone repo
# rm -rf ~/markshow
# git clone git@github.com:ericvicenti/markshow.git ~/markshow

# # Install configs
sudo service monit stop
sudo service markshow stop

sudo cp -f $setup_path/upstart.conf /etc/init/markshow.conf
sudo chown root:root /etc/init/markshow.conf

sudo cp -f $setup_path/monitrc /etc/monit/monitrc
sudo chown root:root /etc/monit/monitrc

sudo cp -f $setup_path/nginx/vhost.conf /etc/nginx/sites-available/markshow.org.conf
sudo chown root:root /etc/nginx/sites-available/markshow.org.conf

sudo ln -s /etc/nginx/sites-available/markshow.org.conf /etc/nginx/sites-enabled/markshow.org.conf

sudo service ngnix restart
sudo service monit start
sudo service markshow start