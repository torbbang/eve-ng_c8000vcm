#!/bin/bash

# createConfigIso.sh
#
# Minimal config ISO generation script for c8000v
#
# @author Torbjørn Bang <hei@torbjorn.dev>
# @copyright 2023 Torbjørn Bang
# @license BSD-3-Clause https://github.com/torbbang/eve-ng_c8000vcm/blob/main/LICENSE

# Create minimal cloud init config to make router boot 
cat << EOF > ciscosdwan_cloud_init.cfg
Content-Type: multipart/mixed; boundary="==============u7fnxr6d=============="
MIME-Version: 1.0
--==============u7fnxr6d==============
#cloud-config
vinitparam:
 - uuid : C8K-00000000-0000-0000-0000-000000000000
 - otp : 00000000000000000000000000000000
 - vbond : 0.0.0.0
 - org : null
--==============u7fnxr6d==============
#cloud-boothook
system
hostname Router
username admin privilege 15 secret admin
username eveconfigscraper privilege 15 secret eveconfigscraper
aaa authentication enable default enable
aaa authentication login default local
aaa authorization console
aaa authorization exec default local
login on-success log
--==============u7fnxr6d==============--
EOF

# Generate iso file containing config file 
mkisofs -o config.iso -l --iso-level 2 ciscosdwan_cloud_init.cfg
rm ciscosdwan_cloud_init.cfg
