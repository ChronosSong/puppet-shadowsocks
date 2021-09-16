# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::params
class shadowsocks::params {
  $package_name = $facts['os']['family'] ? {
    /(Debian|Ubuntu)/ => 'shadowsocks-libev',
    default => 'shadowsocks'
    }
  $server_bind_ip       = '0.0.0.0'
  $server_port          = 8080
  $server_mode          = 'tcp_and_udp'
  $server_password      = 'password'
  $server_timeout       = 60
  $server_method        = 'chacha20-ietf-poly1305'
  $server_enable        = true

  $agent_server_ip      ='0.0.0.0'
  $agent_server_port    = 8080
  $agent_local_port     = 1080
  $agent_mode           = 'tcp_and_udp'
  $agent_password       = 'password'
  $agent_timeout        = 300
  $agent_method         = 'chacha20-ietf-poly1305'
  $agent_enable         = false
}
