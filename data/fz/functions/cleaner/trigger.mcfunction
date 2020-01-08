scoreboard players enable @a cleaner
scoreboard players enable @a cleanerBar
scoreboard players enable @a cleanerChat
execute as @a[scores={cleaner=..-1}] run function fz:cleaner/cleaneroff
execute as @a[scores={cleaner=1..29}] run tellraw @s [{"text":"请输入>=30的时间(单位:秒)","color":"dark_red"}]
execute as @a[scores={cleaner=30..}] run function fz:cleaner/cleaneron
execute as @a[scores={cleanerChat=1..},tag=noDisplayCleanerChat] run function fz:cleaner/cleanerchaton
execute as @a[scores={cleanerBar=1..},tag=!displayCleanerBossBar] run function fz:cleaner/cleanerbaron
execute as @a[scores={cleanerChat=..-1},tag=!noDisplayCleanerChat] run function fz:cleaner/cleanerchatoff
execute as @a[scores={cleanerBar=..-1},tag=displayCleanerBossBar] run function fz:cleaner/cleanerbaroff
scoreboard players reset @a[scores={cleanerChat=1..}] cleanerChat
scoreboard players reset @a[scores={cleanerBar=1..}] cleanerBar
scoreboard players reset @a[scores={cleanerChat=..-1}] cleanerChat
scoreboard players reset @a[scores={cleanerBar=..-1}] cleanerBar
scoreboard players reset @a[scores={cleaner=..-1}] cleaner
scoreboard players reset @a[scores={cleaner=1..}] cleaner
execute if score cleaner cleanerBooleans matches 1 run function fz:cleaner/main