#应用计分板显示，对应分数1838019370-1838019379
execute if score @s config matches 1838019370 run team leave @s
execute if score @s config matches 1838019371 run team join gold
execute if score @s config matches 1838019372 run team join aqua
execute if score @s config matches 1838019373 run team join yellow
execute if score @s config matches 1838019374 run team join dark_red
execute if score @s config matches 1838019375 run team join gray
execute if score @s config matches 1838019376 run team join blue
execute if score @s config matches 1838019377 run team join red
execute if score @s config matches 1838019378 run team join green
execute if score @s config matches 1838019379 run team join dark_aqua
#每条子函数都要reset config分数和function fz:config/display
scoreboard players reset @s config
function fz:config/display