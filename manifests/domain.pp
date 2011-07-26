define libvirt::domain ($uuid, $mem='524288', $vcpus='1', $disk_type='file', $disk_source, $mac, $os_variant='') {
  $template = $os_variant ? {
    win2k8  => 'libvirt/domain-win2k8.xml.erb',
    default => 'libvirt/domain.xml.erb',
  }

  file { "/etc/libvirt/qemu/${name}.xml":
    content => template($template),
    notify  => Exec["virsh-define-${name}"],
  }

  exec { "virsh-define-${name}":
    command     => "/usr/bin/virsh define /etc/libvirt/qemu/${name}.xml",
    refreshonly => true,
  }
}
