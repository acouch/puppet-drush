# puppet-drush

Install drush and console_table.

## Usage

Prerequisites for use include the need to set

    pluginsync=true

Within your puppet.conf. Once this has been set, the drush module can be included as normal, for example:

    include drush

The particular branch of Drush which is required is set in the $branch variable.

## Notes

Initially forked from https://github.com/jvc26/puppet-drush
