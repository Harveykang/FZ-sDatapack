execute unless score sweeperTime parameter matches 0 run scoreboard players set sweeperTime parameter 0
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
tellraw @a {"text": "[信息]扫地机已关闭","color": "#5fff00"}
execute as @a at @a run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2