execute unless score sweeperTime parameter matches 0 run scoreboard players set sweeperTime parameter 0
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
bossbar set minecraft:fz.sweeper visible false

tellraw @a[tag=!fz.sweeperMessageOff] {"text": "[信息]扫地机已关闭","color": "#5fff00"}
execute as @a[tag=!fz.sweeperSoundOff] at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2