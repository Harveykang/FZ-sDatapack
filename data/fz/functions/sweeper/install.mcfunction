data merge storage fz.installed {sweeper:1b}
bossbar add fz.sweeper {"text":"null"}
bossbar set fz.sweeper value 0
#提示已安装
tellraw @a {"text": "[信息]扫地机已安装","color": "#5fff00"}
function fz:sweeper/start