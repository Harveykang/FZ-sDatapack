#取消记分板显示#
scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.gray
scoreboard objectives setdisplay sidebar.team.dark_red
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.blue
scoreboard objectives setdisplay sidebar.team.yellow
scoreboard objectives setdisplay sidebar.team.light_purple
####
#移除工具项目#
scoreboard objectives remove diamond_pickaxe
scoreboard objectives remove diamond_axe
scoreboard objectives remove diamond_shovel
scoreboard objectives remove iron_pickaxe
scoreboard objectives remove iron_axe
scoreboard objectives remove iron_shovel
scoreboard objectives remove stone_pickaxe
scoreboard objectives remove stone_axe
scoreboard objectives remove stone_shovel
####
#移除统计项目#
scoreboard objectives remove totalDug
scoreboard objectives remove totalKilled
scoreboard objectives remove totalDeath
scoreboard objectives remove totalTraded
scoreboard objectives remove totalFished
scoreboard objectives remove totalHurt
####
#移除队伍#
team remove displayScoresOff
team remove displayScoresOn
team remove killCounter
team remove digCounter
team remove deathCounter
team remove tradingCounter
team remove fishingCounter
team remove damageTaken
####
#移除开关#
scoreboard objectives remove scoreswitch
####
#询问是否移除记分板#
tellraw @a [{"text":"是否删除记分板数据？","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"点此删除","color":"dark_red","bold":true,"italic":false,"underlined":true,"strikethrough":false,"obfuscated":false,"clickEvent":{"action":"run_command","value":"/function fz:score/delscores"},"hoverEvent":{"action":"show_text","value":"删除所有记分板数据"}},{"text":"(仅op)","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false}]
####