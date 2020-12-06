#为digtrigger函数修正非挖掘的使用带来的加分
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players remove @s digCounter 1
execute unless score @s carpetBot matches 1 run scoreboard players remove 总挖掘量 digCounter 1
execute unless score @s carpetBot matches 1 run scoreboard players remove 总挖掘量 totalList 1
#重置探测右键使用工具的成就
advancement revoke @s only fz:scoreboards/digcounter/toolsfix