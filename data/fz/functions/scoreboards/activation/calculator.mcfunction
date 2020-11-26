#计算在线时间和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s activation += 1 calculator
execute unless score @s carpetBot matches 1 run scoreboard players operation 总在线时间(h) activation += 1 calculator
execute unless score @s carpetBot matches 1 run scoreboard players operation 总在线时间(h) totalList += 1 calculator
#重置玩家计时器
scoreboard players reset @s actimeCounter
#重置触发该函数的成就
advancement revoke @s only fz:scoreboards/activation