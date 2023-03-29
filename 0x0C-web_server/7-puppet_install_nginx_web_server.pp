# 6. Install Nginx web server (w/ Puppet)
exec { 'exec_1':
  command => 'sudo apt-get update -y',
  path    => ['/usr/bin', '/bin'],
  returns => [0,1]
}

exec { 'exec_2':
  require => Exec['exec_1'],
  command => 'sudo apt-get install nginx -y',
  path    => ['/usr/bin', '/bin'],
  returns => [0,1]
}

exec { 'exec_3':
  require => Exec['exec_2'],
  command => 'sudo echo "Hello World!" | sudo tee /var/www/html/index.html',
  path    => ['/usr/bin', '/bin'],
  returns => [0,1]
}

exec { 'exec_4':
  require     => Exec['exec_3'],
  environment => ['GG=https://tecnoayuda.co permanent'],
  command    => 'sudo sed -i "30i \\\trewrite ^/redirect_me $GG;" /etc/nginx/sites-available/default',
  path        => ['/usr/bin', '/bin'],
  returns     => [0,1]
}

exec { 'exec_5':
  require => Exec['exec_4'],
  command => 'sudo service nginx start',
  path    => ['/usr/bin', '/bin', '/usr/sbin'],
  returns => [0,1]
}
