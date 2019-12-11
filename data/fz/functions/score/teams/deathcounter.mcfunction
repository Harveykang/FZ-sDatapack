tellraw @a[scores={scoreswitch=4},team=!deathCounter] [{"text":"您已订阅"},{"text":"死亡榜","color":"dark_red"}]
team join deathCounter @a[scores={scoreswitch=4},team=!deathCounter]
scoreboard objectives setdisplay sidebar.team.dark_red deathCounter