#全卸载
function fz:config/uninstall
function fz:health/uninstall
function fz:scoreboards/uninstall
function fz:sweeper/uninstall
function fz:login/logintips/uninstall
#删除系统计分板
scoreboard objectives remove parameter
scoreboard objectives remove calculator
scoreboard objectives remove leaveGame
#存入已卸载信息，下次启动不会重新安装
data merge storage fz.installed {installed:0b}
#提示已卸载
tellraw @a {"text": "[信息]FZ'sDatapack已卸载","color": "#5fff00"}