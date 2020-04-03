#安装记分项目#
scoreboard objectives add digCounter dummy
scoreboard objectives add deathCounter deathCount
scoreboard objectives add killCounter totalKillCount
scoreboard objectives add tradingCounter minecraft.custom:minecraft.traded_with_villager
scoreboard objectives add fishingCounter minecraft.custom:minecraft.fish_caught
scoreboard objectives add damageTaken minecraft.custom:minecraft.damage_taken
scoreboard objectives add actCounter minecraft.custom:minecraft.play_one_minute
scoreboard objectives add totalList dummy
scoreboard objectives add activation dummy
scoreboard objectives add botDeath deathCount
####
#编辑记分项目#
scoreboard objectives modify digCounter displayname {"text":"挖掘榜","color":"gray"}
scoreboard objectives modify deathCounter displayname {"text":"死亡榜","color":"dark_red"}
scoreboard objectives modify killCounter displayname {"text":"击杀榜","color":"red"}
scoreboard objectives modify tradingCounter displayname {"text":"PY榜","color":"green"}
scoreboard objectives modify fishingCounter displayname {"text":"钓鱼榜","color":"blue"}
scoreboard objectives modify damageTaken displayname [{"text":"奥利给榜","color":"yellow"},{"text":"(受伤害*10)","color":"gole"}]
scoreboard objectives modify totalList displayname {"text":"统计总量","color":"light_purple"}
scoreboard objectives modify activation displayname [{"text":"活跃度排行","color":"aqua"},{"text":"(小时)","color":"gold"}]
####
#安装工具项目#
scoreboard objectives add diamond_axe minecraft.used:minecraft.diamond_axe
scoreboard objectives add diamond_pickaxe minecraft.used:minecraft.diamond_pickaxe
scoreboard objectives add diamond_shovel minecraft.used:minecraft.diamond_shovel
scoreboard objectives add iron_axe minecraft.used:minecraft.iron_axe
scoreboard objectives add iron_pickaxe minecraft.used:minecraft.iron_pickaxe
scoreboard objectives add iron_shovel minecraft.used:minecraft.iron_shovel
scoreboard objectives add stone_axe minecraft.used:minecraft.stone_axe
scoreboard objectives add stone_pickaxe minecraft.used:minecraft.stone_pickaxe
scoreboard objectives add stone_shovel minecraft.used:minecraft.stone_shovel
####
#安装统计项目#
scoreboard objectives add totalDug dummy
scoreboard objectives add totalKilled dummy
scoreboard objectives add totalDeath dummy
scoreboard objectives add totalTraded dummy
scoreboard objectives add totalFished dummy
scoreboard objectives add totalHurt dummy
scoreboard objectives add totalActivation dummy
####
###实验性###在分项目下显示总量###活跃度的该项在其自己的安装文件内
scoreboard players set 总挖掘数 totalDug 1
scoreboard players set 总击杀数 totalKilled 1
scoreboard players set 总死亡数 totalDeath 1
scoreboard players set 总交易数 totalTraded 1
scoreboard players set 总钓鱼数 totalFished 1
scoreboard players set 总受伤害量 totalHurt 1
scoreboard players set 总活跃时间 totalActivation 1
####
#安装记分板显示#
#安装队伍
team add displayScoresOff
team add displayScoresOn
team add killCounter
team add digCounter
team add deathCounter
team add tradingCounter
team add fishingCounter
team add damageTaken
team add totalList
team add activation
team join digCounter 总挖掘数
team join killCounter 总击杀数
team join deathCounter 总死亡数
team join fishingCounter 总钓鱼数
team join tradingCounter 总交易数
team join damageTaken 总受伤害量
team join activation 总活跃时间
#安装显示
scoreboard objectives setdisplay sidebar
team modify displayScoresOn color gold
scoreboard objectives setdisplay sidebar.team.gold totalList
team modify killCounter color red
scoreboard objectives setdisplay sidebar.team.red killCounter
team modify digCounter color gray
scoreboard objectives setdisplay sidebar.team.gray digCounter
team modify deathCounter color dark_red
scoreboard objectives setdisplay sidebar.team.dark_red deathCounter
team modify tradingCounter color green
scoreboard objectives setdisplay sidebar.team.green tradingCounter
team modify fishingCounter color blue
scoreboard objectives setdisplay sidebar.team.blue fishingCounter
team modify damageTaken color yellow
scoreboard objectives setdisplay sidebar.team.yellow damageTaken
team modify totalList color light_purple
scoreboard objectives setdisplay sidebar.team.light_purple totalList
team modify activation color aqua
scoreboard objectives setdisplay sidebar.team.aqua activation
scoreboard objectives add scoreSwitch trigger
####
#安装缓存#
scoreboard objectives add tDigC dummy
scoreboard objectives add tDeathC dummy
scoreboard objectives add tKillC dummy
scoreboard objectives add tFishC dummy
scoreboard objectives add tTradeC dummy
scoreboard objectives add tHurtC dummy
scoreboard objectives add tActC dummy
####
#安装1.16项目#
function fz:score/1.16/install
#安装完成
scoreboard players set scoreboard installed 1