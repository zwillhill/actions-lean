# actions-lean
 - Base on [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) and use PHICOMM K3 Profile  
 - Use [P3TERX's Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
*** 
 ### Stable: 
##### 1. remove default Applications:
[-] luci-app-nlbwmon  
[-] luci-app-unblockmusic  

##### 2. add default Applications:
[+] luci-app-guest-wifi   
[+] luci-app-mwan3helper  
[+] luci-app-statistics  
[+] luci-app-usb-printer  
[+] luci-app-wifischedule  

##### 3. add default Utilities:
[+] collectd  
[+] collectd-mod-thermal  

##### 4. add custom theme:
[+] [luci-theme-darkmatter](https://github.com/apollo-ng/luci-theme-darkmatter)   

##### 5. stable custom Applications:
[+] [luci-app-bypass](https://github.com/garypang13/luci-app-bypass)  
[+] [luci-app-dnsfilter](https://github.com/garypang13/luci-app-dnsfilter)  
***
### Test:
##### 1. remove default Applications:
[-] none

##### 2. add default Applications:
[+] luci-app-guest-wifi   
[+] luci-app-mwan3helper  
[+] luci-app-statistics  
[+] luci-app-usb-printer  
[+] luci-app-wifischedule  

##### 3. add default Utilities:
[+] collectd  
[+] collectd-mod-thermal  
[+] lm-sensors:x:(not works on K3)  
[+] lm-sensors-detect:x:(not works on K3)  

##### 4. add custom theme:
[+] [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)  
[+] [luci-theme-darkmatter](https://github.com/apollo-ng/luci-theme-darkmatter)    

##### 5. test custom Applications:
[+] [luci-app-adblock-plus](https://github.com/small-5/luci-app-adblock-plus):white_check_mark:(Third party rules may cause problem)  
[+] [luci-app-adguardhome](https://github.com/rufengsuixing/luci-app-adguardhome):negative_squared_cross_mark:(Template function is not working, need to config adguardhome manually)  
[+] [luci-app-advanced](https://github.com/sirpdboy/luci-app-advanced):heavy_check_mark:  
[+] [luci-app-argon-config](https://github.com/jerrykuku/luci-app-argon-config):heavy_check_mark:  
[+] [luci-app-bypass](https://github.com/garypang13/luci-app-bypass):heavy_check_mark:   
[+] [luci-app-cpu-status](https://github.com/gSpotx2f/luci-app-cpu-status):x:(not works on K3)  
[+] [luci-app-dnsfilter](https://github.com/garypang13/luci-app-dnsfilter):white_check_mark:(Third party rules may cause problem)  
[+] [luci-app-k3screenctrl](https://github.com/lwz322/luci-app-k3screenctrl):white_check_mark:(Weather function may cause problem)  
[+] [luci-app-openclash](https://github.com/vernesong/OpenClash):white_check_mark:(not support vless for now)  
[+] [luci-app-passwall](https://github.com/xiaorouji/openwrt-passwall):heavy_check_mark:  
[+] [luci-app-serverchan](https://github.com/tty228/luci-app-serverchan):heavy_check_mark:  
[+] [luci-app-ssr-plus](https://github.com/fw876/helloworld):heavy_check_mark:  
[+] [luci-app-temp-status](https://github.com/gSpotx2f/luci-app-temp-status):x:(not works on K3)  
[+] [luci-app-vssr](https://github.com/jerrykuku/luci-app-vssr):heavy_check_mark:   
*** 
### Thanks:
##### Firmware:  
[coolsnowwolf](https://github.com/coolsnowwolf)  
##### Actions-OpenWrt:
[P3TERX](https://github.com/P3TERX/)  
##### Custom Themes:  
[apollo-ng](https://github.com/apollo-ng)  
[jerrykuku](https://github.com/jerrykuku)   
##### Custom Applications:  
[garypang13](https://github.com/garypang13)  
[gSpotx2f](https://github.com/gSpotx2f)  
[jerrykuku](https://github.com/jerrykuku)   
[lwz322](https://github.com/lwz322)  
[rufengsuixing](https://github.com/rufengsuixing)  
[small-5](https://github.com/small-5)  
[sirpdboy](https://github.com/sirpdboy)  
[tty228](https://github.com/tty228)  
[vernesong](https://github.com/vernesong)  
