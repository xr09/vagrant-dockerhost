Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian10"
  config.vm.box_check_update = false
  config.vm.hostname = "dockerhost"
  config.vm.provider :libvirt do |libvirt|
    libvirt.cpus = 4
    libvirt.memory = 6000
  end
  config.vm.provision :shell, :path => "bootstrap.sh"
end
