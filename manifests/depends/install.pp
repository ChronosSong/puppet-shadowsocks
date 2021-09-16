# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include shadowsocks::depends::install
class shadowsocks::depends::install {
  $libsodium_name = $facts['os']['family'] ? {
    /(Debian|Ubuntu)/ => 'libsodium-dev',
    default           => 'libsodium'
  }
  @package{'python3-pip':
    tag => depends,
  }
  @package{'libsodium':
    name => $libsodium_name,
    tag  => depends,
  }
  Package <| tag == 'depends' |>
}
