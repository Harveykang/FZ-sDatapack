#初始化tagplayer
carpet setDefault commandScript true
carpet setDefault commandScriptACE ops
carpet setDefault scriptsAutoload true
carpet setDefault commandPlayer ops
execute store success score tagplayer parameter run script load tagplayer
#提示已安装
execute if score tagplayer parameter matches 1 run tellraw @a {"text": "[信息]Tagplayer已启用","color": "#5fff00"}