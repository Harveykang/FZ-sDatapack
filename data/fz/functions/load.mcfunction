#如果未安装且未卸载则安装
execute unless data storage fz.installed {installed:1b} unless data storage fz.installed {installed:0b} run function fz:install
#如果版本正确且已安装则开始运行
execute if data storage fz {version:Alpha-2.0.0.5} if data storage fz.installed {installed:1b} run function fz:start
#如果版本不符则更新
execute unless data storage fz {version:Alpha-2.0.0.5} run function fz:update
#输出版本信息
tellraw @a [{"text": "[版本信息]FZ's Datapack-","color": "#ffd900"},{"nbt":"version","storage":"fz","color": "#ffd900"},{"nbt": "snapshot", "storage": "fz","color": "red"}]