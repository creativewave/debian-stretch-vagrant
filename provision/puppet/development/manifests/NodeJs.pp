# NodeJS.pp
class cw_nodejs {

  # Add/update NodeJS GNUPG key
  exec { 'nodejs-gnupg-key':
    command => 'wget -qO - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -',
    creates => '/etc/apt/sources.list.d/nodejs.list',
    path    => '/usr/bin',
  }

  # Add NodeJS package repository
  # Note: https (official url scheme) requires apt-transport-https
  file { '/etc/apt/sources.list.d/nodejs.list':
    content => 'deb http://deb.nodesource.com/node_16.x/ buster main',
    before  => Exec['update-package-list'],
  }

  # Install NodeJS
  package { 'nodejs': }
}
