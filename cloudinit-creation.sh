# remove existing image in case last execution did not complete successfully
IMAGE=noble-server-cloudimg-amd64.img
PROXMOX=10.0.0.254
rm $IMAGE
wget https://cloud-images.ubuntu.com/noble/current/$IMAGE
sudo virt-customize -a $IMAGE --install qemu-guest-agent
sudo virt-customize -a $IMAGE --install nfs-common
sudo virt-customize -a $IMAGE --install wireguard-tools
sudo virt-customize -a $IMAGE --install samba-client
sudo virt-customize -a $IMAGE --install cifs-utils
sudo virt-customize -a $IMAGE --run-command 'echo "ubuntu  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu'
sudo sudo virt-sysprep -a $IMAGE --operations machine-id
scp $IMAGE root@$PROXMOX:~/
ssh -t root@$PROXMOX "~/cloudinit2.sh"
#sudo qm create 9001 --name "noble-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
#sudo qm importdisk 9001 $IMAGE vm2
#sudo qm set 9001 --scsihw virtio-scsi-pci --scsi0 vm2:vm-9001-disk-0
#sudo qm set 9001 --boot c --bootdisk scsi0
#sudo qm set 9001 --ide2 vm2:cloudinit
#sudo qm set 9001 --serial0 socket --vga serial0
#sudo qm set 9001 --agent enabled=1
#sudo qm template 9001
#rm $IMAGE
