# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::server
class shadowsocks::server (
  $package_name        =  $shadowsocks::params::package_name,
  $bind_ip             =  $shadowsocks::params::server_bind_ip,
  $port                =  $shadowsocks::params::server_port,
  $mode                =  $shadowsocks::params::server_mode,
  $password            =  $shadowsocks::params::server_password,
  $timeout             =  $shadowsocks::params::server_timeout,
  $method              =  $shadowsocks::params::server_method,
  $enable              =  $shadowsocks::params::server_enable,
  ) inherits shadowsocks::params{
    contain shadowsocks::server::install
    contain shadowsocks::server::config
    contain shadowsocks::server::service
    Class['shadowsocks::server::install']
    -> Class['shadowsocks::server::config']
    -> Class['shadowsocks::server::service']
}

