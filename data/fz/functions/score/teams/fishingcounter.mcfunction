tellraw @a[scores={scoreSwitch=6},team=!fishingCounter] [{"text":"您已订阅"},{"text":"钓鱼榜","color":"blue"}]
team join fishingCounter @a[scores={scoreSwitch=6},team=!fishingCounter]
scoreboard objectives setdisplay sidebar.team.blue fishingCounter