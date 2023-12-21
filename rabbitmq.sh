echo -e "\e[36m Repos from script vendor \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
echo -e "\e[36m Repos for rabbitmq \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo -e "\e[36m Installing rabbitmq server \e[0m"
yum install rabbitmq-server -y
echo -e "\e[36m Create one user for application \e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
echo -e "\e[36m Enable and restart rabbitmq server \e[0m"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
