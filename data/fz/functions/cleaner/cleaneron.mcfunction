scoreboard players operation cleaner displayCleanTime = @a[scores={cleaner=30..}] cleaner
scoreboard players operation cleaner setCleanTime = @a[scores={cleaner=30..}] cleaner
scoreboard players operation cleaner setCleanTime *= 20 20
scoreboard players operation cleaner timeCounter = cleaner setCleanTime
tellraw @a [{"text":"扫地姬已开启~","color":"green"},{"score":{"objective":"displayCleanTime","name":"cleaner"},"color":"dark_aqua","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"游戏秒后清理掉落物~","color":"yellow"}]
scoreboard players set cleaner cleanerBooleans 1