#!/bin/bash
metasploitsetup()

{
      sudo apt-get install figlet
      echo "----------------------------------------------------"
      figlet Iniciando Pré Instalação
      echo "----------------------------------------------------"
      sudo apt-get update
      sudo apt-get upgrade
      echo " -------------------->"
      echo " ------------------------------>"
      sudo apt-get install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev openjdk-7-jre git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev
      echo " -----------------------------------------"
      figlet Pré Requisitos Instalados!
      echo "------------------------------------------"
     cd ~
   git clone git://github.com/sstephenson/rbenv.git .rbenv
   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
   echo 'eval "$(rbenv init -)"' >> ~/.bashrc
   exec $SHELL
     figlet Processando....
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.1.5
rbenv global 2.1.5
ruby -v
echo "--------------------------------------"
figlet Ruby configurado!
sudo gem install bundler 
echo "-----------------------------------------"
figlet Processando NMap . . . 
echo "-----------------------------------------"
sudo apt-get install subversion
cd ~
mkdir ~/Development
cd ~/Development
svn co https://svn.nmap.org/nmap
cd nmap
./configure
make
sudo make install
make clean
echo "--------------------------"
figlet Nmap Pré Configurado!
echo "--------------------------"
figlet Iniciando Postgre SQL
echo "-----------------------------"
sudo -s
su postgres
echo " Inserir a senha 123"
createuser msf -P -S -R -D

createdb -O msf msf
exit
exit
echo " -----------------------------------------------------------"
figlet Iniciando Instalação MetasPloit
echo " -----------------------------------------------------------"
sudo cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
cd metasploit-framework
bundle install
figlet Processando . . . . 
echo "-----------------------------------------"
sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

curl -# -o /tmp/armitage.tgz http://www.fastandeasyhacking.com/download/armitage-latest.tgz

sudo tar -xvzf /tmp/armitage.tgz -C /opt

sudo ln -s /opt/armitage/armitage /usr/local/bin/armitage

sudo ln -s /opt/armitage/teamserver /usr/local/bin/teamserver

sudo sh -c "echo java -jar /opt/armitage/armitage.jar \$\* > /opt/armitage/armitage"

sudo perl -pi -e 's/armitage.jar/\/opt\/armitage\/armitage.jar/g' /opt/armitage/teamserver

sudo cp /files/databases/database.yml  /opt/metasploit-framework/config/

sudo sh -c "echo export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml >> /etc/profile"

source /etc/profile

echo " ----------------------------------------------------------------------------"
figlet Instalaçao concluida com sucesso! Obrigado por usar   :D
echo " Meu facebook >> www.facebook.com/guilherme.cesar.520"
echo "End...."



}

parse_parameters()
{
   for cur_param in $@; do
 if [[ $cur_param =~ --iniciar ]]; then
			metasploitsetup
			exit 0
  else
    echo "lol lek"
fi
done
}
parse_parameters $@
