tellraw @a[tag=!fz.sweeperMessageOff] {"text": "[提醒]5s后清理掉落物","color": "#66ffff"}
execute as @a[tag=!fz.sweeperSoundOff] at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 1
schedule function fz:sweeper/timer/4s 1s