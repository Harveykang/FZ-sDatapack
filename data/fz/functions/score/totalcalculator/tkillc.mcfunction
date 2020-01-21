#计算每个玩家本游戏刻玩家击杀数和上一游戏刻击杀数的差
scoreboard players operation @s tKillC -= @s killCounter
#重置假人分数
scoreboard players operation @s[tag=carpetBot] killCounter += @s tKillC
#将两游戏刻玩家击杀数的差之和加在总榜上
scoreboard players operation 总击杀数 totalList -= @s[tag=!carpetBot] tKillC
#储存当前游戏刻的玩家击杀数
scoreboard players operation @s tKillC = @s killCounter