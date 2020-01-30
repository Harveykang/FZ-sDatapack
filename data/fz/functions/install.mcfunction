# @Author: Harvey.Kang
# @Date: 2019-10-01
# @License: GNU General Public License, version 3 (GPL-3.0)

# This project is licensed under the terms of the GNU General Public License v3.0
# Copyright (C)2019-2020 Harvey.Kang
#升级用before#
scoreboard objectives add version dummy
scoreboard players operation version version = version version
execute if score version version matches 132 run function fz:update/before/1.3.3
execute if score version version matches 133 run function fz:update/before/1.3.3d
execute if score versionMinor version matches 4 if score versionPatch version matches 0 if score dev1 version matches ..20200118 run function fz:update/before/1.4.0-dev
execute if score versionMinor version matches 4 if score versionPatch version matches 0 if score dev1 version matches ..20200111 unless score dev2 version matches 2241.. run function fz:update/before/1.4.0-dev5
####
scoreboard objectives add installed dummy
gamerule disableElytraMovementCheck true
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game
scoreboard objectives add timeCounter dummy
scoreboard objectives add 20 dummy
scoreboard objectives add 1 dummy
scoreboard players set 20 20 20
scoreboard players set 1 1 1
function fz:carpet/install
function fz:score/install
function fz:health/install
function fz:sleep/install
function fz:cleaner/install
function fz:logintips/install
function fz:config/install
#升级用after#
###1.4.0-dev2
scoreboard players set versionMajor version 1
scoreboard players set versionMinor version 4
scoreboard players set versionPatch version 0
scoreboard players reset dev1 version
scoreboard players reset dev2prefix version
scoreboard players reset dev2 version
####
#预览版本号
#tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDatapack-","color":"gold"},{"score":{"objective":"version","name":"versionMajor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionMinor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionPatch"},"color":"gold"},{"text":"-dev.","color":"gold"},{"score":{"objective":"version","name":"dev1"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"dev2prefix"},"color":"gold"},{"score":{"objective":"version","name":"dev2"},"color":"gold"},{"text":" installed successfully","color":"gold"}]
tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDatapack-","color":"gold"},{"score":{"objective":"version","name":"versionMajor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionMinor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionPatch"},"color":"gold"},{"text":" installed successfully","color":"gold"}]