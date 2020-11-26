#计算挖掘榜和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s digCounter += @s usedDiaAxe
execute unless score @s carpetBot matches 1 run scoreboard players operation 总挖掘量 digCounter += @s usedDiaAxe
execute unless score @s carpetBot matches 1 run scoreboard players operation 总挖掘量 totalList += @s usedDiaAxe
scoreboard players reset @s usedDiaAxe