scoreboard players operation cleaner secondsCounter = cleaner timeCounter
scoreboard players operation cleaner secondsCounter /= 20 20
scoreboard players operation cleaner secondsCounter += 1 1
bossbar set cleaner players @a[tag=displayCleanerBossBar]
bossbar set cleaner name [{"text":"扫地姬倒计时："},{"score":{"objective":"secondsCounter","name":"cleaner"},"bold":true},{"text":"游戏秒后清理掉落物"}]
execute if score cleaner timeCounter matches ..0 run function fz:cleaner/subclean
execute if score cleaner timeCounter matches 6000 run function fz:cleaner/time/5min
execute if score cleaner timeCounter matches 6000 run tellraw @a[tag=!noDisplayCleanerChat] [{"text":"5游戏分后清理掉落物~","color":"green"}]
execute if score cleaner timeCounter matches 5400 run function fz:cleaner/time/4min30s
execute if score cleaner timeCounter matches 4800 run function fz:cleaner/time/4min
execute if score cleaner timeCounter matches 4200 run function fz:cleaner/time/3min30s
execute if score cleaner timeCounter matches 3600 run function fz:cleaner/time/3min
execute if score cleaner timeCounter matches 3600 run tellraw @a[tag=!noDisplayCleanerChat] [{"text":"3游戏分后清理掉落物~","color":"green"}]
execute if score cleaner timeCounter matches 3000 run function fz:cleaner/time/2min30s
execute if score cleaner timeCounter matches 2400 run function fz:cleaner/time/2min
execute if score cleaner timeCounter matches 2400 run tellraw @a[tag=!noDisplayCleanerChat] [{"text":"2游戏分后清理掉落物~","color":"yellow"}]
execute if score cleaner timeCounter matches 1800 run function fz:cleaner/time/1min30s
execute if score cleaner timeCounter matches 1200 run function fz:cleaner/time/60s
execute if score cleaner timeCounter matches 1200 run tellraw @a[tag=!noDisplayCleanerChat] [{"text":"60游戏秒后清理掉落物~","color":"gold"}]
execute if score cleaner timeCounter matches 600 run function fz:cleaner/time/30s
execute if score cleaner timeCounter matches 600 run tellraw @a[tag=!noDisplayCleanerChat] [{"text":"30游戏秒后清理掉落物~","color":"red"}]
execute if score cleaner timeCounter matches 200 run function fz:cleaner/time/10s
execute if score cleaner timeCounter matches 100 run function fz:cleaner/time/5s
execute if score cleaner timeCounter matches 80 run function fz:cleaner/time/4s
execute if score cleaner timeCounter matches 60 run function fz:cleaner/time/3s
execute if score cleaner timeCounter matches 40 run function fz:cleaner/time/2s
execute if score cleaner timeCounter matches 20 run function fz:cleaner/time/1s
scoreboard players remove cleaner timeCounter 1