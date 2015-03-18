node 'default' {
	
	package {"wireshark" : 
		ensure => "latest",
		provider => 'chocolatey'
	}
	package {"git" : 
		ensure => latest,
		provider => 'chocolatey'
	}
	class {'joindomain':
		domain   => 'aej.local',
		username => 'administrator',
		password => 'vagran7*',
	}
	

}