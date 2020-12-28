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
bossbar set fz.sweeper visible false

tellraw @a {"text": "[信息]扫地机已启用","color": "#5fff00"}