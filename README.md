A template for Catalyst 8000v in controller mode(cEdge/SDWAN mode) with support for config export and import.
Bootstrap configurations from vManage are also supported.

# Usage

The image used for testing is c8000v-universalk9.17.09.04.iso.

This process prerequisites that you have created a regular C8000v image according to the EVE-ng guide.

**1.** Copy the Catalyst 8000v folder to a new c8000vcm folder.
```
cd ~
cp -r /opt/unetlab/addons/qemu/c8000v-{version} /opt/unetlab/addons/qemu/c8000vcm-{version}
```

**2.** Clone the git repository and run `install.sh`.
```
git clone https://github.com/torbbang/eve-ng_c8000vcm c8000vcm
cd c8000vcm 
chmod +x install.sh
./install.sh
```

**3.** Copy the base config ISO into your new EVE-ng image directory from step 0.
```
cp config.iso /opt/unetlab/addons/qemu/c8000vcm-{version}
```

**4.** Fix permissions for the added files.
```
# /opt/unetlab/wrappers/unl_wrapper -a fixpermissions
```

**5.** Enjoy!

**NOTE:** 
Bootstrap configs are used to achieve loading of startup-config from EVE. The bootstrap process takes a minute to complete after boot. 
If you attempt to start using the CLI before this has completed you will be faced with a user exec prompt and be presented the message "authentication failure" if you attempt to enter privileged mode.
To get around this you simply wait a minute and enter "exit" to be presented with the regular login prompt.
If you wait until the node is "ready" per the EVE UI you will not face this issue.
