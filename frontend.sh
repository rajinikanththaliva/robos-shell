echo -e "\e[36m Installing nginx \e[0m"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[36m Removing default content \e[0m"
cd /usr/share/nginx/html  &>>/tmp/roboshop.log
rm -rf *  &>>/tmp/robosho.log
echo -e "\e[36m Downloading custom server content \e[0m"
curl -O  /root/robos-sh/frontend.zip   https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>/tmp/roboshop.log
unzip frontend.zip &>>/tmp/roboshop.log
echo -e "\e[36m configuring reverse proxy \e[0m"
cp /root/robos-shell/roboshop.conf  /etc/nginx/default.d/roboshop.conf
 echo -e "\e[36m Enabling and restarting nginx service \e[0m"
 systemctl enable nginx  &>>/tmp/roboshop.log
 systemctl restart nginx

