tellraw @a[scores={scoreSwitch=9},team=!totalList] [{"text":"您已订阅"},{"text":"统计总量","color":"light_purple"}]
team join totalList @a[scores={scoreSwitch=9},team=!totalList]
scoreboard objectives setdisplay sidebar.team.light_purple totalList