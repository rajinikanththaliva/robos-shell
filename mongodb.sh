echo -e "\e[36m Downloading mongodb repo \e[0m"
cp /root/robos-shell/mongo.repo   /etc/yum.repos.d/mongo.repo
echo -e "\e[36m Installing mongodb service \e[0m"
yum install mongodb-org -y
echo -e "\e[36m changing the listen address \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/'   /etc/mongod.conf
echo -e "\e[36m Enabling and restarting mongodb service \e[0m"
systemctl enable mongod
systemctl restart mongod