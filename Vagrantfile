# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
	
	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end
	
	config.vm.define "dc" do |dc|
		dc.vm.box = "lmayorga1980/windows-2012r2"
		dc.vm.communicator = "winrm"
		dc.vm.hostname = "2012r2-dc"
		dc.vm.network "forwarded_port", guest: 3389, host: 53389
		dc.vm.network "private_network", ip: "192.168.33.10"
		dc.vm.provision :shell, inline: "puppet module install --force rismoney/chocolatey"
		dc.vm.provision :shell, inline: "puppet module install --force joshcooper/powershell"
		dc.vm.provision :shell, inline: "puppet module install --force puppetlabs/stdlib"
		dc.vm.provision :shell, inline: "puppet module install --force jriviere/windows_ad"
		dc.vm.provision "puppet" do |puppet|
			puppet.manifest_file = "DC.pp"
		end
	end
  
	config.vm.define "member1" do |member1|
		member1.vm.box = "lmayorga1980/windows-2012r2"
		member1.vm.communicator = "winrm"
		member1.vm.hostname = "member1"
		member1.vm.network "forwarded_port", guest: 3389, host: 43389
		member1.vm.network "private_network", ip: "192.168.33.20"
		member1.vm.provision :shell, inline: "puppet module install --force rismoney/chocolatey"
		member1.vm.provision :shell, inline: "puppet module install --force joshcooper/powershell"
		member1.vm.provision :shell, inline: "puppet module install --force puppetlabs/stdlib"
		member1.vm.provision :shell, inline: "puppet module install --force puppetlabs/reboot"
		member1.vm.provision :shell, inline: "puppet module install --force trlinkin/domain_membership"
		member1.vm.provision :shell, inline: "powershell.exe C:\vagrant\Powershell\Set-DNSaddresses.ps1"
		member1.vm.provision "puppet" do |puppet| 
			puppet.manifest_file = "member1.pp"
		end
	end

end
