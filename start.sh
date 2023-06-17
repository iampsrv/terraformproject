!/bin/bash
sudo apt update -y
sudo apt-get update
sudo apt-get -y upgrade
sudo apt install python3
sudo apt install git
git clone https://github.com/iampsrv/terraformproject.git
cd terraformproject
sudo apt-get -y install python3-pip
pip install -r requirements.txt
python3 application.py