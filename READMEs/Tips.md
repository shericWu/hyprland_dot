# Tips
### Virsh default network failed
- Reason: virsh using wrong firewall backend
- Fix: Edit `/etc/libvirt/network.conf`
    - ```
      firewall_backend = "iptables"
      ```
