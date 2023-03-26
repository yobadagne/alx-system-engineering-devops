# Using Puppet, install puppet-lint.
package { 'puppet-lint':
  ensure   => '3.3.0',
  provider => 'gem',
}
