schedule clear fz:sweeper/bossbar
schedule clear fz:sweeper/main
schedule clear fz:sweeper/timer/1s
schedule clear fz:sweeper/timer/2s
schedule clear fz:sweeper/timer/3s
schedule clear fz:sweeper/timer/4s
schedule clear fz:sweeper/timer/5s
schedule clear fz:sweeper/timer/10s
schedule clear fz:sweeper/timer/30s
schedule clear fz:sweeper/timer/1min
schedule clear fz:sweeper/timer/2min
schedule clear fz:sweeper/timer/3min
schedule clear fz:sweeper/timer/4min

data merge storage fz.installed {sweeper:0b}
#提示已卸载
tellraw @a {"text": "[信息]扫地机已卸载","color": "#5fff00"}