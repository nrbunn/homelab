#need to add reboot to plex server after nivivda install

#need ssh key from plex host
#need to ssh register key in github


#make sure plex server has access in nas to mount to media drive.
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ansible-galaxy collection install ansible.posix

#move hosts file to home
#cp ../files/hosts ~/hosts
#move ansible config to home
#cp ../files/ansible.cfg ~/ansible.cfg

git clone https://github.com/k3s-io/k3s-ansible.git

##you might need to do something with default storage class local for k3s