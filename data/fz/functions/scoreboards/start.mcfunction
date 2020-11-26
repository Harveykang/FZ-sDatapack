function fz:scoreboards/main
function fz:scoreboards/activation/main

advancement revoke @a only fz:scoreboards/activation
advancement revoke @a only fz:scoreboards/damagetaken
advancement revoke @a only fz:scoreboards/deathcounter
advancement revoke @a only fz:scoreboards/fishingcounter
advancement revoke @a only fz:scoreboards/killcounter
advancement revoke @a only fz:scoreboards/tradingcounter
advancement revoke @a only fz:scoreboards/digcounter/digtrigger
advancement revoke @a only fz:scoreboards/digcounter/toolsfix

tellraw @a {"text": "记分板ok"}