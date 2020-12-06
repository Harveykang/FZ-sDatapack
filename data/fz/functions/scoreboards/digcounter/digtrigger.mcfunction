#判断各工具是否被使用并运行相应函数计算挖掘榜（左右键都会探测）
#需要配合修正函数toolfix修正右键使用带来的加分
execute if score @s usedDiaAxe matches 1.. run function fz:scoreboards/digcounter/tools/diaaxe
execute if score @s usedDiaHoe matches 1.. run function fz:scoreboards/digcounter/tools/diahoe
execute if score @s usedDiaPickaxe matches 1.. run function fz:scoreboards/digcounter/tools/diapickaxe
execute if score @s usedDiaShovel matches 1.. run function fz:scoreboards/digcounter/tools/diashovel
execute if score @s usedGolAxe matches 1.. run function fz:scoreboards/digcounter/tools/golaxe
execute if score @s usedGolHoe matches 1.. run function fz:scoreboards/digcounter/tools/golhoe
execute if score @s usedGolPickaxe matches 1.. run function fz:scoreboards/digcounter/tools/golpickaxe
execute if score @s usedGolShovel matches 1.. run function fz:scoreboards/digcounter/tools/golshovel
execute if score @s usedIroAxe matches 1.. run function fz:scoreboards/digcounter/tools/iroaxe
execute if score @s usedIroHoe matches 1.. run function fz:scoreboards/digcounter/tools/irohoe
execute if score @s usedIroPickaxe matches 1.. run function fz:scoreboards/digcounter/tools/iropickaxe
execute if score @s usedIroShovel matches 1.. run function fz:scoreboards/digcounter/tools/iroshovel
execute if score @s usedNetAxe matches 1.. run function fz:scoreboards/digcounter/tools/netaxe
execute if score @s usedNetHoe matches 1.. run function fz:scoreboards/digcounter/tools/nethoe
execute if score @s usedNetPickaxe matches 1.. run function fz:scoreboards/digcounter/tools/netpickaxe
execute if score @s usedNetShovel matches 1.. run function fz:scoreboards/digcounter/tools/netshovel
execute if score @s usedStoAxe matches 1.. run function fz:scoreboards/digcounter/tools/stoaxe
execute if score @s usedStoHoe matches 1.. run function fz:scoreboards/digcounter/tools/stohoe
execute if score @s usedStoPickaxe matches 1.. run function fz:scoreboards/digcounter/tools/stopickaxe
execute if score @s usedStoShovel matches 1.. run function fz:scoreboards/digcounter/tools/stoshovel
execute if score @s usedWooAxe matches 1.. run function fz:scoreboards/digcounter/tools/wooaxe
execute if score @s usedWooHoe matches 1.. run function fz:scoreboards/digcounter/tools/woohoe
execute if score @s usedWooPickaxe matches 1.. run function fz:scoreboards/digcounter/tools/woopickaxe
execute if score @s usedWooShovel matches 1.. run function fz:scoreboards/digcounter/tools/wooshovel
execute if score @s usedShears matches 1.. run function fz:scoreboards/digcounter/tools/shears
#重置探测使用工具的记分板的成就
advancement revoke @s only fz:scoreboards/digcounter/digtrigger