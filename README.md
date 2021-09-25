![xuanwumen's GitHub stats](https://github-readme-stats.vercel.app/api?username=xuanwumen&show_icons=true&theme=radical)


|  插件中英对照表      |   [🔗](https://www.opup.link/?dir=Application-translation)|
|:----------------:    | :-------------------------------------------------------: |
## 设备/平台支持情况(下载使用前必看)

|   支持设备 / 平台    |                         下载链接                          |         Platform         |  Target  | Subtarget |
| :------------------: | :-------------------------------------------------------: | :----------------------: | :------: | :-------: |
|    x86_64 (lsp)      |     [🔗](https://opup.link/?dir=lsp/targets/x86/64)       |          x86_64          |   x86    |    64     |
|    x86_64 (releases) |     [🔗](https://opup.link/?dir=releases/targets/x86/64)  |          x86_64          |   x86    |    64     |
|    x86_64 (snapshots)|     [🔗](https://opup.link/?dir=snapshots/targets/x86/64) |          x86_64          |   x86    |    64     |
|    x86_64 (test)     |     [🔗](https://opup.link/?dir=test/targets/x86/64)      |          x86_64          |   x86    |    64     |

## 版本说明
|   版本代号           |                         源码链接                           |         分支/内核版本    |    插件详情     |
| :------------------: | :-------------------------------------------------------:  | :----------------------: | :------------:  |
|    lsp               | [🔗](https://github.com/coolsnowwolf/lede)                 |      Master/K5.10        |   待补充        |
|    releases          | [🔗](https://github.com/immortalwrt/immortalwrt)           |     openwrt-18.06-k5.4   |   插件自选      |
|    snapshots         | [🔗](https://github.com/immortalwrt/immortalwrt)           |     openwrt-18.06/k4.19  |   插件自选      |
|    test              | [🔗](https://github.com/coolsnowwolf/lede)                 |      Master/K5.10        |   插件自选      |


## 软件包安装指南

更新软件包索引:

```
opkg update
```

列出可安装的所有 LuCI APP :

```
opkg list | grep luci-app | grep -v Translation
```

安装软件包 (以 luci-app-ttyd 为例):

```
opkg install luci-app-ttyd
```

若发现此时新安装软件包界面为英文，则尝试查找该软件包的中文翻译包:

```
opkg list | grep luci-app-ttyd | grep zh-cn
```

此时可以得到该软件包的中文翻译包为 `luci-i18n-ttyd-zh-cn`，使用 `opkg install` 命令安装此翻译包即可:

```
opkg install luci-i18n-ttyd-zh-cn
```
## 免责声明
```
本固件源码均来自GitHub开源项目，仅供学习交流，不提供任何形式的明示或保证 ，在任何情况下都不得向作者或版权所有者应对任何索赔、损害或其他责任，包括在合同诉讼、侵权行为或其他方面。
```
## 鸣谢

特别感谢以下项目：

---

Openwrt 官方项目：

* [https://github.com/openwrt/openwrt](https://github.com/openwrt/openwrt)

---
Lean 大的 Openwrt 项目：

* [https://github.com/coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)

---
Project ImmortalWrt 的 ImmortalWrt 项目：

* [https://github.com/immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt)

---
P3TERX 大佬的 Actions-OpenWrt 项目：

* [https://github.com/P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

除这些项目之外，也特别感谢所有为 OpenWrt 项目及社区作出贡献的朋友们～

---
