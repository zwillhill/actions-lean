#!/bin/bash
#
# Lean K3 Stable Git.sh
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
############################

# Replace k3screenctrl
rm -rf package/lean/k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/lwz322/k3screenctrl
# Add luci-app-k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lwz322/luci-app-k3screenctrl

# Replace luci-app-dnsfilter
#git clone https://github.com/garypang13/luci-app-dnsfilter.git package/garypang13/luci-app-dnsfilter

# Add luci-theme-darkmatter with moded one
svn co https://github.com/zwillhill/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/apollo-ng/luci-theme-darkmatter

# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/jerrykuku/luci-app-vssr

# Add some depends
git clone https://github.com/xiaorouji/openwrt-passwall package/xiaorouji/openwrt-passwall
