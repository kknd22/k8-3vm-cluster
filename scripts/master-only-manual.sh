sudo su - rke
ssh-keygen -t rsa -b 2048

ssh-copy-id rke@192.168.56.11

ssh-copy-id rke@192.168.56.12

# switcxh to user vagrant
exit
curl -OL https://github.com/rancher/rke/releases/download/v1.3.2/rke_linux-amd64
sudo install -o root -g root -m 0755 rke_linux-amd64 /usr/bin/rke
sudo apt-get install -y bash-completion 
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl

echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

sudo su - rke
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

