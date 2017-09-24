#yum install
yum install curl 

# Instalando Node
curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
sudo yum -y install nodejs
sudo yum install gcc-c++ make

#Vue - cli
npm install -g vue-cli

#Asp.net core ok
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'
sudo yum update
sudo yum install libunwind libicu
sudo yum install dotnet-sdk-2.0.0


#Sql Server
https://packages.microsoft.com/config/rhel/7/mssql-server.repo > /etc/yum.repos.d/mssql-server.repo 
yum install mssql-server 
/opt/mssql/bin/sqlservr-setup 
firewall-cmd --zone=public --add-port=1433/tcp --permanent
firewall-cmd --reload 
systemctl status mssql-server 

#GIT
sudo yum install git

#Pastas Padrao
sudo mkdir /var/www
cd /var/www
sudo chmod 777 /var/www

#Clone aplicacao de eventos
git clone https://github.com/josuecorrea/vuejseventos.git /var/www/eventosfront
cd /var/www/eventosfront
npm install

#Clone api
git clone https://github.com/josuecorrea/webapieventos.git /var/www/eventosapi
cd /var/www/eventosapi
dotnet restore
dotnet build

#NGINX
sudo yum install epel-release
sudo yum install nginx
sudo systemctl start nginx

sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

#Permissão
sudo chmod -R 777 /var/www