#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-atmaterial
uci set luci.main.mediaurlbase='/luci-static/atmaterial'

# Check file system during boot
uci set fstab.@global[0].check_fs=1
uci commit

# Disable opkg signature check
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf

# Disable IPV6 ula prefix
sed -i 's/^[^#].*option ula/#&/' /etc/config/network
# Add build date to index page
sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release 
sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release 
echo "DISTRIB_DESCRIPTION='OpenWrt '" >> /etc/openwrt_release 
export orig_version="$(cat "/etc/openwrt_release" | grep DISTRIB_DESCRIPTION | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} By Vip@test $(date +"%Y-%m-%d")/g" /etc/openwrt_release

exit 0
