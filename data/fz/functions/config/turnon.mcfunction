#触发函数，由成就和unsneak函数控制
#重置玩家的config分数，避免开启设置功能后，由于该玩家先前的分数而直接运行某些功能
scoreboard players reset @s config
#判断设置功能是否已经开启，如果未开启则运行主函数
execute unless data storage fz.config {is_open:1b} run function fz:config/main
execute unless data storage fz.config {is_open:1b} run scoreboard objectives add openingConfig dummy
execute unless data storage fz.config {is_open:1b} run data merge storage fz.config {is_open:1b}
#将该玩家加入打开设置页面的玩家的列表
scoreboard players set @s openingConfig 1
#将设置内容输出给玩家
function fz:config/display