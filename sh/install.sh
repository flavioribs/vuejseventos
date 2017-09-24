#yum install
yum install curl 

# Instalando Node
apt-get -y update
wget https://nodejs.org/download/release/v7.8.0/node-v7.8.0.tar.gz
tar xzvf node-v* && cd node-v*
sudo yum install gcc gcc-c++
./configure
make
sudo make install

#Vue - cli
npm install -g vue-cli

#Asp.net core
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

#Clone aplicacao de eventos
sudo mkdir /var/www
cd /var/www


#Clone api

#NGINX
sudo yum install epel-release
sudo yum install nginx
sudo systemctl start nginx

sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

#Permissão
sudo CHMOD -R 777 /var/www

function confirm()
{
    echo -n "$@ "
    read -e answer
    for response in y Y yes YES Yes Sure sure SURE OK ok Ok
    do
        if [ "_$answer" == "_$response" ]
        then
            return 0
        fi
    done

    # Any answer other than the list above is considerred a "no" answer
    return 1
}