execute if score cleaner timeCounter matches ..0 run function fz:cleaner/subclean
execute if score cleaner timeCounter matches 6000 run tellraw @a [{"text":"5游戏分后清理掉落物~","color":"gold"}]
execute if score cleaner timeCounter matches 3600 run tellraw @a [{"text":"3游戏分后清理掉落物~","color":"gold"}]
execute if score cleaner timeCounter matches 2400 run tellraw @a [{"text":"2游戏分后清理掉落物~","color":"gold"}]
execute if score cleaner timeCounter matches 1200 run tellraw @a [{"text":"60游戏秒后清理掉落物~小伙伴们抓紧时间rua！","color":"gold"}]
execute if score cleaner timeCounter matches 600 run tellraw @a [{"text":"30游戏秒后清理掉落物~搞事的先停停rua！","color":"red"}]
execute if score cleaner timeCounter matches 200 run tellraw @a [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"10","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~准备干活咯！","color":"dark_red","bold":false,"underlined":false}]
execute if score cleaner timeCounter matches 100 run tellraw @a [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"5","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~","color":"dark_red","bold":false,"underlined":false}]
execute if score cleaner timeCounter matches 80 run tellraw @a [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"4","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~","color":"dark_red","bold":false,"underlined":false}]
execute if score cleaner timeCounter matches 60 run tellraw @a [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"3","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~","color":"dark_red","bold":false,"underlined":false}]
execute if score cleaner timeCounter matches 40 run tellraw @a [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"2","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~","color":"dark_red","bold":false,"underlined":false}]
execute if score cleaner timeCounter matches 20 run tellraw @a [{"text":"注意!","color":"dark_red","bold":false,"underlined":false},{"text":"1","color":"red","bold":true,"underlined":true},{"text":"游戏秒后清理掉落物~","color":"dark_red","bold":false,"underlined":false}]
scoreboard players remove cleaner timeCounter 1