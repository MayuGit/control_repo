class profile::agent_nodes {
  include dockeragent
  docketagent::node{'web.puppet.vm'}
  docketagent::node{'db.puppet.vm'}
}
