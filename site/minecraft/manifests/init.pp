class minecraft {
  file { '/opt/minecraft':
    ensure  => directory,  
  }
  file {'/opt/minecraft/server.jar':
    ensure  => file,
    source  => 'https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar',
  }
  package {'java':
    ensure => present,  
  }
  
  file { '/opt/minecraft/eula.txt',
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
      ensure => file,
      source => 'puppet:///modules/minecraft/minecraft.service',
  }
}
