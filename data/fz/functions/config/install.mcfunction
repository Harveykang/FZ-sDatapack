#安装设置功能
#初始化触发器记分板
scoreboard objectives add config trigger
#存入已安装信息
data merge storage fz.installed {config:1b}
#提示已安装
tellraw @a {"text": "[信息]设置功能已安装","color": "#5fff00"}
#开始运行
function fz:config/start