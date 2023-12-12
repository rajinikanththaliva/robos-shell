echo -e "\e[36m Installing nginx \e[0m"
yum install nginx -y &>>/tmp/robosho.log
echo -e "\e[36m Removing default content \e[0m"
cd /usr/share/nginx/html  &>>/tmp/robosho.log
rm -rf *  &>>/tmp/robosho.log
echo -e "\e[36m Downloading custom server content \e[0m"
curl -O  /root/robos-sh/frontend.zip   https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>/tmp/robosho.log
unzip frontend.zip &>>/tmp/robosho.log
 echo -e "\e[36m Enabling and restarting nginx service \e[0m"
 systemctl enable nginx  &>>/tmp/robosho.log
 systemctl restart nginx

