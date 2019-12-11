scoreboard players enable @a cleaner
execute if entity @a[scores={cleaner=..-1}] run function fz:cleaner/cleaneroff
execute if entity @a[scores={cleaner=1..29}] run tellraw @a[scores={cleaner=1..29}] [{"text":"请输入>=30的时间(单位:秒)","color":"dark_red"}]
execute if entity @a[scores={cleaner=30..}] run function fz:cleaner/cleaneron
scoreboard players set @a[scores={cleaner=..-1}] cleaner 0
scoreboard players set @a[scores={cleaner=1..}] cleaner 0
execute if score cleaner cleanerBooleans matches 1 run function fz:cleaner/main