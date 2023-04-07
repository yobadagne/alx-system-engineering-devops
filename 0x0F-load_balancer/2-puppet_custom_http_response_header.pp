# Task 2. Add a custom HTTP header with Puppet
exec { 'exec_1':
  command => 'sudo apt-get update -y',
  path    => ['/usr/bin', '/bin'],
  returns => [0,1],
  before   => Exec['exec_2']
}

exec { 'exec_2':
  require => Exec['exec_1'],
  command => 'sudo apt-get install nginx -y',
  path    => ['/usr/bin', '/bin'],
  returns => [0,1],
  before   => Exec['exec_3']
}

exec { 'exec_3':
  require => Exec['exec_2'],
  command => 'sudo sed -i "53i \\\t\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
  path    => ['/usr/bin', '/bin'],
  returns => [0,1],
  before   => Exec['exec_4']
}

exec { 'exec_4':
  require => Exec['exec_3'],
  command => 'sudo service nginx restart',
  path    => ['/usr/bin', '/bin', '/usr/sbin'],
  returns => [0,1]
}
