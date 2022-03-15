#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Mod zzz-default-settings
pushd package/emortal/default-settings/files
# sed -i '/immortalwrt_luci/d' zzz-default-settings
sed -i '/V4UetPzk$CYXluq4wUazHjmCDBCqXF/d' zzz-default-settings
sed -i '/banner/d' zzz-default-settings
# sed -i 's/auto/zh_cn/g' zzz-default-settings
popd

# change index
# pushd package/emortal/autocore/files/x86
# sed -i '/Source Code/,+2d' index.htm
# sed -i '727,729d' index.htm
# popd

# change index
# pushd feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status
# sed -i '713,715d' index.htm
# sed -i '/Source Code/,+2d' index.htm
# popd

# Clone community packages to package/community
# mkdir package/community
# pushd package/community

# Add luci-app-dnsfilter
# git clone --depth=1 https://github.com/garypang13/luci-app-dnsfilter

# Add luci-app-bypass
# git clone --depth=1 https://github.com/garypang13/luci-app-bypass
# git clone --depth=1 https://github.com/garypang13/smartdns-le

# Add luci-app-godproxy
# git clone --depth=1 https://github.com/project-lede/luci-app-godproxy

# Add luci-app-modeminfo
# git clone --depth=1 https://github.com/koshev-msk/luci-app-modeminfo

# Add luci-app-tcpdump
# git clone --depth=1 https://github.com/KFERMercer/luci-app-tcpdump

#Add luci-app-ttnode
# git clone --depth=1 https://github.com/jerrykuku/luci-app-ttnode

# Add luci-app-oaf
# git clone --depth=1 https://github.com/destan19/OpenAppFilter -b oaf-3.0.1

# Add luci-theme-argon_armygreen
# git clone --depth=1 https://github.com/XXKDB/luci-theme-argon_armygreen
# git clone --depth=1 https://github.com/kiddin9/luci-theme-edge
# popd

# Fix mt76 wireless driver
# pushd package/kernel/mt76
# sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
# popd

# Add luci-app-ddnsto luci-app-linkease
# svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto
# svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
# popd

# Add package ddnsto linkease
# pushd package/network/services
# svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto
# svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease
# popd

# Fix luci-app-aria2
# pushd feeds/luci/applications
# rm -rf luci-app-aria2
# svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-aria2
# popd

# fix dockerd
# pushd feeds/packages/utils
# rm -rf dockerd
# svn co https://github.com/immortalwrt/packages/trunk/utils/dockerd
# popd

# Rename hostname to OpenWrt
pushd package/base-files/files/bin
sed -i 's/ImmortalWrt/OpenWrt/g' config_generate
popd

# Fix SDK
sed -i '/$(SDK_BUILD_DIR)\/$(STAGING_SUBDIR_HOST)\/usr\/bin/d;/LICENSE/d' target/sdk/Makefile

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk

# version.mk
sed -i 's/ImmortalWrt/OpenWrt/g' include/version.mk

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
