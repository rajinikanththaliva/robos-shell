echo -e "\e[36m installing golang service \e[0m"
yum install golang -y
echo -e "\e[36m Adding user path \e[0m"
useradd roboshop
mkdir /app
cd /app
curl -O https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
unzip dispatch.zip
echo -e "\e[36m Download dependencies \e[0m"
go mod init dispatch
go get
go build
cp /root/robos-shell/dispatch.service   /etc/systemd/system/dispatch.service
systemctl daemon-reload
echo -e "\e[36m Enable and restarting the dispatch service \e[0m"
systemctl enable dispatch
systemctl retart dispatch

