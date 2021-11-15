Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: <<-SHELL
        apt-get update -y
        echo "192.168.56.10  master-node" >> /etc/hosts
        echo "192.168.56.11  worker-node01" >> /etc/hosts
        echo "192.168.56.12  worker-node02" >> /etc/hosts
    SHELL
    
    config.vm.define "master", primary: true do |master|
      master.vm.box = "bento/ubuntu-18.04"
      master.vm.hostname = "master-node"
      master.vm.network "private_network", ip: "192.168.56.10"
      master.vm.network "forwarded_port", guest: 8001, host: 8001
      master.vm.provider "virtualbox" do |vb|
          vb.memory = 4096
          vb.cpus = 2
      end
      master.vm.provision "shell", path: "scripts/common.sh"
    end

    (1..2).each do |i|
        config.vm.define "node0#{i}" do |node|
        node.vm.box = "bento/ubuntu-18.04"
        node.vm.hostname = "worker-node0#{i}"
        node.vm.network "private_network", ip: "192.168.56.1#{i}"
        node.vm.provider "virtualbox" do |vb|
            vb.memory = 4096
            vb.cpus = 1
        end
        node.vm.provision "shell", path: "scripts/common.sh"
        end
    end
end
