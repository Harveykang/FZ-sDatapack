#计算每个玩家本游戏刻挖掘量和上一游戏刻交易数的差
scoreboard players operation @s tTradeC -= @s tradingCounter
#将两游戏刻玩家交易数的差之和加在总榜上
scoreboard players operation totalTraded totalList -= @s tTradeC
#储存当前游戏刻的玩家交易数
scoreboard players operation @s tTradeC = @s tradingCounter