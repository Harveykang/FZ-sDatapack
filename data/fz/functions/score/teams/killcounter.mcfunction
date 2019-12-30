tellraw @a[scores={scoreSwitch=2},team=!killCounter] [{"text":"您已订阅"},{"text":"击杀榜","color":"red"}]
team join killCounter @a[scores={scoreSwitch=2},team=!killCounter]
scoreboard objectives setdisplay sidebar.team.red killCounter