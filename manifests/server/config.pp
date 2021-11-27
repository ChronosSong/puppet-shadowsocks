# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::server::config
class shadowsocks::server::config {
  if ! defined(File['shadowsocks_dir']) {
    file {'shadowsocks_dir':
      ensure => directory,
      path   => "/etc/${shadowsocks::server::package_name}",
    }
  }
  file { 'server-config':
    path    => "/etc/${shadowsocks::server::package_name}/config.json",
    content => epp('shadowsocks/server-config.epp'),
    require => File['shadowsocks_dir'],
    notify  => Service[$shadowsocks::server::package_name]
  }

  #bbr
  sysctl { 'net.ipv4.tcp_congestion_control':
    ensure => present,
    value  =>'bbr'
  }
  sysctl { 'net.core.default_qdisc':
    ensure => present,
    value  =>'fq'
  }
}
