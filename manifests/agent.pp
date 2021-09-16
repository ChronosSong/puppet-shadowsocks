# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::agent
class shadowsocks::agent (
  $package_name        =  $shadowsocks::params::package_name,
  $server_ip           =  $shadowsocks::params::agent_server_ip,
  $server_port         =  $shadowsocks::params::agent_server_port,
  $local_port          =  $shadowsocks::params::agent_local_port ,
  $mode                =  $shadowsocks::params::agent_mode,
  $password            =  $shadowsocks::params::agent_password,
  $timeout             =  $shadowsocks::params::agent_timeout,
  $method              =  $shadowsocks::params::agent_method,
  $enable              =  $shadowsocks::params::agent_enable,
  ) inherits shadowsocks::params{
    contain shadowsocks::agent::install
    contain shadowsocks::agent::config
    contain shadowsocks::agent::service
    Class['shadowsocks::agent::install']
    -> Class['shadowsocks::agent::config']
    -> Class['shadowsocks::agent::service']
}
