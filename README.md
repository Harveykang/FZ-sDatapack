# FZ-sDataPack
A Minecraft Datapack
#### @Author: Harvey.Kang 
#### @Create: 2019-10-01 
#### @License: GNU General Public License, version 3 (GPL-3.0) 

#### This project is licensed under the terms of the GNU General Public License v3.0.
#### Copyright (C)2019-2020 Harvey.Kang

记分板：/trigger scoreswitch set -1关；1循环播放；2-9订阅单独的记分板  
扫地姬：/trigger cleaner set -1关；>=30开  
设置界面：/trigger options  
如果您在使用carpet mod的话：  
务必使用“/script invoke summon 玩家名”召唤假人，可以避免将他们计入记分板总分！  
务必使用“/script invoke kill 玩家名”移除假人，否则其标签无法删除！  

##### v1.4.2
- 修复扫地机时间设置过长时会导致刷屏清物品的bug

##### v1.4.1
- 修复并改善了玩家睡觉提醒，现在需要玩家自己确认是否发出想要跳过夜晚的消息
- 更新内置tagplayer(/script invoke summon等脚本)版本为0.1.0

##### v1.4
- 解决了手杀tagplayer不能删除其标签的缺陷，标签会在他们重进游戏时删除，如果使用指令再次召唤则不会删除
- 为扫地姬增加了boss血条时间提示和声音提醒，聊天栏、血条栏、声音提示均可开关
- tagplayer现在有“假的 ”前缀，避免分不清玩家列表中那些是假人
- 普通玩家可用的假人tp指令
- 增加假人tp的玩家相对坐标功能
- 现在又可以通过”/function fz:功能名/uninstall“删除部分功能了，它们依然可在需要的时候通过”/function fz:功能名/install“添加回来
- 添加更多tagplayer帮助（一大坨）
- 添加假人状态查询功能，使用/script invoke check xxx或/script invoke checkall
- tagplayer适配https://github.com/Harveykang/TagPlayer 地毯插件，需要放在“存档名\scripts”文件夹中

##### v1.3.3
- 添加鳕鱼、鲑鱼、热带鱼、河豚、蝙蝠的AI开关(仅1.15)
- 添加设置界面

##### v1.3.2
- 为carpet mod小人添加防止计入记分板总分的生成/删除命令

##### v1.3.1
- 增加活跃度排行(小时)记分板

##### v1.3.0
- 支持1.15
- 大修记分板，增加了总分数计算和显示
- *不兼容*1.2.x的记分板
- 添加部分代码的注释

##### v1.2.3
- 修复记分板无法完全卸载的bug
- 增加了在卸载保留记分板的选项

##### v1.2.2
- 增加记分板订阅功能

##### v1.2.1
- 修复加载时版本号与实际不一致的bug

##### v1.2.0
- 现在可以自定义扫地姬清扫的时间间隔了

##### v1.1.4
- 增加登录时显示的提示文本
- 更改记分板开关队伍名称使其更易读
- 更改开关指令的数值，现在为1开、-1关
- 修复当其他玩家进入游戏时，扫地姬会关闭的bug

##### v1.1.3
- 调整扫地姬清理间隔为120游戏秒

##### v1.1.2
- 调整扫地姬使其在关闭时timeCounter归零，而不是开启时

##### v1.1.1
- 修复记分板不更新的bug

##### v1.1
- 增加受伤害量记分板
- 增加扫地姬，以及扫地姬开关

##### v1.0
- 支持1.14.x
- 增加玩家睡觉提醒
- 增加玩家tab栏和头顶的血量显示
- 增加记分版：挖掘量、造成伤害量、死亡次数、钓鱼次数、交易次数，以及记分版开关
