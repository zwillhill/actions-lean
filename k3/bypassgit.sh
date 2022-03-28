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
git clone --depth=1 https://github.com/zwillhill/k3screenctrl_build.git package/lwz322/k3screenctrl
# Add luci-app-k3screenctrl
git clone --depth=1 https://github.com/lwz322/luci-app-k3screenctrl.git package/lwz322/luci-app-k3screenctrl
#============================================================
# Replace luci-app-dnsfilter
# rm -rf package/lean/luci-app-dnsfilter
git clone --depth=1 https://github.com/kiddin9/luci-app-dnsfilter.git package/kiddin9/luci-app-dnsfilter
#============================================================
# Add luci-theme-darkmatter with moded one
svn co https://github.com/zwillhill/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/apollo-ng/luci-theme-darkmatter
#============================================================
# Add luci-app-vssr
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/jerrykuku/lua-maxminddb
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr.git package/jerrykuku/luci-app-vssr
#============================================================
# Add luci-app-ssr-plus with depency
git clone https://github.com/fw876/helloworld package/fw876
#============================================================
# Add luci-app-bypass
git clone --depth=1 https://github.com/kiddin9/openwrt-bypass.git package/kiddin9/openwrt-bypass
#============================================================
# Add passwall with depency
# git clone https://github.com/xiaorouji/openwrt-passwall package/xiaorouji/openwrt-passwall
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/kenzok8/openwrt-passwall
git clone --depth=1 https://github.com/kenzok8/small-package package/kenzok8
rm -rf package/kenzok8/luci-theme-argon
#============================================================
# Add OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash package/vernesong
#============================================================
# Add luci-app-adguardhome
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/kenzok8/luci-app-adguardhome
#============================================================
git clone --depth=1 https://github.com/sypopo/luci-theme-argon-mc package/sypopo/luci-theme-argon-mc
rm -rf package/lean/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/jerrykuku/luci-app-argon-config
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon  package/jerrykuku/luci-theme-argon
