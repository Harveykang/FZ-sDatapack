# FZ-sDataPack
A Minecraft Datapack
#### @Author: Harveykang

#### This project is licensed under the terms of the GNU General Public License v3.0.
#### Copyright (C)2019-2020 Harvey.Kang

#### v2.0.0
- 重写
- 支持Minecraft1.16.x
- 抬头并按一下shift来打开设置界面
- 压缩包中的tagplayer.sc
  - 把它放在“存档名/scripts”中然后“/script load tagplayer”！
  - 使用/tagplayer 命令生成假人可以避免假人被数据包提供的记分板捕捉到~
  - tagplayer需要地毯mod1.4.21或以上版本来运行
  - 使用帮助可以在游戏中输入“/tagplayer”查看
- 压缩包中的restore_scores.sc工具可以恢复或从1.0版本升级记分板~
  - 把它放在“存档名/scripts”中然后“/script load restore_scores”
  - *该工具会先删除旧的记分板*
  - 输入“/restore_scores by_whitelist”恢复白名单内的玩家的记分板
  - *用完记得删除它并“/script unload restore_scores”*
  - restore_scores需要地毯mod1.4.13或以上版本来运行
##### - v2.0.0.8(计划)
  - 添加单独的记分板升级工具
##### - v2.0.0.7
  - tagplayer添加了新版carpet新指令，可以为假人切换热键栏
  - 现在tagplayer需要carpet1.4.21或以上版本运行！
  - 现在tagplayer可以给自己设置动作了
  - 添加“/tagplayer shadow”指令将自己变为前缀为“挂机”的假人
##### - v2.0.0.6
  - 修复restore_scores.sc工具不能恢复受伤害榜(抖M榜)的bug
##### - v2.0.0.5
  - 修复挖掘榜部分工具不起作用的bug
  - 添加restore_scores.sc工具便于恢复或从1.0版本升级记分板
##### - v2.0.0.4
  - 添加彩色字体
##### - v2.0.0.3
  - tagplayer需要地毯mod1.4.18或以上版本来运行
  - 优化了tagplayer体验及修复若干bug
##### - v2.0.0.2
  - 重写
