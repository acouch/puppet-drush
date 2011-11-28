# puppet-drush

This puppet module allows the installation of drush from the git repository at drupalcode.org. At present it pulls the most recent release of drush at the time of writing, however this will be converted to a more generic option soon.

## Usage

It can be included via:

    include drush

The particular branch of Drush which is required is set in the $branch_name variable in drush::params.

## Notes

Thanks to the <a href="https://gist.github.com/305778">Pear provider gist</a> from <a href="https://github.com/jakemcgraw">jakemcgraw</a>.

Additional thanks to eric0, gniks and nate_h from the #puppet irc channel.
