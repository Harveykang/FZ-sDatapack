# FZ-sDataPack
A Minecraft Datapack
#### @Author: Harveykang

#### This project is licensed under the terms of the GNU General Public License v3.0.
#### Copyright (C)2019-2020 Harvey.Kang

### v2.0.0
- 支持Minecraft1.16.x
- 抬头并按一下shift来打开设置界面
- 提供一些地毯脚本：
	- 安装方法：
		- 需要carpet mod 1.4.21：https://github.com/gnembon/fabric-carpet/releases
		- 将其放入“world/scripts”中(在客户端位于“.minecraft/saves/存档名/scripts”或“.minecraft/config/carpet/scripts”)
			- 这三个文件夹默认不会自动生成，直接新建即可
	- here.sc：
		- “/here”向所有人发送自己的位置和所在维度
			- 发送的消息使用voxelmap可识别的数组格式
			- 安装voxelmap mod后，左键高亮该坐标，ctrl+左键新建坐标点
	- c.sc
		- “/c”修改玩家模式为旁观模式
	- s.sc
		- “/s”修改玩家模式为生存模式
	- tagplayer.sc：
		- 这个工具可以防止将地毯mod生成的假人计入记分板
		- 使用方法：
			- 输入“/scripts load tagplayer”加载工具
			- 包含全部地毯假人自带的功能，以及新功能，如：
				- “/tagplayer check xxx”检查玩家的状态
				- “/tagplayer checkall”检查所有玩家的状态
				- “/tagplayer killall”清除所有假人
				- 其他用法可以在游戏内输入“/tagplayer”查看
	- restore_scores.sc：
		- 从数据包1.4升级时也需要使用这个工具
		- 这个工具可以从白名单读取玩家列表，逐一召唤假人，读取统计信息并赋值给记分板
			- 悄悄说一句没白名单的服把usercache.json复制一份改成whitelist.json就可以啦
		- 注意：原有的记分板会被删除
		- 使用方法：
			- 输入“/scripts load restore_scores”加载工具
			- 输入“/restore_scores by_whitelist”开始恢复
			- 输入“/scripts unload restore_scores”卸载工具
			- 记得用完就删掉它！
##### v2.0.0.10(计划)
- 添加单独的记分板升级工具
##### v2.0.0.9
- 修复矿车白名单状态反了的bug
##### v2.0.0.8
- 添加c.sc、s.sc、here.sc工具
##### v2.0.0.7
- tagplayer添加了新版carpet新指令，可以为假人切换热键栏
- 现在tagplayer需要carpet1.4.21或以上版本运行！
- 现在tagplayer可以给自己设置动作了
- 添加“/tagplayer shadow”指令将自己变为前缀为“挂机”的假人
##### v2.0.0.6
- 修复restore_scores.sc工具不能恢复受伤害榜(抖M榜)的bug
##### v2.0.0.5
- 修复挖掘榜部分工具不起作用的bug
- 添加restore_scores.sc工具便于恢复或从1.0版本升级记分板
##### v2.0.0.4
- 添加彩色字体
##### v2.0.0.3
- tagplayer需要地毯mod1.4.18或以上版本来运行
- 优化了tagplayer体验及修复若干bug
##### v2.0.0.2
- 重写
