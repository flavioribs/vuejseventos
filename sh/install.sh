#yum install ok
yum install curl 

# Instalando Node ok
curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
sudo yum -y install nodejs
sudo yum install gcc-c++ make

#Vue - cli ok
npm install -g vue-cli

#Asp.net core ok
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'
sudo yum update
sudo yum install libunwind libicu
sudo yum install dotnet-sdk-2.0.0

#GIT ok
sudo yum install git

#Pastas Padrao ok
sudo mkdir /var/www
cd /var/www
sudo chmod 777 /var/www

#Clone aplicacao de eventos ok
git clone https://github.com/josuecorrea/vuejseventos.git /var/www/eventosfront
cd /var/www/eventosfront
npm install

#Clone api ok
git clone https://github.com/josuecorrea/webapieventos.git /var/www/eventosapi
cd /var/www/eventosapi
dotnet restore
dotnet build

dotnet ef migrations add InitialCreate
dotnet ef database update

#NGINX ok
sudo yum install epel-release
sudo yum install nginx
sudo systemctl start nginx

sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

#Permissão
sudo chmod -R 777 /var/www
sudo service nginx restart

#Publish
sudo mkdir /var/www/production/api
sudo mkdir /var/www/production/front

dotnet publish /var/www/eventosapi/ApiEventosCore --output "/var/www/production/api"