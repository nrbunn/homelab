#make sure plex server has access in nas to mount to media drive.
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ansible-galaxy collection install ansible.posix

cp ../files/hosts ~/hosts