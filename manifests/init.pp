class drush {

	include drush::params

    package {['git', 'php5-cli', 'php-pear'] :
        ensure => present,
    }

    package { 'Console_Table':
        ensure   => present,
        provider => pear,
        require  => Package['php-pear'],
    }

    exec { 'fetch-drush':
        cwd     => '/tmp',
        command => "/usr/bin/git clone --branch $drush::params::branch_name http://git.drupal.org/project/drush.git",
        creates => '/tmp/drush',
        require => Package['php5-cli', 'php-pear', 'Console_Table', 'git'], 
    }

    file { '/usr/local/lib/drush':
        ensure  => directory,
        recurse => true,
        purge   => true,
        source  => '/tmp/drush',
        require => Exec['fetch-drush'],
    }

    file { '/usr/local/bin/drush':
        ensure  => '/usr/local/lib/drush/drush',
        require => File['/usr/local/lib/drush'],
    }
}
