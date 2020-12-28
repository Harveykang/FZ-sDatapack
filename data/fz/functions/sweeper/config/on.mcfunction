execute if score @s config matches 1478966211 run scoreboard players set sweeperTime parameter 30
execute if score @s config matches 1478966212 run scoreboard players set sweeperTime parameter 60
execute if score @s config matches 1478966213 run scoreboard players set sweeperTime parameter 120
execute if score @s config matches 1478966214 run scoreboard players set sweeperTime parameter 180
execute if score @s config matches 1478966215 run scoreboard players set sweeperTime parameter 240
schedule clear fz:sweeper/bossbar
schedule clear fz:sweeper/main
schedule clear fz:sweeper/timer/1s
schedule clear fz:sweeper/timer/2s
schedule clear fz:sweeper/timer/3s
schedule clear fz:sweeper/timer/4s
schedule clear fz:sweeper/timer/5s
schedule clear fz:sweeper/timer/10s
schedule clear fz:sweeper/timer/30s
schedule clear fz:sweeper/timer/1min
schedule clear fz:sweeper/timer/2min
schedule clear fz:sweeper/timer/3min
schedule clear fz:sweeper/timer/4min
#设置怪物血条
bossbar set minecraft:fz.sweeper visible true

function fz:sweeper/main
function fz:sweeper/bossbar