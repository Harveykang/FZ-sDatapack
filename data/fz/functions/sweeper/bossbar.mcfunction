bossbar set fz.sweeper name [{"score": {"name": "sweeperBossbar","objective": "parameter"},"color": "#ff6100","underlined": true,"bold": true},{"text": "秒后清理垃圾","color": "#ffd900","bold": false}]
bossbar set fz.sweeper players @a[tag=!fz.sweeperBossbarOff]
scoreboard players remove sweeperBossbar parameter 1
schedule function fz:sweeper/bossbar 1s