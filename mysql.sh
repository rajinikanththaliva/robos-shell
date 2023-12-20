echo -e "\e[36m Disabling mysql module \e[0m"
yum module disable mysql -y
cp /root/robos-shell/mysql.repo   /etc/yum.repos.d/mysql.repo
echo -e "\e[36m Installing mysql server \e[0m"
yum install mysql-community-server -y
echo -e "\e[36m Change the default password  \e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[36m Check the new password  \e[0m"
mysql -uroot -pRoboShop@1
echo -e "\e[36m Enable and Restart mysql  \e[0m"
systemctl enable mysqld
systemctl start mysqld




