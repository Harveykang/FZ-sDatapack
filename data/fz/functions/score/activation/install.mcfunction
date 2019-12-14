scoreboard objectives add actCounter dummy
scoreboard objectives add activation dummy [{"text":"活跃度排行","color":"aqua"},{"text":"(小时)","color":"gold"}]
team add activation
team modify activation color aqua
team join activation totalActivation
scoreboard objectives setdisplay sidebar.team.aqua activation
scoreboard objectives add tActC dummy
###实验性###在分项目下显示总量###
scoreboard objectives add totalActivation dummy
scoreboard players set totalActivation totalActivation 1
####