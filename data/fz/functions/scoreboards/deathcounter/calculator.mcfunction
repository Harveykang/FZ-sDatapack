#计算死亡数和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s deathCounter += @s deathTester
execute unless score @s carpetBot matches 1 run scoreboard players operation 全部木大 deathCounter += @s deathTester
execute unless score @s carpetBot matches 1 run scoreboard players operation 全部木大 totalList += @s deathTester
#重置死亡探测记分板
scoreboard players reset @s deathTester
#重置触发该函数的成就
advancement revoke @s only fz:scoreboards/deathcounter