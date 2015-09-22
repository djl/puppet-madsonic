# == Class: madsonic::service
class madsonic::service {
  service { 'madsonic':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
