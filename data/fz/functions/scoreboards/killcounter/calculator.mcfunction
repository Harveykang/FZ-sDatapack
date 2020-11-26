#计算击杀榜和总榜
scoreboard players add @s killCounter 1
scoreboard players add 总击杀数 killCounter 1
scoreboard players add 总击杀数 totalList 1
#重置触发该函数的成就，地毯小人已在成就里排除
advancement revoke @s only fz:scoreboards/killcounter