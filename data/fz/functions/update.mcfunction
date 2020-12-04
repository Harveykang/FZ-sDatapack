#先安装
function fz:install
#再卸载已经被卸载的项目
execute if data storage fz.installed {config:0b} run function fz:config/uninstall
execute if data storage fz.installed {sweeper:0b} run function fz:sweeper/uninstall
execute if data storage fz.installed {scoreboards:0b} run function fz:scoreboards/uninstall
execute if data storage fz.installed {health:0b} run function fz:health/uninstall
execute if data storage fz.installed {logintips:0b} run function fz:login/logintips/uninstall
#提示已安装
tellraw @a {"text": "[信息]升级完成","color": "#5fff00"}