echo -e "\e[36m Installing nginx \e[0m"
yum install nginx -y
echo -e "\e[36m Removing default content \e[0m"
cd /usr/share/nginx/html  &>>/tmp/roboshop.log
rm -rf *
echo -e "\e[36m Downloading custom server content \e[0m"
curl -O   https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
echo -e "\e[36m configuring reverse proxy \e[0m"
cp /root/robos-shell/roboshop.conf  /etc/nginx/default.d/roboshop.conf
 echo -e "\e[36m Enabling and restarting nginx service \e[0m"
 systemctl enable nginx
 systemctl restart nginx

