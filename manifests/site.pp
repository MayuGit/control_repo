node default {
  file {'/root/README':
    ensure => file,
    content => 'this is a readme',
  }
}
