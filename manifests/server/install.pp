# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::server::install
class shadowsocks::server::install {
  case $shadowsocks::server::package_name {
    'shadowsocks-libev': {
      package {'shadowsocks-libev':
        provider => apt,
      }
    }
    'shadowsocks': {
      contain shadowsocks::depends::install
      package {'shadowsocks':
        provider => pip3,
        source   => 'https://github.com/shadowsocks/shadowsocks/archive/master.zip',
        before   => Class['shadowsocks::depends::install']
      }
    }
    default: {
      fail("No ${shadowsocks::server::package_name} is not supported on ${::operatingsystem}")
    }
  }
}
