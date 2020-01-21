execute store result score cleaned cleaned run kill @e[type=item]
tellraw @a [{"text":"这次一共清理了","color":"dark_green","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"score":{"objective":"cleaned","name":"cleaned"},"color":"yellow","bold":true,"italic":false,"underlined":true,"strikethrough":false,"obfuscated":false},{"text":"堆物品~","color":"dark_green","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"下次清理将在","color":"yellow"},{"score":{"objective":"displayCleanTime","name":"cleaner"},"color":"dark_aqua","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"游戏秒后开始~","color":"yellow"}]
scoreboard players reset cleaned cleaned
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
scoreboard players operation cleaner timeCounter = cleaner setCleanTime
execute as @a[tag=!noCleanerSound] at @s run playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2