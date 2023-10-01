A template for Catalyst 8000v in controller mode(cEdge/SDWAN mode) with support for config export and import.
Bootstrap configurations from vManage are also supported.

# Installation

The image used for testing is c8000v-universalk9.17.09.04.iso.

0. Create the boot image(virtioa.qcow2) according to [the c8000v guide at the eve-ng website](https://www.eve-ng.net/index.php/documentation/howtos/catalyst-8000v/).
The folder should however be named `/opt/unetlab/addons/qemu/c8000vcm-{version}` instead of `/opt/unetlab/addons/qemu/c8000v-{version}`.

1. Login to your eve server as root

2. Fetch this git repository and run `install.sh`
```
root@eve-ng:~# cd ~
root@eve-ng:~# git clone https://github.com/torbbang/eve-ng_c8000vcm c8000vcm
root@eve-ng:~# cd c8000vcm
root@eve-ng:~/c8000vcm# chmod +x installer.sh src/createConfigIso.sh
root@eve-ng:~/c8000vcm# ./installer.sh
```

3. Copy config.iso to the same EVE-ng image path as used in step 0.
```
root@eve-ng:~# cd ~/c8000vcm/
root@eve-ng:~/c8000vcm# cp config.iso /opt/unetlab/addons/qemu/c8000vcm-{version}/
```

4. Fix permissions for the files in the image folder.
```
/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
```

**NOTE:** 
Bootstrap configs are used to achieve loading of startup-config from EVE. The bootstrap process takes a minute to complete after boot. 
If you attempt to start using the CLI before this has completed you will be faced with a user exec prompt and be presented the message "authentication failure" if you attempt to enter privileged mode.
To get around this you simply wait a minute and enter "exit" to be presented with the regular login prompt.
If you wait until the node is "ready" per the EVE UI you will not face this issue.
