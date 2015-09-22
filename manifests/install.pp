# == Class: madsonic::install
class madsonic::install() inherits madsonic::params {
  package { $madsonic::package_name:
    ensure  => present,
  }

  if ($madsonic::manage_user) {
    user { $madsonic::user:
      ensure => present,
      shell  => $madsonic::user_shell,
      system => true,
      home   => $madsonic::home,
    }
  }

  file { $madsonic::home:
    ensure  => directory,
    mode    => '0755',
    owner   => $madsonic::user,
    group   => $madsonic::user,
    require => User[$madsonic::user]
  }
}
