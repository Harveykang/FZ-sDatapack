#卸载血量显示
#删除计分板
scoreboard objectives remove Health
#写入已卸载的信息
data merge storage fz.installed {health:0b}
#提示已卸载
tellraw @a {"text": "[信息]血量显示已卸载","color": "#5fff00"}