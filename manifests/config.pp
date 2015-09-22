# == Class: madsonic::config
class madsonic::config {
  case $::osfamily {
    'Debian': { $default_file = '/etc/default/madsonic' }
    default: { fail("Unsupported OS: ${::osfamily}") }
  }

  file { $default_file:
    ensure  => present,
    content => template('madsonic/config.erb'),
    mode    => '0644',
  }
}
