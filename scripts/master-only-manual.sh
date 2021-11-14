sudo su - rke
ssh-keygen -t rsa -b 2048

ssh-copy-id rke@192.168.56.11

ssh-copy-id rke@192.168.56.12

# switcxh to user vagrant
exit
curl -OL https://github.com/rancher/rke/releases/download/v1.3.2/rke_linux-amd64
sudo install -o root -g root -m 0755 rke_linux-amd64 /usr/bin/rke

sudo su - rke
