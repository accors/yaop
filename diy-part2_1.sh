#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate
#Modify default name
sed -i 's/R21.1.18/R21.1.18 Compiled by accors for HanHan/g' package/lean/default-settings/files/zzz-default-settings
#Modify hostname
sed -i 's/OpenWrt/HanHanWrt/g' package/base-files/files/bin/config_generate
#Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#Modify default firewall
sed -i 's/option forward		REJECT/option forward		ACCEPT/g' package/network/config/firewall/files/firewall.config
#Modify Makefile for Bypass
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
