yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
Yum module list
yum module enable redis:remi-6.2 -y
yum install redis -y
sed -i -e 's/127.0.0.1/0.0.0.0/'   /etc/redis.conf
sed -i -e 's/127.0.0.1/0.0.0.0/'   /etc/redis/redis.conf
systemctl enable redis
systemctl restart redis





