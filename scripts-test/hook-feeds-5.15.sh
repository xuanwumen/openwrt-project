#!/bin/bash
#=================================================
# File name: hook-feeds.sh
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Svn checkout packages from immortalwrt's repository
pushd customfeeds
mkdir temp
git clone --depth=1 https://github.com/immortalwrt/packages -b openwrt-18.06 temp/packages
git clone --depth=1 https://github.com/immortalwrt/luci -b openwrt-18.06-k5.4 temp/luci

# Add luci-app-adguardhome
rm -rf packages/net/adguardhome
cp -r temp/luci/applications/luci-app-adguardhome luci/applications/luci-app-adguardhome
cp -r temp/packages/net/adguardhome packages/net/adguardhome
# cp -r temp/packages/lang/node-yarn packages/lang/node-yarn
# cp -r temp/packages/devel/packr packages/devel/packr

# Add luci-app-eqos
cp -r temp/luci/applications/luci-app-eqos luci/applications/luci-app-eqos

# Add luci-app-syncthing
cp -r temp/luci/applications/luci-app-syncthing luci/applications/luci-app-syncthing

# Add luci-app-ipsec-vpnserver-manyusers
cp -r temp/luci/applications/luci-app-ipsec-vpnserver-manyusers luci/applications/luci-app-ipsec-vpnserver-manyusers

# Add  themes
rm -rf luci/themes/luci-theme-argon
git clone  --depth=1 https://github.com/kiddin9/luci-theme-edge -b 18.06 luci/themes/luci-theme-edge
cp -r temp/luci/themes/luci-theme-argonv3 luci/themes/luci-theme-argonv3
cp -r temp/luci/applications/luci-app-argon-config luci/applications/luci-app-argon-config
cp -r temp/luci/themes/luci-theme-atmaterial luci/themes/luci-theme-atmaterial
cp -r temp/luci/themes/luci-theme-Butterfly luci/themes/luci-theme-Butterfly
cp -r temp/luci/themes/luci-theme-darkmatter luci/themes/luci-theme-darkmatter
cp -r temp/luci/themes/luci-theme-infinityfreedom luci/themes/luci-theme-infinityfreedom
cp -r temp/luci/themes/luci-theme-opentomato luci/themes/luci-theme-opentomato
cp -r temp/luci/themes/luci-theme-opentomcat luci/themes/luci-theme-opentomcat
cp -r temp/luci/themes/luci-theme-rosy luci/themes/luci-theme-rosy

# Add luci-app-gowebdav
cp -r temp/luci/applications/luci-app-gowebdav luci/applications/luci-app-gowebdav
cp -r temp/packages/net/gowebdav packages/net/gowebdav

# Add netdata
rm -rf packages/admin/netdata
rm -rf luci/applications/luci-app-netdata
cp -r temp/luci/applications/luci-app-netdata luci/applications/luci-app-netdata
cp -r temp/packages/admin/netdata packages/admin/netdata

# Add luci-app-smartdns
cp -r temp/luci/applications/luci-app-smartdns luci/applications/luci-app-smartdns
cp -r temp/packages/net/smartdns packages/net/smartdns

# Add tmate
cp -r temp/packages/net/tmate packages/net/tmate
cp -r temp/packages/libs/msgpack-c packages/libs/msgpack-c

# Add gotop
cp -r temp/packages/admin/gotop packages/admin/gotop

# Add luci-app-xunlei
cp -r temp/luci/applications/luci-app-xunlei luci/applications/luci-app-xunlei

# Add luci-lib-ipkg
cp -r temp/luci/libs/luci-lib-ipkg luci/libs/luci-lib-ipkg

# Add minieap
cp -r temp/packages/net/minieap packages/net/minieap
cp -r temp/luci/protocols/luci-proto-minieap luci/protocols/luci-proto-minieap

rm -rf temp
popd

# Set to local feeds
pushd customfeeds/packages
export packages_feed="$(pwd)"
popd
pushd customfeeds/luci
export luci_feed="$(pwd)"
popd
sed -i '/src-git packages/d' feeds.conf.default
echo "src-link packages $packages_feed" >> feeds.conf.default
sed -i '/src-git luci/d' feeds.conf.default
echo "src-link luci $luci_feed" >> feeds.conf.default

# Update feeds

# sed -i 's/PATCHVER:=5.10/PATCHVER:=5.15/g' target/linux/x86/Makefile

# sed -i 's/PATCHVER:=5.4/PATCHVER:=5.10/g' target/linux/rockchip/Makefile
./scripts/feeds update -a
