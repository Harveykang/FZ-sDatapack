# @Author: Harvey.Kang
# @Date: 2019-10-01
# @Last Modified by: Harvey.Kang
# @Last Modified time: 2019-12-15 03:53:27
# @License: GNU General Public License, version 3 (GPL-3.0)

# This project is licensed under the terms of the GNU General Public License v3.0.
# Copyright (C)2019 Harvey.Kang

scoreboard objectives add timeCounter dummy
scoreboard objectives add 20 dummy
scoreboard objectives add carpet dummy
scoreboard players set 20 20 20
scoreboard players reset carpet carpet
function fz:carpet
function fz:score/install
function fz:health/install
function fz:sleep/install
function fz:cleaner/install
function fz:logintips/install
function fz:config/install
tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDataPack v1.3.3 installed successfully","color":"gold"}]