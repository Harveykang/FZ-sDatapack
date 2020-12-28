execute if score keepMinecart parameter matches 1 run execute store result score sweeperItem parameter run kill @e[type=item,predicate=!fz:sweeper/minecart]
execute unless score keepMinecart parameter matches 1 run execute store result score sweeperItem parameter run kill @e[type=item]
tellraw @a [{"text": "[信息]本次清理了","color": "#5fff00"},{"score": {"objective": "parameter", "name": "sweeperItem"},"color": "#5fff00"},{"text": "堆物品","color": "#5fff00"}]
execute as @a[tag=!fz.sweeperSoundOff] at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2
execute if score sweeperTime parameter matches 30 run function fz:sweeper/timer/30s
execute if score sweeperTime parameter matches 60 run function fz:sweeper/timer/1min
execute if score sweeperTime parameter matches 120 run function fz:sweeper/timer/2min
execute if score sweeperTime parameter matches 180 run function fz:sweeper/timer/3min
execute if score sweeperTime parameter matches 240 run function fz:sweeper/timer/4min
scoreboard players operation sweeperBossbar parameter = sweeperTime parameter