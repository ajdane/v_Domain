node 'default' {
	package {"wireshark" : 
		ensure => "latest",
		provider => 'chocolatey'
	}
	package {"git" : 
		ensure => latest,
		provider => 'chocolatey'
	}
    
    class {'windows_ad':
      install                => present,
      installmanagementtools => true,
      restart                => true,
      installflag            => true,
      configure              => present,
      configureflag          => true,
      domain                 => 'forest',
      domainname             => 'aej.local',
      netbiosdomainname      => 'aej',
      domainlevel            => '6',
      forestlevel            => '6',
      databasepath           => 'c:\\windows\\ntds',
      logpath                => 'c:\\windows\\ntds',
      sysvolpath             => 'c:\\windows\\sysvol',
      installtype            => 'domain',
      dsrmpassword           => 'Vagran7*',
      installdns             => 'yes',
      localadminpassword     => 'Vagran7*',
    }

}