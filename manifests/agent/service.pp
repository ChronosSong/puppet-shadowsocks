# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::agent::service
class shadowsocks::agent::service {
  $package_service = $shadowsocks::agent::package_name
  if ! defined(File['shadowsocks_service']) {
    file {'shadowsocks_service':
      path    => "/etc/systemd/system/multi-user.target.wants/${package_service}.service",
      content => epp('shadowsocks/agent-service.epp'),
    }
  }
  service { $package_service:
    ensure    => $shadowsocks::agent::enable,
    require   => File['shadowsocks_service'],
    subscribe => File['agent-config']
  }
}
