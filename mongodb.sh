echo -e "\e[36m Downloading mongodb repo \e[0m"
cp /root/robos-shell/mongodb.repo   /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log
echo -e "\e[36m Installing mongodb service \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log
echo -e "\e[36m changing the listen address \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/'   /etc/mongod.conf &>>/tmp/roboshop.log
echo -e "\e[36m Enabling and restarting mongodb service \e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod