scoreboard objectives add timeCounter dummy
scoreboard objectives add 20 dummy
scoreboard players set 20 20 20
function fz:score/install
function fz:health/install
function fz:sleep/install
function fz:cleaner/install
function fz:logintips/install
tellraw @a [{"text":"[Datapack]"},{"text":" FZ'sDataPack v1.3.1 installed successfully","color":"gold"}]