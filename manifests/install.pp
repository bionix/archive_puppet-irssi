# Class 'irssi::install'
#
# This is a part of the puppet module 'irssi'
#
class irssi::install (
  $ensure = '',
  $irssi_plugins = '',
) {
  # install or uninstall basic package
  package { 'irssi':
    ensure => $ensure
  }
  # install or uninstall plugin packages
  if $irssi_plugins != '' {
    package { [ $irssi_plugins ]:
      ensure => $ensure
    }
  }
}