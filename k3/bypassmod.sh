#!/bin/bash
#
# Lean K3 bypass Mod.sh
#

# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#============================================================
# Modify files permission
# chmod -R 755 files
#============================================================
# Modify default IP in zzz
sed -i '/exit/i\uci set network.lan.ipaddr=192.168.7.1\nuci commit network\n' package/lean/default-settings/files/zzz-default-settings
#============================================================
# Modify root password in zzz
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$sQOZeTHV$zt.gXuE2nikxNjWzEIhjo0:18327:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings
#============================================================
# Change wifi password in zzz
sed -i '/exit/i\uci set wireless.@wifi-iface[0].encryption='psk2'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set wireless.@wifi-iface[0].key='73555071'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set wireless.@wifi-iface[1].encryption='psk2'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set wireless.@wifi-iface[1].key='73555071'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\nuci commit wireless\n' package/lean/default-settings/files/zzz-default-settings
#============================================================
# Disable dhcpipv6 in zzz
sed -i '/exit/i\uci set dhcp.@dnsmasq[0].filter_aaaa=1\nuci commit dhcp\n' package/lean/default-settings/files/zzz-default-settings
#============================================================
# Only compile K3
sed -i 's|^TARGET_|#TARGET_|g; s|#TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
# Change k3screen depend
sed -i 's/k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile 
#============================================================
# Display temperature on index
sed -i "/<tr><td width=\"33%\"><%:CPU usage (%)%>/a \ \t\t<tr><td width=\"33%\"><%:CPU Temperature %>（℃）</td><td><%=luci.sys.exec(\"sed 's/../&./g' /sys/class/thermal/thermal_zone0/temp|cut -c1-5\")%>℃</td></tr>"  feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
#============================================================
# Modify banner
# sed -i '1,5d' package/base-files/files/etc/banner
# sed -i '1i\  _______                     ________        __'  package/base-files/files/etc/banner
# sed -i '2i\ |   |   |.---.-.-----.-----.|  |  |  |.----.|  |_ '  package/base-files/files/etc/banner
# sed -i '3i\ |       ||  _  |     |-- __||  |  |  ||   _||   _|'  package/base-files/files/etc/banner
# sed -i '4i\ |___|___||___._|__|__|_____||________||__|  |____|'  package/base-files/files/etc/banner
#============================================================
# Add rule to garypang luci-app-dnsfilter
sed -i '/DynamicList/a\o:value("https:\/\/gitee.com\/zwillhill\/myhosts\/raw\/master\/myhosts","Hanz-hosts")' package/kiddin9/luci-app-dnsfilter/luasrc/model/cbi/dnsfilter/base.lua
#============================================================
# Modify bypass blacklist
sed -i '/whrq/d' package/kiddin9/openwrt-bypass/luci-app-bypass/root/etc/bypass/black.list
#============================================================
# 替换K3的无线驱动为asus-dhd24
# wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.asus-dhd24 -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin

