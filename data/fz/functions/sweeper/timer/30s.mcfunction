tellraw @a {"text": "30s后清理掉落物"}
execute as @a at @a run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 1
schedule function fz:sweeper/timer/10s 20s