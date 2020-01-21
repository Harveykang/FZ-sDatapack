#计算每个玩家本游戏刻挖掘量和上一游戏刻挖掘量的差
scoreboard players operation @s tDigC -= @s digCounter
#重置假人分数
scoreboard players operation @s[tag=carpetBot] digCounter += @s tDigC
#将两游戏刻玩家挖掘量的差之和加在总榜上
scoreboard players operation 总挖掘数 totalList -= @s[tag=!carpetBot] tDigC
#储存当前游戏刻的玩家挖掘量
scoreboard players operation @s tDigC = @s digCounter