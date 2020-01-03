#计算每个玩家本游戏刻玩家受伤害量和上一游戏刻受伤害量的差
scoreboard players operation @s tHurtC -= @s damageTaken
#将两游戏刻玩家受伤害量的差之和加在总榜上
scoreboard players operation 总受伤害量 totalList -= @s tHurtC
#储存当前游戏刻的玩家受伤害量
scoreboard players operation @s tHurtC = @s damageTaken