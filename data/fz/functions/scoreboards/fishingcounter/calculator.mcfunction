#计算钓鱼数和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s fishingCounter += @s fishingTester
execute unless score @s carpetBot matches 1 run scoreboard players operation 总钓鱼数 fishingCounter += @s fishingTester
execute unless score @s carpetBot matches 1 run scoreboard players operation 总钓鱼数 totalList += @s fishingTester
#重置钓鱼探测记分板
scoreboard players reset @s fishingTester
#重置出发该函数的成就
advancement revoke @s only fz:scoreboards/fishingcounter