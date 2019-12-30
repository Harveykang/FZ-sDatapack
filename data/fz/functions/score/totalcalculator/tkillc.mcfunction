#计算每个玩家本游戏刻玩家击杀数和上一游戏刻击杀数的差
scoreboard players operation @s tKillC -= @s killCounter
#将两游戏刻玩家击杀数的差之和加在总榜上
scoreboard players operation totalKilled totalList -= @s tKillC
#储存当前游戏刻的玩家击杀数
scoreboard players operation @s tKillC = @s killCounter