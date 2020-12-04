#判断各功能是否已安装并运行
execute if data storage fz.installed {scoreboards:1b} run function fz:scoreboards/start
execute if data storage fz.installed {sweeper:1b} run function fz:sweeper/start
execute if data storage fz.installed {config:1b} run function fz:config/start
function fz:carpet/carpet
#测试用的输出
tellraw @a {"text": "[信息]启动完毕","color": "#5fff00"}