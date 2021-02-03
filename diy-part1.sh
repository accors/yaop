#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# Modify packages
sed -i 's/shadowsocksr-libev-alt/shadowsocksr-libev-ssr-redir/g' package/*/*/Makefile
sed -i 's/shadowsocksr-libev-server/shadowsocksr-libev-ssr-server/g' package/*/*/Makefile
#Add useful softwares
cd package/lean
git clone https://github.com/XiaYi1002/luci-app-e-wool
git clone https://github.com/lisaac/luci-app-dockerman
git clone https://github.com/garypang13/luci-app-bypass
cd
cd package
git clone https://github.com/kenzok8/small
cd
#Overclock RK3328 to 1608MHz
wget -P openwrt/target/linux/rockchip/patches-5.4 https://raw.githubusercontent.com/QiuSimons/R2S-R4S-X86-OpenWrt/master/PATCH/new/main/999-unlock-1608mhz-rk3328.patch
