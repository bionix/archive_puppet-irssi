# Puppet class 'irssi::config'
#
class irssi::config (
  $irssi_homefolder       = '',
  $irssi_own_config_path  = '',
) {
  file { "$irssi_homefolder":
    ensure => directory,
    before => File["$irssi_homefolder/.irssi"]
  }
  file { "$irssi_homefolder/.irssi":
    ensure    => directory,
    source    => $irssi_own_config_path,
    recurse   => true,
    force     => true,
    purge     => true
  }
  File["$irssi_homefolder"] ~> File["$irssi_homefolder/.irssi"]
}