# @Author: Harvey.Kang
# @Create: 2019-10-01
# @License: GNU General Public License, version 3 (GPL-3.0)

# This project is licensed under the terms of the GNU General Public License v3.0.
# Copyright (C)2019 Harvey.Kang

记分板：/trigger scoreswitch set -1关；1循环播放；2-9订阅单独的记分板
扫地姬：/trigger cleaner set -1关；>=30开
设置界面：/trigger options
如果您在使用carpet mod的话：
务必使用“/script invoke summon 玩家名”召唤假人，可以避免将他们计入记分板总分！
务必使用“/script invoke kill 玩家名”移除假人，否则其标签无法删除！

v1.3.3
-添加鳕鱼、鲑鱼、热带鱼、河豚、蝙蝠的AI开关
-添加设置界面

v1.3.2
-为carpet mod小人添加防止计入记分板总分的生成/删除命令

v1.3.1
-增加活跃度排行(小时)记分板

v1.3.0
-支持1.15
-大修记分板，增加了总分数计算和显示
-*不兼容*1.2.x的记分板
-添加部分代码的注释

v1.2.3
-修复记分板无法完全卸载的bug
-增加了在卸载保留记分板的选项

v1.2.2
-增加记分板订阅功能

v1.2.1
-修复加载时版本号与实际不一致的bug

v1.2.0
-现在可以自定义扫地姬清扫的时间间隔了

v1.1.4
-增加登录时显示的提示文本
-更改记分板开关队伍名称使其更易读
-更改开关指令的数值，现在为1开、-1关
-修复当其他玩家进入游戏时，扫地姬会关闭的bug

v1.1.3
-调整扫地姬清理间隔为120游戏秒

v1.1.2
-调整扫地姬使其在关闭时timeCounter归零，而不是开启时

v1.1.1
-修复记分板不更新的bug

v1.1
-增加受伤害量记分板
-增加扫地姬，以及扫地姬开关

v1.0
-支持1.14.x
-增加玩家睡觉提醒
-增加玩家tab栏和头顶的血量显示
-增加记分版：挖掘量、造成伤害量、死亡次数、钓鱼次数、交易次数，以及记分版开关