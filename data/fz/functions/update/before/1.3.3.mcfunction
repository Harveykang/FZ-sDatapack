scoreboard objectives remove installed
scoreboard players operation 总挖掘数 totalList = totalDug totalList
scoreboard players operation 总击杀数 totalList = totalKilled totalList
scoreboard players operation 总死亡数 totalList = totalDeath totalList
scoreboard players operation 总交易数 totalList = totalTraded totalList
scoreboard players operation 总钓鱼数 totalList = totalFished totalList
scoreboard players operation 总受伤害量 totalList = totalHurt totalList
scoreboard players operation 总活跃时间 totalList = totalActivation totalList
execute if score 总挖掘数 totalList = totalDug totalList run scoreboard players reset totalDug
execute if score 总击杀数 totalList = totalKilled totalList run scoreboard players reset totalKilled
execute if score 总死亡数 totalList = totalDeath totalList run scoreboard players reset totalDeath
execute if score 总交易数 totalList = totalTraded totalList run scoreboard players reset totalTraded
execute if score 总钓鱼数 totalList = totalFished totalList run scoreboard players reset totalFished
execute if score 总受伤害量 totalList = totalHurt totalList run scoreboard players reset totalHurt
execute if score 总活跃时间 totalList = totalActivation totalList run scoreboard players reset totalActivation
scoreboard objectives remove scoreswitch
scoreboard objectives remove actCounter
scoreboard objectives setdisplay sidebar.team.dark_purple
team remove displayScoresOff
scoreboard players reset version version