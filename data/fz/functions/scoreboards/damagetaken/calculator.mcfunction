#计算受伤害量和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s 10xDamageTaken /= 10 calculator
execute unless score @s carpetBot matches 1 run scoreboard players operation @s damageTaken += @s 10xDamageTaken
execute unless score @s carpetBot matches 1 run scoreboard players operation 群p抖M damageTaken += @s 10xDamageTaken
execute unless score @s carpetBot matches 1 run scoreboard players operation 群p抖M totalList += @s 10xDamageTaken
#重置伤害探测记分板
scoreboard players reset @s 10xDamageTaken
#重置触发该函数的成就
advancement revoke @s only fz:scoreboards/damagetaken