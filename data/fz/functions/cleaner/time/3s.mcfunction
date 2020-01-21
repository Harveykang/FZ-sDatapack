tellraw @a[tag=!noDisplayCleanerChat] [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"3","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~准备干活咯！","color":"dark_red","bold":false,"underlined":false}]
bossbar set cleaner style notched_6
bossbar set cleaner color red
bossbar set cleaner value 30
execute as @a[tag=!noCleanerSound] at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ 1 1