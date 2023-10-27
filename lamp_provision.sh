
# -*- modeystem
sudo apt-get update -y
sudo apt-get upgrade -y

# Install LAMP stack components

# Install PHP dependencies and PHP
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.1 -y
sudo apt install  -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-curl php8.1-xml php8.1-gd php8.1-mbstring
sudo apt-get update -y
sudo apt-get upgrade -y

# Install python 3 and pip
sudo apt-get install python3 -y
sudo apt-get -y install python3-pip


# Install Apache and MySQL
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y mysql-server mysql-client pymysql
sudo systemctl start mysql

sudo apt-get install -y apache2 libapache2-mod-php
sudo systemctl start apache2



# Configure MySQL - set a root password and create your app's database

# Define MySQL root password
MYSQL_ROOT_PASSWORD="Hokage_6969"

# Define MySQL username and password
MYSQL_USER="luciphania"
MYSQL_USER_PASSWORD="Hokage_6969"



# Create a new MySQL user and grant privileges
mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<EOF
CREATE USER '$MYSQL_USER'@'192.168.232.9' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON . TO '$MYSQL_USER'@'192.168.232.9';
FLUSH PRIVILEGES;
EOF


# Restart MySQL service for changes to take effect
sudo systemctl restart mysql

# Provide information to the user
echo "MySQL root password: $MYSQL_ROOT_PASSWORD"
echo "MySQL user: $MYSQL_USER"
echo "MySQL user password: $MYSQL_USER_PASSWORD"

# Create a cron job to check server uptime every day at 12 am
(crontab -l ; echo "0 0 * * * uptime >> /var/log/uptime.log") | crontab -



