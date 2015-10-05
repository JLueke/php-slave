# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.omnibus.chef_version = :latest
	config.vbguest.auto_update = true
	config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :private_network, ip: "192.168.58.69"

	config.vm.synced_folder "../www", "/var/www/", :nfs => true

	config.vm.provider :virtualbox do |vb|
		# vb.gui = true
		vb.customize ["modifyvm", :id, "--memory", "2048"]
	end

	config.librarian_chef.cheffile_dir = "./"

	config.vm.provision :chef_solo do |chef|
		chef.cookbooks_path = ["cookbooks", "custom-cookbooks"]
		#chef.roles_path = ["roles"]
		#chef.data_bags_path = ["data_bags"]

		#recipes
		chef.add_recipe "apt"
		chef.add_recipe "curl"
		chef.add_recipe "slave"

		chef.json = {
			"php" => {
				"directives" => {
					"date.timezone" => "Europe/Berlin",
					"short_open_tag" => "Off",
					"memory_limit" => "128M",
					"upload_max_filesize" => "20M",
					"post_max_size" => "20M",
					"expose_php" => "0"
				}
			}
		}
	end
end
