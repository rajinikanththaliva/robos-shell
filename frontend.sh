echo -e "\e[36m Installing nginx servie \e[0m"
yum install nginx -y
echo -e "\e[36m Removing default server content \e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e "\e[36m Downloading custom server content \e[0m"
curl -O /root/robos-shell/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
rm -rf frontend.zip
echo -e "\e[36m Enabling and restarting the Nginx  \e[0m"
systemctl enable nginx
systemctl restart nginx


