# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

unless File.exists?("key_rsa")
    system("ssh-keygen -t rsa -f key_rsa -N '' -q")
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
### Defining hypervisor(provider) ###
    config.vm.provider "virtualbox" 

### Machine Kubernetes Master01 ###
    config.vm.define "kubemaster01" do |kubemaster01|
        kubemaster01.vm.provider "virtualbox" do |vb|
            disk = 'kubemaster01.img'
            vb.memory = 4096
            vb.cpus = 2
            vb.name = "kubemaster01"
    end

    kubemaster01.vm.box = "ubuntu/xenial64"
    kubemaster01.vm.hostname = "kubemaster01"
    kubemaster01.vm.network "private_network", ip: "192.168.60.201"
    kubemaster01.vm.network "forwarded_port", guest: 8081, host: 9091
    kubemaster01.vm.provision :shell, path: "startup.sh"
    end

### Machines Kubernetes Master for High Availability Lab ###
### Machine Kubernetes Master02 ###
    config.vm.define "kubemaster02" do |kubemaster02|
        kubemaster02.vm.provider "virtualbox" do |vb|
            disk = 'kubemaster02.img'
            vb.memory = 2048
            vb.cpus = 1
            vb.name = "kubemaster02"
    end

        kubemaster02.vm.box = "ubuntu/xenial64"
        kubemaster02.vm.hostname = "kubemaster02"
        kubemaster02.vm.network "private_network", ip: "192.168.60.202"
        kubemaster02.vm.provision :shell, path: "startup.sh"
    end

### Machine Kubernetes Master03 ###
    config.vm.define "kubemaster03" do |kubemaster03|
        kubemaster03.vm.provider "virtualbox" do |vb|
            disk = 'kubemaster03.img'
            vb.memory = 2048
            vb.cpus = 1
            vb.name = "kubemaster03"
        end

        kubemaster03.vm.box = "ubuntu/xenial64"
        kubemaster03.vm.hostname = "kubemaster03"
        kubemaster03.vm.network "private_network", ip: "192.168.60.203"
        kubemaster03.vm.provision :shell, path: "startup.sh"
    end

### Machine Kubernetes Worker Node 01 ###
    config.vm.define "kubework01" do |kubework01|
        kubework01.vm.provider "virtualbox" do |vb|
            disk = 'kubework01.img'
            vb.memory = 2048
            vb.cpus = 1
            vb.name = "kubework01"
        end

        kubework01.vm.box = "ubuntu/xenial64"
        kubework01.vm.hostname = "kubework01"
        kubework01.vm.network "private_network", ip: "192.168.60.204"
        kubework01.vm.provision :shell, path: "startup.sh"
    end

### Machine Kubernetes Worker Node 02 ###
config.vm.define "kubework02" do |kubework02|
    kubework02.vm.provider "virtualbox" do |vb|
            disk = 'kubework02.img'
            vb.memory = 2048
            vb.cpus = 1
            vb.name = "kubework02"
        end

        kubework02.vm.box = "ubuntu/xenial64"
        kubework02.vm.hostname = "kubework02"
        kubework02.vm.network "private_network", ip: "192.168.60.205"
        kubework02.vm.provision :shell, path: "startup.sh"
    end

### Machine Load Balancer Node ###
    config.vm.define "lbnode" do |lbnode|
        lbnode.vm.provider "virtualbox" do |vb|
            disk = 'lbnode.img'
            vb.memory = 512
            vb.cpus = 1
            vb.name = "lbnode"
        end

        lbnode.vm.box = "ubuntu/xenial64"
        lbnode.vm.hostname = "lbnode"
        lbnode.vm.network "private_network", ip: "192.168.60.200"
        lbnode.vm.provision :shell, path: "startup.sh"
        lbnode.vm.provision :shell, path: "lbnode.sh"
    end
end