node 'default' {
	
	package {"wireshark" : 
		ensure => "latest",
		provider => 'chocolatey'
	}
	package {"git" : 
		ensure => latest,
		provider => 'chocolatey'
	}

	class { 'domain_membership':
      domain       => 'vagrant.local',
      username     => 'Administrator',
      password     => 'Vagrant',
      join_options => '39',
    }

	reboot { 'after':
  		when       => pending,
	}	

}