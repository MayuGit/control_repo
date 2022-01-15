class profile::ssh_server {
  package {'openssh-server':
    ensure  => present,  
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',    
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure  => 'present'  ,
    user    => 'root',
    type    => 'ssh-rsa',
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDOVBZ6b5F9eeqCmuZlbVQB6onUqcsLmmVzIlomrBuMPK7Lg9QWxBEWgVkNoDrWw/jCRBEmMnXWS5HzzKZ2KM9nT1djiEcMtKVlxHs4DHjiyV+nKwyCxViH/lbXiDDNW0ZpF83jcu4QKGwrXfLulpbeeWqxr1vvexp16bDf+IgfF5SK0yveucVVhdBDkp9TwJ0s7l4za2suPdREpbU4xIT4xLKUf8D9hv5z9nap6nnpzIL8tkpW7aMy8xFlUcS4obHLLDYyIUfwBrmkVepwiAWWl7887Rtds+0jPdfdg0mgTJx+q4b3TCw63OlpsRA9sgc8zFNHPfnuF9F4meMmE7nb',
  }
}
