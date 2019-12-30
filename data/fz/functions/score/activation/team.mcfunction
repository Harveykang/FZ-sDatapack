tellraw @a[scores={scoreSwitch=8},team=!activation] [{"text":"您已订阅"},{"text":"活跃度排行(小时)","color":"aqua"}]
team join activation @a[scores={scoreSwitch=8},team=!activation]
scoreboard objectives setdisplay sidebar.team.aqua activation