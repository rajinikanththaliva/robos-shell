echo -e "\e[36m Downloading nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m installing nodejs service \e[0m"
yum install nodejs -y
echo -e "\e[36m Adding user path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m Downloading new app content and their dependencies \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/cart.zip
unzip cart.zip
npm install
echo -e "\e[36m Creating cart service file \e[0m"
cp /root/robos-shell/cart.service    /etc/systemd/system/cart.service
systemctl daemon-reload
echo -e "\e[36m Enable and restarting the cart service \e[0m"
systemctl enable cart
systemctl restart cart
