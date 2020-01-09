# @Author: Harvey.Kang
# @Date: 2019-10-01
# @Last Modified by: Harvey.Kang
# @Last Modified time: 2019-12-15 03:53:27
# @License: GNU General Public License, version 3 (GPL-3.0)

# This project is licensed under the terms of the GNU General Public License v3.0
# Copyright (C)2019-2020 Harvey.Kang
#升级用#
scoreboard objectives add versionMajor dummy
scoreboard objectives add versionMinor dummy
scoreboard objectives add versionPatch dummy
scoreboard players operation version version = version version
execute if score version version matches ..132 run function fz:update/before/1.3.3
execute if score version version matches 133 run function fz:update/before/1.3.3d
####
scoreboard objectives add installed dummy
scoreboard players set installed installed 1
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
#升级用#
execute if score version version matches ..132 run function fz:update/after/1.3.3
execute if score version version matches 133 run function fz:update/after/1.3.3d
function fz:update/after/1.4
scoreboard players set version versionMajor 1
scoreboard players set version versionMinor 4
scoreboard players set version versionPatch 0
####
tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDatapack-","color":"gold"},{"score":{"objective":"versionMajor","name":"version"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"versionMinor","name":"version"},"color":"gold"},{"text":".","color":"gold"},{"score":{"objective":"versionPatch","name":"version"},"color":"gold"},{"text":"-dev.20200109.1743 installed successfully","color":"gold"}]