scoreboard players operation cleaner displayCleanTime = @s cleaner
scoreboard players operation cleaner setCleanTime = @s cleaner
scoreboard players operation cleaner setCleanTime *= 20 20
scoreboard players operation cleaner timeCounter = cleaner setCleanTime
tellraw @a [{"selector":"@s"},{"text":"已开启扫地姬~","color":"green"},{"score":{"objective":"displayCleanTime","name":"cleaner"},"color":"dark_aqua","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"游戏秒后清理掉落物~","color":"yellow"}]
scoreboard players set cleaner cleanerBooleans 1
execute if score cleaner setCleanTime matches 5401.. run function fz:cleaner/time/5min
execute if score cleaner setCleanTime matches 4801..5400 run function fz:cleaner/time/4min30s
execute if score cleaner setCleanTime matches 4201..4800 run function fz:cleaner/time/4min
execute if score cleaner setCleanTime matches 3601..4200 run function fz:cleaner/time/3min30s
execute if score cleaner setCleanTime matches 3001..3600 run function fz:cleaner/time/3min
execute if score cleaner setCleanTime matches 2401..3000 run function fz:cleaner/time/2min30s
execute if score cleaner setCleanTime matches 1801..2400 run function fz:cleaner/time/2min
execute if score cleaner setCleanTime matches 1201..1800 run function fz:cleaner/time/1min30s
execute if score cleaner setCleanTime matches 601..1200 run function fz:cleaner/time/60s
execute if score cleaner setCleanTime matches ..600 run function fz:cleaner/time/30s
bossbar set cleaner visible true