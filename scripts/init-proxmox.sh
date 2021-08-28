wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

####################### Ubuntu 20.04 LTS Template ####################################
# Create a VM
qm create 9000 --name ubuntu20-template --memory 2048 --net0 virtio,bridge=vmbr0
# Import the disk in qcow2 format (as unused disk) 
qm importdisk 9000 focal-server-cloudimg-amd64.img local-lvm
# Attach the disk to the vm using VirtIO SCSI
qm set 9000 --scsihw virtio-scsi-pci --sata0 local-lvm:vm-9000-disk-0
# Important settings
qm set 9000 --sata2 local-lvm:cloudinit --boot c --bootdisk sata0 --serial0 socket --vga serial0
# The initial disk is only 2GB, thus we make it larger
qm resize 9000 sata0 +10G
# Using a  dhcp server on vmbr1 or use static IP
qm set 9000 --ipconfig0 ip=dhcp
# ssh key
qm set 9000 --sshkey ~/.ssh/id_rsa.pub
# create template
qm template 9000

####################### Ubuntu 20.04 LTS GPU Passthrough Template ####################################
# Create a VM
qm create 9001 --name ubuntu20-gpu-template --bios ovmf --machine q35 --memory 2048 --net0 virtio,bridge=vmbr0
# Import the disk in qcow2 format (as unused disk) 
qm importdisk 9001 focal-server-cloudimg-amd64.img local-lvm
# Attach the disk to the vm using VirtIO SCSI
qm set 9001 --scsihw virtio-scsi-pci --sata0 local-lvm:vm-9001-disk-0
# Create EFI Disk
qm set 9001 -efidisk0 local-lvm:1
# PCIE passthrough(address might need to change)
qm set 9001 -hostpci0 0000:06:00.0,pcie=on,x-vga=on
# Important settings
qm set 9001 --sata2 local-lvm:cloudinit --boot c --bootdisk sata0 --serial0 socket --vga serial0
# The initial disk is only 2GB, thus we make it larger
qm resize 9001 sata0 +10G
# Using a  dhcp server on vmbr1 or use static IP
qm set 9001 --ipconfig0 ip=dhcp
# ssh key
qm set 9001 --sshkey ~/.ssh/id_rsa.pub
# create template
qm template 9001

#rm -v focal-server-cloudimg-amd64.img