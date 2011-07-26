define libvirt::pool ($pool_type='disk', $uuid, $host_name='', $device_path='', $target_path) {
  file { "/etc/libvirt/storage/${name}.xml":
    content => template('libvirt/pool.xml.erb'),
    notify  => Exec["virsh-pool-define-${name}"],
  }

  exec { "virsh-pool-define-${name}":
    command     => "/usr/bin/virsh pool-define /etc/libvirt/storage/${name}.xml",
    refreshonly => true,
  }
}
