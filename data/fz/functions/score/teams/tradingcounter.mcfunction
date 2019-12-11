tellraw @a[scores={scoreswitch=5},team=!tradingCounter] [{"text":"您已订阅"},{"text":"交易榜","color":"green"}]
team join tradingCounter @a[scores={scoreswitch=5},team=!tradingCounter]
scoreboard objectives setdisplay sidebar.team.green tradingCounter