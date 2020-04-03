# @Author: Harvey.Kang
# @Date: 2019-10-01
# @License: GNU General Public License, version 3 (GPL-3.0)

# This project is licensed under the terms of the GNU General Public License v3.0
# Copyright (C)2019-2020 Harvey.Kang

scoreboard objectives add version dummy
#升级用beforeinstall#
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
execute unless score scoreboard installed matches -1 run function fz:score/install
execute unless score health installed matches -1 run function fz:health/install
execute unless score sleep installed matches -1 run function fz:sleep/install
execute unless score cleaner installed matches -1 run function fz:cleaner/install
execute unless score logintips installed matches -1 run function fz:logintips/install
execute unless score noai installed matches -1 run function fz:noai/install
execute unless score config installed matches -1 run function fz:config/install
#升级用afterinstall#
####
###dev
scoreboard players set versionMajor version 1
scoreboard players set versionMinor version 5
scoreboard players set versionPatch version 0
scoreboard players set dev1 version 20200402
scoreboard players reset dev2prefix version
scoreboard players set dev2 version 1806
####
#预览版本号
tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDatapack-","color":"gold"},{"score":{"objective":"version","name":"versionMajor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionMinor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionPatch"},"color":"gold"},{"text":"-","color":"gold"},{"text":"dev.","color":"red"},{"score":{"objective":"version","name":"dev1"},"color":"red"},{"text":".","color":"red"},{"score":{"objective":"version","name":"dev2prefix"},"color":"red"},{"score":{"objective":"version","name":"dev2"},"color":"red"},{"text":" installed successfully","color":"gold"}]
#tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDatapack-","color":"gold"},{"score":{"objective":"version","name":"versionMajor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionMinor"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"version","name":"versionPatch"},"color":"gold"},{"text":" installed successfully","color":"gold"}]