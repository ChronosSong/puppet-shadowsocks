# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::agent::config
class shadowsocks::agent::config {
  if ! defined(File['shadowsocks_dir']) {
    file {'shadowsocks_dir':
      ensure => directory,
      path   => "/etc/${shadowsocks::agent::package_name}",
    }
  }
  file { 'agent-config':
    path    => "/etc/${shadowsocks::agent::package_name}/config.json",
    content => epp('shadowsocks/agent-config.epp'),
    require => File['shadowsocks_dir'],
    notify  => Service[$shadowsocks::agent::package_name]
  }
}
