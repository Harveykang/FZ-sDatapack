#title
tellraw @s {"text":"--卡顿生物AI开关(本项仅op可用)--","color":"dark_green","bold":true}
tellraw @s {"text":"注意！无AI的实体不会自然下落且不会因流体或实体挤压而运动！","color":"dark_red"}
#除非鳕鱼ai为关否则显示关闭按钮
execute unless data storage minecraft:cod {ai:0b} run tellraw @s [{"text":"- "},{"text":"鳕鱼[minecraft:cod]","hoverEvent":{"action":"show_text","value":"状态：开启"}},{"text":" "},{"text":"[✔]","color":"gray","hoverEvent":{"action":"show_text","value":"已开启"}},{"text":" "},{"text":"[✘]","color":"dark_red","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:cod ai set value 0b"},"hoverEvent":{"action":"show_text","value":"点击以关闭"}}]
#如果鳕鱼ai为开则显示开启按钮
execute if data storage minecraft:cod {ai:0b} run tellraw @s [{"text":"- "},{"text":"鳕鱼[minecraft:cod]","hoverEvent":{"action":"show_text","value":"状态：关闭"}},{"text":" "},{"text":"[✔]","color":"dark_green","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:cod ai set value 1b"},"hoverEvent":{"action":"show_text","value":"点击以开启"}},{"text":" "},{"text":"[✘]","color":"gray","hoverEvent":{"action":"show_text","value":"已关闭"}}]
#除非鲑鱼ai为关否则显示关闭按钮
execute unless data storage minecraft:salmon {ai:0b} run tellraw @s [{"text":"- "},{"text":"鲑鱼[minecraft:salmon]","hoverEvent":{"action":"show_text","value":"状态：开启"}},{"text":" "},{"text":"[✔]","color":"gray","hoverEvent":{"action":"show_text","value":"已开启"}},{"text":" "},{"text":"[✘]","color":"dark_red","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:salmon ai set value 0b"},"hoverEvent":{"action":"show_text","value":"点击以关闭"}}]
#如果鲑鱼ai为开则显示开启按钮
execute if data storage minecraft:salmon {ai:0b} run tellraw @s [{"text":"- "},{"text":"鲑鱼[minecraft:salmon]","hoverEvent":{"action":"show_text","value":"状态：关闭"}},{"text":" "},{"text":"[✔]","color":"dark_green","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:salmon ai set value 1b"},"hoverEvent":{"action":"show_text","value":"点击以开启"}},{"text":" "},{"text":"[✘]","color":"gray","hoverEvent":{"action":"show_text","value":"已关闭"}}]
#除非热带鱼ai为关否则显示关闭按钮
execute unless data storage minecraft:tropical_fish {ai:0b} run tellraw @s [{"text":"- "},{"text":"热带鱼[minecraft:tropical_fish]","hoverEvent":{"action":"show_text","value":"状态：开启"}},{"text":" "},{"text":"[✔]","color":"gray","hoverEvent":{"action":"show_text","value":"已开启"}},{"text":" "},{"text":"[✘]","color":"dark_red","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:tropical_fish ai set value 0b"},"hoverEvent":{"action":"show_text","value":"点击以关闭"}}]
#如果热带鱼ai为开则显示开启按钮
execute if data storage minecraft:tropical_fish {ai:0b} run tellraw @s [{"text":"- "},{"text":"热带鱼[minecraft:tropical_fish]","hoverEvent":{"action":"show_text","value":"状态：关闭"}},{"text":" "},{"text":"[✔]","color":"dark_green","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:tropical_fish ai set value 1b"},"hoverEvent":{"action":"show_text","value":"点击以开启"}},{"text":" "},{"text":"[✘]","color":"gray","hoverEvent":{"action":"show_text","value":"已关闭"}}]
#除非河豚ai为关否则显示关闭按钮
execute unless data storage minecraft:pufferfish {ai:0b} run tellraw @s [{"text":"- "},{"text":"河豚[minecraft:pufferfish]","hoverEvent":{"action":"show_text","value":"状态：开启"}},{"text":" "},{"text":"[✔]","color":"gray","hoverEvent":{"action":"show_text","value":"已开启"}},{"text":" "},{"text":"[✘]","color":"dark_red","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:pufferfish ai set value 0b"},"hoverEvent":{"action":"show_text","value":"点击以关闭"}}]
#如果河豚ai为开则显示开启按钮
execute if data storage minecraft:pufferfish {ai:0b} run tellraw @s [{"text":"- "},{"text":"河豚[minecraft:pufferfish]","hoverEvent":{"action":"show_text","value":"状态：关闭"}},{"text":" "},{"text":"[✔]","color":"dark_green","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:pufferfish ai set value 1b"},"hoverEvent":{"action":"show_text","value":"点击以开启"}},{"text":" "},{"text":"[✘]","color":"gray","hoverEvent":{"action":"show_text","value":"已关闭"}}]
#除非蝙蝠ai为关否则显示关闭按钮
execute unless data storage minecraft:bat {ai:0b} run tellraw @s [{"text":"- "},{"text":"蝙蝠[minecraft:bat]","hoverEvent":{"action":"show_text","value":"状态：开启"}},{"text":" "},{"text":"[✔]","color":"gray","hoverEvent":{"action":"show_text","value":"已开启"}},{"text":" "},{"text":"[✘]","color":"dark_red","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:bat ai set value 0b"},"hoverEvent":{"action":"show_text","value":"点击以关闭"}}]
#如果蝙蝠ai为开则显示开启按钮
execute if data storage minecraft:bat {ai:0b} run tellraw @s [{"text":"- "},{"text":"蝙蝠[minecraft:bat]","hoverEvent":{"action":"show_text","value":"状态：关闭"}},{"text":" "},{"text":"[✔]","color":"dark_green","clickEvent":{"action":"run_command","value":"/data modify storage minecraft:bat ai set value 1b"},"hoverEvent":{"action":"show_text","value":"点击以开启"}},{"text":" "},{"text":"[✘]","color":"gray","hoverEvent":{"action":"show_text","value":"已关闭"}}]





