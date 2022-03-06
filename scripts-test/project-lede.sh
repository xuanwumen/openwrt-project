#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# add poweroffdevice
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/downloads.openwrt.org/d' zzz-default-settings
sed -i '/openwrt_luci/d' zzz-default-settings
sed -i "/V4UetPzk$CYXluq4wUazHjmCDBCqXF/d" zzz-default-settings
popd

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../lean/luci-app-kodexplorer
rm -rf openwrt-package/luci-app-https-dns-proxy
rm -rf openwrt-package/luci-app-syncthing
rm -rf openwrt-package/luci-app-ipsec-server
# Add luci-app-passwall
git clone --depth=1 https://github.com/NxQAQVQ/luci-app-passwall

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-app-bypass
git clone --depth=1 https://github.com/garypang13/luci-app-bypass

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
# git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
# git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-diskman
# git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
# mkdir parted
# cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-smartinfo
svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo
svn co https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng/trunk/luci-app-homeredirect
svn co https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng/trunk/homeredirect
svn co https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng/trunk/luci-app-aliddns
svn co https://github.com/kenzok8/small-package/trunk/luci-app-mosdns

# Add luci-app-dnsfilter
git clone --depth=1 https://github.com/kiddin9/luci-app-dnsfilter

# Add subconverter
# git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter
git clone --depth=1 https://github.com/thinktip/luci-theme-neobird

# Add luci-app-ttnode
git clone --depth=1 https://github.com/jerrykuku/luci-app-ttnode

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# add istore
svn co https://github.com/linkease/istore/trunk/luci/luci-app-store
svn co https://github.com/linkease/istore-ui/trunk/app-store-ui

# Add apk (Apk Packages Manager)
# svn co https://github.com/openwrt/packages/trunk/utils/apk

# Add luci-app-ddnsto luci-app-linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
popd

# Add package ddnsto linkease
pushd package/network/services
svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto
svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease
popd

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
