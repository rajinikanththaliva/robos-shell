echo -e "\e[36m Installing nginx \e[0m"
yum install nginx -y
echo -e "\e[36m Removing default content \e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e "\e[36m Downloading custom server content \e[0m"
curl -o /root/robos-shell/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
 echo -e "\e[36m Enabling and restarting nginx service \e[0m"
 systemctl enable nginx
 systemctl restart nginx

