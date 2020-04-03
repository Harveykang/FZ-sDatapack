#计算每个玩家本游戏刻活跃度和上一游戏刻活跃度的差
scoreboard players operation @s tActC -= @s activation
#重置假人分数
scoreboard players operation @s[tag=carpetBot] activation += @s tActC
#将两游戏刻活跃度的差之和加在总榜上
scoreboard players operation 总活跃时间 totalList -= @s[tag=!carpetBot] tActC
#储存当前游戏刻的活跃度
scoreboard players operation @s tActC = @s activation