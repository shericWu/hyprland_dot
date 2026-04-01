# Tips
## Virsh
### Virsh default network failed
- Reason: Virsh using wrong firewall backend
- Fix: Edit `/etc/libvirt/network.conf`
    - Use correct backend
    - ```
      firewall_backend = "iptables"
      ```
## TLDR
### TLDR auto completion error for zsh
- ```
   (eval):7138: parse error near `(('
   _describe:compdescribe:122: invalid argument: _a_11
   _describe:compdescribe:129: no parsed state
  ``` 
- Reason: There are commands `((`, `[[`, `}` in `python -m tldr --list`
- Fix: Edit `/usr/share/zsh/site-functions/_tldr`
    - Escape problematic characters with `sed`
    - ```
      _describe 'command' "($("/usr/bin/python" -m tldr --list | sed 's/[][(){}]/\\&/g'))"`
      ```
