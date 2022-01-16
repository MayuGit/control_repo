class minecraft {

$url = 'https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar'
$install_dir = '/opt/minecraft'
$jdk_latest = 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm'

  file { $install_dir':
    ensure  => directory,  
  }
  file {"${install_dir}/server.jar":
    ensure  => file,
    source  => $url,
    before  => Service['minecraft'],
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
  
  file { "${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
      ensure => file,
      source => 'puppet:///modules/minecraft/minecraft.service',
  }
  
  service {'minecraft':
    ensure  => running,
    enable  => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']]
  }
}
