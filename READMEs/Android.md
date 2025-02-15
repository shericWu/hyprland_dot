### Virtual machine
```sh
$ sudo pacman -S qemu-full virt-manager virt-viewer edk2-ovmf dnsmasq vde2 libguestfs virglrenderer
$ sudo pacman -S dmidecode
$ sudo systemctl enable libvirtd.service
$ sudo usermod -a -G libvirt $USER
$ sudo usermod -a -G kvm $USER
```

### Reference
> https://ivonblog.com/posts/archlinux-qemu-virt-manager/  
> 
