execute if score cleaner cleanerBooleans matches 1 run tellraw @a [{"text":"扫地姬已关闭~","color":"green"}]
bossbar set cleaner visible false
scoreboard players set cleaner cleanerBooleans 0
scoreboard players set cleaner setCleanTime 0
scoreboard players set cleaner displayCleanTime 0