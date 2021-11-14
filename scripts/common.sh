# install docker  https://docs.docker.com/engine/install/ubuntu/
sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl -OL https://github.com/rancher/rke/releases/download/v1.3.2/rke_linux-amd64
sudo install -o root -g root -m 0755 rke_linux-amd64 /usr/bin/rke
rm -rf rke_linux-amd64 kubectl

sudo ufw disable
sudo swapoff -a; sudo sed -i '/swap/d' /etc/fstab

sudo useradd -m -p $(openssl passwd -1 rke) -s /bin/bash rke
sudo usermod -aG docker rke
sudo usermod -aG docker vagrant

sudo sed -i"" -e "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config 
sudo service ssh restart 