class drush {

  package { "php5-cli":
  	ensure => installed,
  }

  vcsrepo { "/var/lib/drush":
    ensure => present,
    provider => git,
    source => "https://github.com/drush-ops/drush.git",
    revision => 'd5d09f5104b46c97e4eca50c69b8f1674ab06050',
  }

  file { "/var/lib/drush/lib/Console_Table-1.1.3":
    require => Vcsrepo["/var/lib/drush"],
    recurse => true,
    source => "puppet:///modules/drush/Console_Table-1.1.3",
  }

  file { "/usr/local/bin/drush":
    require => [Vcsrepo["/var/lib/drush"], File["/var/lib/drush/lib/Console_Table-1.1.3"]],
    ensure => link,
    target => "/var/lib/drush/drush",
    owner => 'root',
    group => 'root',
    mode => 755,
  }

  file { "/usr/share/drush":
    ensure => directory,
    owner => root,
    group => root,
    mode => 755,
  }

  file {  "/usr/share/drush/commands":
    require => File['/usr/share/drush'],
    ensure => directory,
    owner => root,
    group => root,
    mode => 755,
  }

  file { '/usr/local/bin/drupal-perms':
    source => "puppet:///modules/drush/drupal-perms",
    owner => 'root',
    group => 'root',
    mode => 755,
  }

}
