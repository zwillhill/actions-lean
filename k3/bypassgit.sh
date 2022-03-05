#!/bin/bash
#
# Lean K3 bypass Git.sh
#

# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#============================================================
# Replace k3screenctrl
rm -rf package/lean/k3screenctrl
git clone https://github.com/zwillhill/k3screenctrl_build.git package/lwz322/k3screenctrl
# Add luci-app-k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lwz322/luci-app-k3screenctrl
#============================================================
# Replace luci-app-dnsfilter
rm -rf package/lean/luci-app-dnsfilter
git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/kiddin9/luci-app-dnsfilter
#============================================================
# Add luci-theme-darkmatter with moded one
svn co https://github.com/zwillhill/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/apollo-ng/luci-theme-darkmatter
#============================================================
# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/jerrykuku/luci-app-vssr

# Add luci-app-bypass
git clone https://github.com/kiddin9/openwrt-bypass.git package/kiddin9/openwrt-bypass

# Add some depends
git clone https://github.com/xiaorouji/openwrt-passwall package/xiaorouji/openwrt-passwall
#============================================================
# Add OpenClash
git clone https://github.com/vernesong/OpenClash package/vernesong
#============================================================
# Add luci-app-adguardhome
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/kenzok8/luci-app-adguardhome
#============================================================
# 替换K3的无线驱动为asus-dhd24
wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.asus-dhd24 -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
