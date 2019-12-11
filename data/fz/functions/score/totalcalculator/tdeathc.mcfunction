#计算每个玩家本游戏刻挖掘量和上一游戏刻死亡数的差
scoreboard players operation @s tDeathC -= @s deathCounter
#将两游戏刻玩家死亡数的差之和加在总榜上
scoreboard players operation totalDeath totalList -= @s tDeathC
#储存当前游戏刻的玩家死亡数
scoreboard players operation @s tDeathC = @s deathCounter