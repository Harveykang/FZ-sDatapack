#安装设置功能
#初始化触发器记分板
scoreboard objectives add config trigger
#存入已安装信息
data merge storage fz.installed {config:1b}
#开始运行
function fz:config/start