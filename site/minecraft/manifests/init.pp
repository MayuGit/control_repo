class minecraft {
  file { '/opt/minecraft':
    ensure  => directory,  
  }
  file {'/opt/minecraft/server.jar':
    ensure  => file,
    source  => 'https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar',
  }
  
  file {'/tmp/jdk.jar':    
    ensure => file,    
    source => 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',    
  }
  package {'java':
    ensure   => present,
    provider => 'rpm',
    source   => '/tmp/jdk.jar',
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
      ensure => file,
      source => 'puppet:///modules/minecraft/minecraft.service',
  }
  
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
