resource "proxmox_vm_qemu" "proxmox_vm_tools" {
  name              = "tools"
  target_node       = "pve"
  clone             = "ubuntu20-template"
  os_type           = "cloud-init"
  cores             = 1
  sockets           = "1"
  memory            = 2048
  define_connection_info = false
  bootdisk          = "sata0"
  ipconfig0         = "ip=dhcp"
  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
  sshkeys = <<EOF
    ${var.ssh_key}
  EOF  
}

resource "proxmox_vm_qemu" "proxmox_vm_k3s_master" {
  name              = "k3s-master"
  target_node       = "pve"
  clone             = "ubuntu20-template"
  os_type           = "cloud-init"
  cores             = 1
  sockets           = "1"
  memory            = 4096
  define_connection_info = false
  bootdisk          = "sata0"
  ipconfig0         = "ip=dhcp"
  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
  sshkeys = <<EOF
    ${var.ssh_key}
  EOF 
}

resource "proxmox_vm_qemu" "proxmox_vm_k3s_node_01" {
  name              = "k3s-node-01"
  target_node       = "pve"
  clone             = "ubuntu20-template"
  os_type           = "cloud-init"
  cores             = 1
  sockets           = "1"
  memory            = 4096
  define_connection_info = false
  bootdisk          = "sata0"
  ipconfig0         = "ip=dhcp"
  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
  sshkeys = <<EOF
    ${var.ssh_key}
  EOF 
}

resource "proxmox_vm_qemu" "proxmox_vm_k3s_node_02" {
  name              = "k3s-node-02"
  target_node       = "pve"
  clone             = "ubuntu20-template"
  os_type           = "cloud-init"
  cores             = 1
  sockets           = "1"
  memory            = 4096
  define_connection_info = false
  bootdisk          = "sata0"
  ipconfig0         = "ip=dhcp"
  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
  sshkeys = <<EOF
    ${var.ssh_key}
  EOF 
}

resource "proxmox_vm_qemu" "proxmox_vm_plex" {
  name              = "plex"
  target_node       = "pve"
  clone             = "ubuntu20-gpu-template"
  os_type           = "cloud-init"
  cores             = 1
  sockets           = "1"
  memory            = 2048
  define_connection_info = false
  bootdisk          = "sata0"
  ipconfig0         = "ip=dhcp"
  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
  sshkeys = <<EOF
    ${var.ssh_key}
  EOF 
}