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

#Sql Server
sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server.repo
sudo yum update
sudo yum install -y mssql-server
sudo /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server
sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent
sudo firewall-cmd --reload

sudo curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/7/prod.repo
sudo yum update
sudo yum remove unixODBC-utf16 unixODBC-utf16-devel
sudo yum update
sudo yum install -y mssql-tools unixODBC-devel
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc 

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