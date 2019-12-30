#计算每个玩家本游戏刻活跃度和上一游戏刻活跃度的差
scoreboard players operation @s tActC -= @s activation
#将两游戏刻活跃度的差之和加在总榜上
scoreboard players operation totalActivation totalList -= @s tActC
#储存当前游戏刻的活跃度
scoreboard players operation @s tActC = @s activation