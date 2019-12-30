tellraw @a[scores={scoreSwitch=3},team=!digCounter] [{"text":"您已订阅"},{"text":"挖掘榜","color":"gray"}]
team join digCounter @a[scores={scoreSwitch=3},team=!digCounter]
scoreboard objectives setdisplay sidebar.team.gray digCounter