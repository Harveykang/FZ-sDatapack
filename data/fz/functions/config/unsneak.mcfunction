#由config/sneak和config/unsneak成就触发
#判断玩家视角是否指向正上方，是则运行turnon函数
execute if data storage fz.installed {config:1b} if entity @s[x_rotation=-90] run function fz:config/turnon
#重置该玩家的两个成就
advancement revoke @s only fz:config/sneak
advancement revoke @s only fz:config/unsneak