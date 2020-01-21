#计算每个玩家本游戏刻钓鱼数和上一游戏刻钓鱼数的差
scoreboard players operation @s tFishC -= @s fishingCounter
#重置假人分数
scoreboard players operation @s[tag=carpetBot] fishingCounter += @s tFishC
#将两游戏刻玩家钓鱼数的差之和加在总榜上
scoreboard players operation 总钓鱼数 totalList -= @s[tag=!carpetBot] tFishC
#储存当前游戏刻的玩家钓鱼数
scoreboard players operation @s tFishC = @s fishingCounter