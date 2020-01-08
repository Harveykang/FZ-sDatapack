# @Author: Harvey.Kang
# @Date: 2019-10-01
# @Last Modified by: Harvey.Kang
# @Last Modified time: 2019-12-15 03:53:27
# @License: GNU General Public License, version 3 (GPL-3.0)

# This project is licensed under the terms of the GNU General Public License v3.0.
# Copyright (C)2019-2020 Harvey.Kang
#升级用#
scoreboard objectives add version dummy
scoreboard players operation version version = version version
execute if score version version matches ..132 run function fz:updatebeforeinstall133
execute if score version version matches 133 run function fz:updatebeforeinstall134
####
gamerule disableElytraMovementCheck true
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
execute if score installed installed matches ..132 run function fz:updateafterinstall133
execute if score installed installed matches 133 run function fz:updateafterinstall134
scoreboard players set version version 1331
####
tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDataPack v1.3.3 installed successfully","color":"gold"}]