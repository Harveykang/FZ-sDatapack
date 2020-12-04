execute if data storage fz.installed {logintips:1b} run tellraw @s {"text": "[提醒]站在地面，抬头并按一下shift即可打开设置页面","color": "#d7ff00"}

scoreboard players set @s leaveGame 0

advancement revoke @s only fz:scoreboards/activation
advancement revoke @s only fz:scoreboards/damagetaken
advancement revoke @s only fz:scoreboards/deathcounter
advancement revoke @s only fz:scoreboards/fishingcounter
advancement revoke @s only fz:scoreboards/killcounter
advancement revoke @s only fz:scoreboards/tradingcounter
advancement revoke @s only fz:scoreboards/digcounter/digtrigger
advancement revoke @s only fz:scoreboards/digcounter/toolsfix

advancement revoke @s from fz:leavegame