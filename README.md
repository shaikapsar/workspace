# workspace
Development Workspace

## Prerequisites

Vagrant Setup.

## Proxy setup if required.

set http_proxy=http://one.proxy.att.com:8888

set https_proxy=%http_proxy%

vagrant plugin install vagrant-proxyconf

## Workspace setup

git clone https://github.com/shaikapsar/workspace

cd workspace

# Update the below configurations based on the requirement in Vagrantfile

vm_hostname   = "workspace"

vm_box        = "ubuntu/xenial64"

vm_memory     = 2048

vm_cpus       = 2

vm_ip         = "192.168.56.10"

host_ip       = "192.168.56.1"

proxy_enabled = true

http_proxy    = "http://one.proxy.att.com:8888"

https_proxy   = "https://one.proxy.att.com:8888"

no_proxy      = "localhost,127.0.0.1,#{host_ip},#{vm_ip}"


## Bring the workspace up and running.

vagrant up

## SSH into the workspace.

Note: Vagrant private key will be created in the below path

C:\Users\%USERNAME%\.vagrant.d\insecure_private_key

ssh -i "C:\Users\%USERNAME%\.vagrant.d\insecure_private_key" vagrant@192.168.56.10

Note: 

If you want to access VM using putty then generate ppk file from C:\Users\%USERNAME%\.vagrant.d\insecure_private_key using puttygen

