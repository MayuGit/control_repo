node default {
}

node 'master.puppet.vm' {
  incldue role::master_server
}
