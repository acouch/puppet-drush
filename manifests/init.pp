class drush ($branch = "7.x-5.x") {

    package { 'Console_Table':
        ensure   => present,
        provider => pear,
        require  => Package['php53'],
    }

    exec { 'fetch-drush':
        cwd     => '/usr/local/lib',
        command => "/usr/bin/git clone --branch $branch http://git.drupal.org/project/drush.git",
        # Won't run if exists: http://www.puppetcookbook.com/posts/run-exec-if-file-absent.html.
        creates => '/usr/local/lib/drush',
        require => Package['php53', 'Console_Table'], 
    }
     
    file { '/usr/local/bin/drush':
        ensure  => link, 
        target => '/usr/local/lib/drush/drush',
    }
}
