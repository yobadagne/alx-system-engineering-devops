#Sky is the limit
exec {'upgrade':
  provider => shell,
  command  => 'sudo sed -i "s/15/4096/g" /etc/default/nginx',
  before   => Exec['restart'],
}

exec {'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
