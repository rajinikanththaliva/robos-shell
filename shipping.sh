echo -e "\e[36m Installing maven server \e[0m"
yum install maven -y
echo -e "\e[36m Adding user path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m Downloading application code and dependencies  \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
unzip shipping.zip
mvn clean package
mv target/shipping-1.0.jar shipping.jar
cp /root/robos-shell/shipping.service  /etc/systemd/system/shipping.service
systemctl daemon-reload
echo -e "\e[36m Installing mysql server \e[0m"
yum install mysql -y
mysql -h mysql.surendra.shop -uroot -pRoboShop@1 < /app/schema/shipping.sql
echo -e "\e[36m Enable and restarting the shipping service \e[0m"
systemctl enable shipping
systemctl restart shipping





