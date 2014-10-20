# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = 4096
     vb.cpus = 2
   end

   config.vm.box = "box-cutter/ubuntu1404-desktop"
   config.vm.provision :shell, path: "bootstrap.sh"

end
