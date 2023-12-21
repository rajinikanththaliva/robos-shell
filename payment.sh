echo -e "\e[36m Installing python server \e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e[36m Adding user path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m Downloading new app content and their dependencies \e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/payment.zip
unzip payment.zip
pip3.6 install -r requirements.txt
cp /root/robos-shell/payment.service   /etc/systemd/system/payment.service
systemctl daemon-reload
echo -e "\e[36m Enable and restarting the payment service \e[0m"
systemctl enable payment
systemctl start payment

