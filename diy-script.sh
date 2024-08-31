#!/bin/bash

# 修改默认IP
#sed -i 's/192.168.100.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

git clone --depth=1 istore-packages https://github.com/linkease/istore-packages.git;main package/istore-packages
git clone --depth=1 https://github.com/jjm2473/luci-app-diskman.git;dev package/diskman
git clone --depth=1 https://github.com/jjm2473/OpenAppFilter.git;dev4 package/oaf
git clone --depth=1 https://github.com/linkease/nas-packages.git;master package/nas-packages
git clone --depth=1 https://github.com/linkease/nas-packages-luci.git;main package/nas-packages-luci
git clone --depth=1 https://github.com/jjm2473/openwrt-apps.git;main package/openwrt-apps

./scripts/feeds update -a
./scripts/feeds install -a
