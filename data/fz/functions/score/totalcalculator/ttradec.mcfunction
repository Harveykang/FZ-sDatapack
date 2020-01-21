#计算每个玩家本游戏刻玩家交易数和上一游戏刻交易数的差
scoreboard players operation @s tTradeC -= @s tradingCounter
#重置假人分数
scoreboard players operation @s[tag=carpetBot] tradingCounter += @s tTradeC
#将两游戏刻玩家交易数的差之和加在总榜上
scoreboard players operation 总交易数 totalList -= @s[tag=!carpetBot] tTradeC
#储存当前游戏刻的玩家交易数
scoreboard players operation @s tTradeC = @s tradingCounter