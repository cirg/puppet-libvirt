class libvirt {
  $packagelist = ['ifenslave-2.6', 'open-iscsi', 'libvirt-bin', 'qemu-kvm', 'virtinst', 'virt-top', 'kpartx']

  package { $packagelist:
    ensure => installed,
  }

  file { '/etc/default/libvirt-guests':
    source => 'puppet:///libvirt/libvirt-guests.default',
  }

  file { '/etc/init.d/libvirt-guests':
    source => 'puppet:///libvirt/libvirt-guests.init',
    mode   => '0755',
  }
}
