#!/bin/bash

# 修改默认IP
#sed -i 's/192.168.100.1/10.0.0.1/g' package/base-files/files/bin/config_generate

echo 'src-git third_party https://github.com/linkease/istore-packages.git;main' >>feeds.conf.default
echo 'src-git diskman https://github.com/jjm2473/luci-app-diskman.git;dev' >>feeds.conf.default
echo 'src-git oaf https://github.com/jjm2473/OpenAppFilter.git;dev4' >>feeds.conf.default
echo 'src-git linkease_nas https://github.com/linkease/nas-packages.git;master' >>feeds.conf.default
echo 'src-git linkease_nas_luci https://github.com/linkease/nas-packages-luci.git;main' >>feeds.conf.default
echo 'src-git jjm2473_apps https://github.com/jjm2473/openwrt-apps.git;main' >>feeds.conf.default


./scripts/feeds update -a
./scripts/feeds install -a
