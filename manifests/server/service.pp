# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::server::service
class shadowsocks::server::service {
  $package_service = $shadowsocks::server::package_name
  if $package_service == 'shadowsocks' {
    file {'shadowsocks_service':
      path    => "/etc/systemd/system/multi-user.target.wants/${package_service}.service",
      content => epp('shadowsocks/server-service.epp'),
    }
  }
  service { $package_service:
    ensure    => $shadowsocks::server::enable,
    subscribe => File['server-config']
  }
}
