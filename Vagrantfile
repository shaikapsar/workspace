# -*- mode: ruby -*-
# vi: set ft=ruby :

host_ip       = "192.168.56.1"

vm_hostname   = "workspace"
vm_box        = "ubuntu/xenial64"
vm_memory     = 2048
vm_cpus       = 2
vm_ip         = "192.168.56.10"

proxy_enabled = true
http_proxy    = "http://one.proxy.att.com:8888"
https_proxy   = "https://one.proxy.att.com:8888"
no_proxy      = "localhost,127.0.0.1,#{host_ip},#{vm_ip}"


Vagrant.configure("2") do |config|

    if proxy_enabled then
	    if Vagrant.has_plugin?("vagrant-proxyconf") 
	        config.proxy.http     = http_proxy
		    config.proxy.https    = https_proxy
		    config.proxy.no_proxy = no_proxy
	        config.proxy.enabled  = { docker: false }
	    else
		    STDERR.puts("ABORTED! vagrant-proxyconf plugin required in proxy environment")
		    exit(false)
	    end
    else
        if Vagrant.has_plugin?("vagrant-proxyconf") 
            config.proxy.enabled = false
        end
    end

    config.vm.box = vm_box

    config.vm.box_check_update = true

    config.vm.hostname = vm_hostname

    config.vm.network "private_network", ip: vm_ip

    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |vb|
        vb.name = vm_hostname
        vb.memory = vm_memory
        vb.cpus = vm_cpus
    end

    config.vm.provision "shell", inline: <<-SHELL
        #!/usr/bin/env bash
        apt-get update 
        sudo apt-get -y upgrade && sudo apt dist-upgrade -y && sudo apt-get autoremove -y
    SHELL
end
