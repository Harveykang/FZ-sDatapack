#关闭主进程
schedule clear fz:config/main
#输出给打开过设置界面的玩家的消息
tellraw @a[scores={openingConfig=1}] {"text": "[提醒]5分钟无任何人回应，为节省性能，已关闭设置功能，请重新唤起","color": "#66ffff"}
#重置打开过设置界面的玩家的列表
scoreboard objectives remove openingConfig
#移除设置界面被打开的信息
data remove storage fz.config is_open