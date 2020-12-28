execute if score @s config matches 1478966211..1478966215 run function fz:sweeper/config/on
execute if score @s config matches 1478966210 run function fz:sweeper/config/off
#提示音开关
execute if score @s config matches 1478966208 run tag @s remove fz.sweeperSoundOff
execute if score @s config matches 1478966209 run tag @s add fz.sweeperSoundOff
#boss血条时间提示开关
execute if score @s config matches 1478966206 run tag @s remove fz.sweeperBossbarOff
execute if score @s config matches 1478966207 run tag @s add fz.sweeperBossbarOff
#文字时间提示开关
execute if score @s config matches 1478966204 run tag @s remove fz.sweeperMessageOff
execute if score @s config matches 1478966205 run tag @s add fz.sweeperMessageOff
#矿车白名单
execute if score @s config matches 1478966216 run scoreboard players set keepMinecart parameter 1
execute if score @s config matches 1478966217 run scoreboard players reset keepMinecart parameter

bossbar set minecraft:fz.sweeper players @a[tag=!fz.sweeperBossbarOff]

scoreboard players reset @s config
function fz:config/display