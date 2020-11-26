#卸载设置功能
#移除进程残留
schedule clear fz:config/main
schedule clear fz:config/timeout
data remove storage fz.config is_open
#写入已卸载的信息
data merge storage fz.installed {config:0b}