execute if score sweepMinecart parameter matches 1 run execute store result score sweeperItem parameter run kill @e[type=item]
execute unless score sweepMinecart parameter matches 1 run execute store result score sweeperItem parameter run kill @e[type=item,predicate=!fz:sweeper/minecart]
tellraw @a [{"text": "本次清理了"},{"score": {"objective": "parameter", "name": "sweeperItem"}},{"text": "堆物品"}]
execute as @a at @a run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2
execute if score sweeperTime parameter matches 30 run function fz:sweeper/timer/30s
execute if score sweeperTime parameter matches 60 run function fz:sweeper/timer/1min
execute if score sweeperTime parameter matches 120 run function fz:sweeper/timer/2min
execute if score sweeperTime parameter matches 180 run function fz:sweeper/timer/3min
execute if score sweeperTime parameter matches 240 run function fz:sweeper/timer/4min