echo -e "\e[36m Downloading nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_19.x | sudo -E bash -
echo -e "\e[36m installing nodejs service \e[0m"
yum install nodejs -y
echo -e "\e[36m Adding user path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m Downloading new app content and their dependencies \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip catalogue.zip
rm -rf catalogue.zip
npm install
echo -e "\e[36m Creating catalogue service file \e[0m"
cp /root/robos-shell/catalogue.service  /etc/systemd/system/catalogue.service
systemctl daemon-reload
echo -e "\e[36m Downloading and loading the mongodb schema \e[0m"
cp /root/robos-shell/mongodb.repo   /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.surendra.shop </app/schema/catalogue.js
echo -e "\e[36m Enable and restarting the catalogue service \e[0m"
systemctl enable catalogue
systemctl restart catalogue


