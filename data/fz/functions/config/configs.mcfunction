scoreboard players reset @s options
execute unless score noai installed matches -1 run function fz:noai/configs
execute if score script carpet matches 1 run tellraw @s {"text":"不计入计分板总分的假人：","color":"dark_green","bold":true}
execute if score tagplayer carpet matches 1 run function fz:carpet/tagplayercfg
execute unless score tagplayer carpet matches 1 run function fz:carpet/scriptplayercfg
execute unless score cleaner installed matches -1 run function fz:cleaner/configs
execute unless score scoreboard installed matches -1 run function fz:score/configs