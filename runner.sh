sudo apt-get update && apt-get install -y nocache git ca-certificates && update-ca-certificates
sudo apt-get install -y curl
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update -y

echo "build-essential"
sudo apt install build-essential manpages-dev -y
sleep 10
echo "----------------------------------------------------------"


echo "google-chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
sleep 10
echo "----------------------------------------------------------"

echo "git"
sudo apt install git -y
sleep 10
echo "----------------------------------------------------------"

echo "postman"
sudo snap install postman
sleep 10
echo "----------------------------------------------------------"

echo "nodejs and npm"
sudo apt install nodejs npm -y
sleep 10
echo "----------------------------------------------------------"

echo "go-lang"
sudo snap install go --classic
sleep 10
echo "----------------------------------------------------------"

echo "java"
sudo apt-get install oracle-java17-installer oracle-java17-set-default -y
java --version
sleep 10
echo "----------------------------------------------------------"

echo "maven"
sudo apt install maven
mvn -version
sleep 10
echo "----------------------------------------------------------"

echo "gradle"
sudo snap install gradle --classic
sleep 10
echo "----------------------------------------------------------"

echo "install docker and docker compose"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker "$USER"
rm get-docker.sh

COMPOSE_VERSION=$(git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1)
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
sleep 10
echo "----------------------------------------------------------"

echo "aws-cli"
sudo apt-get install awscli -y
sleep 10
echo "----------------------------------------------------------"


echo "kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sleep 10
echo "----------------------------------------------------------"

echo "helm"
wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
tar xvf helm-v3.4.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin
rm helm-v3.4.1-linux-amd64.tar.gz
rm -rf linux-amd64
helm version
sleep 10
echo "----------------------------------------------------------"


echo "terraform"
sudo snap install terraform --classic
sleep 10
echo "----------------------------------------------------------"

echo "jetbrain-cli"
sudo apt-get install -y libfuse2
sudo curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash
/opt/jetbrains-toolbox/jetbrains-toolbox
sleep 10
echo "----------------------------------------------------------"

#sudo reboot
