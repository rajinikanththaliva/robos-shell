echo -e "\e[36m Installing nginx service \e[0m"
yum install nginx
echo -e "\e[36m Removing default content \e[0m"
cd /usr/share/nginx/html
rm -rf *
echo -e "\e[36m Downloading custom service \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
echo -e "\e[36m Enabling and Restarting the nginx service \e[0m"
systemctl enable nginx
systemctl restart nginx
