#计算每个玩家本游戏刻死亡数和上一游戏刻死亡数的差
scoreboard players operation @s tDeathC -= @s deathCounter
#重置假人分数
scoreboard players operation @s[tag=carpetBot] deathCounter += @s tDeathC
#将两游戏刻玩家死亡数的差之和加在总榜上
scoreboard players operation 总死亡数 totalList -= @s[tag=!carpetBot] tDeathC
#储存当前游戏刻的玩家死亡数
scoreboard players operation @s tDeathC = @s deathCounter
