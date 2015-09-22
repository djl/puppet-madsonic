# == Class: madsonic
#
# Install Madsonic
#
# === Parameters
#
# [*package_name*]
#   The Madsonic package name
#
# [*user*]
#   The user Madsonic should run as
#
# [*user_shell*]
#   The Madsonic user's shell
#
# [*manage_user*]
#   Should Puppet manage the user resource
#
# [*home*]
#   The Madsonic data directory. Will also be used for the Madsonic
#   user home directory
#
# [*host*]
#   The address Madsonic should listening on
#
# [*port*]
#   The port number Madsonic should be running on
#
# [*https_port*]
#   The port number Madsonic should be running on for HTTPS
#   connections
#
# [*context_path*]
#   The URL path for madsonic (e.g. / or /madsonic)
#
# [*init_memory*]
#   The initial memory size
#
# [*max_memory*]
#   The memory limit
#
# [*pidfile*]
#   Madsonic's pidfile
#
# [*default_music_folder*]
#   The default music folder
#
# [*default_upload_folder*]
#   The default upload folder
#
# [*default_podcast_folder*]
#   The default podcast folder
#
# [*default_playlist_import_folder*]
#   The default playlist import folder
#
# [*default_playlist_export_folder*]
#   The default playlist export folder
#
# [*default_playlist_backup_folder*]
#   The default playlist export folder
#
# [*default_timezone*]
#   The default timezone
#
# === Examples
#
#  class { 'madsonic':
#    user => 'jim',
#  }
#
#
class madsonic (
  $user                           = $madsonic::params::user,
  $user_shell                     = $madsonic::params::user_shell,
  $manage_user                    = $madsonic::params::manage_user,
  $home                           = $madsonic::params::home,
  $host                           = $madsonic::params::host,
  $port                           = $madsonic::params::port,
  $https_port                     = $madsonic::params::https_port,
  $context_path                   = $madsonic::params::context_path,
  $init_memory                    = $madsonic::params::init_memory,
  $max_memory                     = $madsonic::params::max_memory,
  $pidfile                        = $madsonic::params::pidfile,
  $default_music_folder           = $madsonic::params::default_music_folder,
  $default_upload_folder          = $madsonic::params::default_upload_folder,
  $default_podcast_folder         = $madsonic::params::default_podcast_folder,
  $default_playlist_import_folder = $madsonic::params::default_playlist_import_folder,
  $default_playlist_export_folder = $madsonic::params::default_playlist_export_folder,
  $default_playlist_backup_folder = $madsonic::params::default_playlist_backup_folder,
  $default_timezone               = $madsonic::params::default_timezone,
) inherits madsonic::params {

  validate_bool($manage_user)
  validate_integer($port)

  class { 'madsonic::install': } ->
  class { 'madsonic::config': } ~>
  class { 'madsonic::service': } ->
  Class['madsonic']
}
