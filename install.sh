#!/bin/bash

# install.sh
#
# Installer script for EVE-ng c8000v controller mode files
#
# @author Torbjørn Bang <hei@torbjorn.dev>
# @copyright 2023 Torbjørn Bang
# @license BSD-3-Clause https://github.com/torbbang/eve-ng_c8000vcm/blob/main/LICENSE

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit
fi

echo "Copying templates and scripts"
cp src/c8000vcm.yml /opt/unetlab/http/templates/intel/c8000vcm.yml
cp src/c8000vcm.yml /opt/unetlab/http/templates/amd/c8000vcm.yml
cp src/config_c8000vcm.py /opt/unetlab/config_scripts/config_c8000vcm.py
cp src/prep_c8000vcm.py /opt/unetlab/config_scripts/prep_c8000vcm.py


echo "Generating minimal config.iso"
/bin/bash src/createConfigIso.sh

echo "Done!"
