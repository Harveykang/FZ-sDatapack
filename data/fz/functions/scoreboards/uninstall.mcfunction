schedule clear fz:scoreboards/totallist
schedule clear fz:scoreboards/activation/activation
schedule clear fz:scoreboards/damagetaken/damagetaken
schedule clear fz:scoreboards/deathcounter/deathcounter
schedule clear fz:scoreboards/digcounter/digcounter
schedule clear fz:scoreboards/fishingcounter/fishingcounter
schedule clear fz:scoreboards/killcounter/killcounter
schedule clear fz:scoreboards/tradingcounter/tradingcounter
schedule clear fz:scoreboards/main

scoreboard objectives remove actimeCounter

scoreboard objectives remove usedDiaAxe
scoreboard objectives remove usedDiaPickaxe
scoreboard objectives remove usedDiaShovel
scoreboard objectives remove usedDiaHoe
scoreboard objectives remove usedIroAxe
scoreboard objectives remove usedIroPickaxe
scoreboard objectives remove usedIroShovel
scoreboard objectives remove usedIroHoe
scoreboard objectives remove usedStoAxe
scoreboard objectives remove usedStoPickaxe
scoreboard objectives remove usedStoShovel
scoreboard objectives remove usedStoHoe
scoreboard objectives remove usedWooAxe
scoreboard objectives remove usedWooPickaxe
scoreboard objectives remove usedWooShovel
scoreboard objectives remove usedWooHoe
scoreboard objectives remove usedGolAxe
scoreboard objectives remove usedGolPickaxe
scoreboard objectives remove usedGolShovel
scoreboard objectives remove usedGolHoe
scoreboard objectives remove usedNetAxe
scoreboard objectives remove usedNetPickaxe
scoreboard objectives remove usedNetShovel
scoreboard objectives remove usedNetHoe

scoreboard objectives remove deathTester
scoreboard objectives remove fishingTester
scoreboard objectives remove 10xDamageTaken

scoreboard objectives setdisplay sidebar.team.aqua
scoreboard objectives setdisplay sidebar.team.yellow
scoreboard objectives setdisplay sidebar.team.dark_red
scoreboard objectives setdisplay sidebar.team.gray
scoreboard objectives setdisplay sidebar.team.blue
scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.light_purple
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.gold

#提示已卸载
tellraw @a {"text": "[信息]记分板已卸载","color": "#5fff00"}
tellraw @s [{"text": "[警告]您要删除计分板数据吗，它将会永久失去！(真的很久！)", "color": "#ffd900"},{"text": "[确定]","clickEvent": {"action": "run_command", "value": "/function fz:scoreboards/delscore"}, "color": "#00ff00"}]

data merge storage fz.installed {scoreboards:0b}