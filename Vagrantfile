Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"

  config.vm.provision :shell, path: "provision.sh"

  config.vm.network :forwarded_port, guest: 80, host: 8080
end
