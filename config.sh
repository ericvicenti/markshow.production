cd `dirname "$0"`
setup_path=`pwd`

# # Install configs

sudo cp -f $setup_path/upstart.conf /etc/init/markshow.conf
sudo chown root:root /etc/init/markshow.conf
sudo service markshow restart

# # Monit cofiguration (uncomment to auto-configure)
# sudo cp -f $setup_path/monitrc /etc/monit/monitrc
# sudo chown root:root /etc/monit/monitrc
# sudo service monit restart

sudo cp -f $setup_path/nginx/vhost.conf /etc/nginx/sites-available/markshow.org.conf
sudo chown root:root /etc/nginx/sites-available/markshow.org.conf

sudo ln -s /etc/nginx/sites-available/markshow.org.conf /etc/nginx/sites-enabled/markshow.org.conf

sudo service nginx restart