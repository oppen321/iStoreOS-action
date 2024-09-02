#!/bin/bash

# 修改默认IP
#sed -i 's/192.168.100.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 更改 Argon 主题背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg feeds/third/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing-box*}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# 科学上网插件
git_sparse_clone dev https://github.com/vernesong/OpenClash luci-app-openclash

# AdGuardHome
git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome

# Modns
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# iStoreOS 官方插件库
git clone --depth=1 -b main https://github.com/linkease/istore-packages package/istore-packages
git clone --depth=1 -b dev https://github.com/jjm2473/luci-app-diskman package/diskman
git clone --depth=1 -b dev4 https://github.com/jjm2473/OpenAppFilter package/oaf
git clone --depth=1 -b master https://github.com/linkease/nas-packages package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci package/nas-packages-luci
git clone --depth=1 -b main https://github.com/jjm2473/openwrt-apps package/openwrt-apps

# 更换golong 1.23
git clone https://github.com/oppen321/golang feeds/packages/lang/golang

./scripts/feeds update -a
./scripts/feeds install -a
