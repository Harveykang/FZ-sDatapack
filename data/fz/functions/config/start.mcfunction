#删除进程残留
schedule clear fz:config/main
schedule clear fz:config/timeout
data remove storage fz.config is_open
scoreboard players enable @a config
#测试用的输出
tellraw @a {"text": "设置ok"}