#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Disable opkg signature check
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf

# Add build date to index page
sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release 
sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release 
echo "DISTRIB_DESCRIPTION='OpenWrt '" >> /etc/openwrt_release 
export orig_version="$(cat "/etc/openwrt_release" | grep DISTRIB_DESCRIPTION | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} By Vip@master $(date +"%Y-%m-%d")/g" /etc/openwrt_release

# Add execute permission for ipv6-helper
chmod +x /bin/ipv6-helper

uci -q batch <<-EOF
	set system.@system[0].timezone='CST-8'
	set system.@system[0].zonename='Asia/Shanghai'
	delete system.ntp.server
	add_list system.ntp.server='time1.cloud.tencent.com'
	add_list system.ntp.server='ntp1.aliyun.com'
	add_list system.ntp.server='ntp.ntsc.ac.cn'
	add_list system.ntp.server='cn.ntp.org.cn'
EOF
uci commit system

exit 0
