#计算每个玩家本游戏刻钓鱼数和上一游戏刻钓鱼数的差
scoreboard players operation @s tFishC -= @s fishingCounter
#将两游戏刻玩家钓鱼数的差之和加在总榜上
scoreboard players operation totalFished totalList -= @s tFishC
#储存当前游戏刻的玩家钓鱼数
scoreboard players operation @s tFishC = @s fishingCounter