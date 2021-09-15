#!/bin/sh

sudo amazon-linux-extras install docker

sudo service docker start

sudo usermod -a -G docker ec2-user

sudo chkconfig docker on

sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo curl -L -O https://raw.githubusercontent.com/source-foundry/hack-linux-installer/master/hack-linux-installer.sh

sudo chmod +x hack-linux-installer.sh

sudo ./hack-linux-installer.sh latest


docker-compose version

sudo yum -y install zsh

zsh --version

sudo yum install -y util-linux-user


# Or use "sudo chsh -s $(which zsh) $(whoami)" to be sure
chsh -s "$(which zsh)"

curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#echo "plugins=(git dnf zsh-autosuggestions zsh-syntax-highlighting)" >> ~/.zshrc

sed -i 's/plugins=(git)/plugins=(git dnf zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

sudo docker build -t myjenkins . 

sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker -p 80:8080 myjenkins
