tellraw @a {"text": "3min后清理掉落物"}
execute as @a at @a run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 1
schedule function fz:sweeper/timer/2min 60s