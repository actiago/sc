#/bin/bash
# Enable Mysql
sudo service mysqld start 
sudo chkconfig --level 35 mysqld on
sudo chkconfig --add mysqld
# Enable Apache
sudo service mysqld start 
sudo chkconfig --level 35 mysqld on
sudo chkconfig --add mysqld
