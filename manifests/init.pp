# Class 'irssi'
#
# A puppet module for irssi

class irssi (
  $ensure                 = 'present',
  $irssi_plugins          = '',
  $irssi_homefolder       = '',
  $irssi_own_config_path  = 'puppet:///modules/irssi/config',
) {
  case $::operatingsystem {
    RedHat,CentOS,Fedora,Debian,Ubuntu: {
      class { 'irssi::install':
        ensure        => $ensure,
        irssi_plugins => $irssi_plugins
      }
      class { 'irssi::config':
        irssi_homefolder      => $irssi_homefolder,
        irssi_own_config_path => $irssi_own_config_path
      }
    }
    default: { notice "Unsupported OS ${::operatingsystem}" }
  }
}