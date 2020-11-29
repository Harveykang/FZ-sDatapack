//*************************************************************
//************请将该文件放入"world\scripts"文件夹中************
//*************************************************************
scoreboard_add('carpetBot');
run('team add carpetBot');
run('team modify carpetBot prefix "假的 "');
global_version = '2.0.0';
__config() -> {
	'stay_loaded' -> true,
	'allow_command_conflicts' -> true,
	'commands' -> {
		'' -> 'help',
		'spawn <player>' -> 'summon',
		'kill <bot>' -> 'kill',
		'killall' -> 'killall',
		'attack <bot>' -> 'attack_once',
		'attack <bot> continuous' -> 'attack_continuous',
		'attack <bot> interval <tick>' -> 'attack_interval',
		'attack <bot> once' -> 'attack_once',
		'drop <bot> all' -> 'drop_all',
		'drop <bot>' -> 'drop_once',
		'drop <bot> continuous' -> 'drop_continuous',
		'drop <bot> interval <tick>' -> 'drop_interval',
		'drop <bot> mainhand' -> 'drop_mainhand',
		'drop <bot> offhand' -> 'drop_offhand',
		'drop <bot> once' -> 'drop_once',
		'dropStack <bot> all' -> 'drop_stack_all',
		'dropStack <bot>' -> 'drop_stack_once',
		'dropStack <bot> continuous' -> 'drop_stack_continuous',
		'dropStack <bot> interval <tick>' -> 'drop_stack_interval',
		'dropStack <bot> mainhand' -> 'drop_stack_mainhand',
		'dropStack <bot> offhand' -> 'drop_stack_offhand',
		'dropStack <bot> once' -> 'drop_stack_once',
		'jump <bot>' -> 'jump_once',
		'jump <bot> continuous' -> 'jump_continuous',
		'jump <bot> interval <tick>' -> 'jump_interval',
		'jump <bot> once' -> 'jump_once',
		'swapHands <bot>' -> 'swap_hands_once',
		'swapHands <bot> continuous' -> 'swap_hands_continuous',
		'swapHands <bot> interval <tick>' -> 'swap_hands_interval',
		'swapHands <bot> once' -> 'swap_hands_once',
		'use <bot>' -> 'use_once',
		'use <bot> continuous' -> 'use_continuous',
		'use <bot> interval <tick>' -> 'use_interval',
		'use <bot> once' -> 'use_once',
		'mount <bot>' -> 'mount',
		'dismount <bot>' -> 'dismount',
		'sprint <bot>' -> 'sprint',
		'unsprint <bot>' -> 'unsprint',
		'sneak <bot>' -> 'sneak',
		'unsneak <bot>' -> 'unsneak',
		'look <bot> back' -> 'turn_back',
		'look <bot> left' -> 'turn_left',
		'look <bot> right' -> 'turn_right',
		'look <bot> up' -> 'look_up',
		'look <bot> down' -> 'look_down',
		'look <bot> east' -> 'look_east',
		'look <bot> north' -> 'look_north',
		'look <bot> south' -> 'look_south',
		'look <bot> west' -> 'look_west',
		'look <bot> <rotation>' -> 'look',
		'look <bot> position <position>' -> 'look_pos',
		'move <bot> backward' -> 'move_backward',
		'move <bot> forward' -> 'move_forward',
		'move <bot> left' -> 'move_left',
		'move <bot> right' -> 'move_right',
		'move <bot> stop' -> 'move_stop',
		'stop <bot>' -> 'stop',
		'check <bot>' -> 'check',
		'checkall' -> 'checkall',
		'tp <bot> <position>' -> 'tp',
		'tp <bot> <position> <rotation>' -> 'tp_with_rotation',
		'tp <bot> <player>' -> 'tp_to_player',
		'tp <bot> <position> atBot' -> 'tp_at_bot',
		'tp <bot> <position> <rotation> atBot' -> 'tp_at_bot_with_rotation',
	},
	'arguments' -> {
		'bot' -> {
			'type' -> 'term',
			'suggester' -> _(args) -> (
				player_list = player('all');
				bot_list = l();
				c_for(i = 0, i < length(player_list), i += 1,
					one_player_str = player_list:i;
					if (scoreboard('carpetBot', one_player_str) == 1,
						put(bot_list, length(bot_list), player_list:i)
					);
				);
				return(bot_list)
			)
		},
		'player' -> {
			'type' -> 'term',
			'suggester' -> _(args) -> player('all')
		},
		'tick' -> {
			'type' -> 'int',
			'min' -> 1, 
			'suggest' -> []
		},
		'rotation' -> {
			'type' -> 'rotation'
		},
		'position' -> {
			'type' -> 'location'
		}
	}
};
__check_offline(player_name) ->(
	f_player = player(player_name);
	if (!f_player, 
		print('§4假人'+player_name+'未在线');
		exit()
	);
	if (scoreboard('carpetBot', f_player) != 1,
		print('§4'+f_player+'不是假人');
		exit()
	)
);
__check_online(player_name) ->(
	f_player = player(player_name);
	if (f_player,
		if (scoreboard('carpetBot', f_player) == 1,
			print('§4假人'+f_player+'已经在线了');
			exit()
		);
		print('§4玩家'+f_player+'已经在线了');
		exit()
	)
);
__check_pos(x) ->(
	x = number(x);
	if(x == null,
		print('§4请输入正确的坐标');
		exit()
	);
	return(x)
);
__check_dim(s_player,f_player) ->(
	if (s_player~'dimension' != f_player~'dimension',
		print('§4不在同一维度！');
		exit()
	);
);
__player_list(i,player_list) ->(
	one_player_list = split(' ',join('',slice(player_list,i,i+1)));
	if(slice(one_player_list,0,1) == l('假的'),
		one_player_str = join('',slice(one_player_list,1,2));
		''
	);
	if(slice(one_player_list,0,1) != l('假的'),
		one_player_str = join('',one_player_list);
		''
	);
	return(one_player_str)
);
__on_player_disconnects(player, reason) ->(
	if(scoreboard('carpetBot', player) == 1,
		scoreboard_remove('actimeCounter', player);
		__delete_all_files(player);
		scoreboard_remove('carpetBot', player);
		run('team leave '+ player)
	);
);
__delete_all_files(f_player) ->(
	delete_file(f_player + '-' + 'attack', 'text');
	delete_file(f_player + '-' + 'drop', 'text');
	delete_file(f_player + '-' + 'drop_stack', 'text');
	delete_file(f_player + '-' + 'jump', 'text');
	delete_file(f_player + '-' + 'swap_hands', 'text');
	delete_file(f_player + '-' + 'use', 'text');
	delete_file(f_player + '-' + 'move_vertical', 'text');
	delete_file(f_player + '-' + 'move_transverse', 'text');
);
help() ->(
	print('--使用帮助：');
	print('/tagplayer spawn <玩家名>\n  - 生成假人');
	print('/tagplayer kill <玩家名>\n  - 删除假人');
	print('/tagplayer killall\n  - 删除全部假人');
	print('/tagplayer tp <玩家名> <x> <y> <z> (<仰俯> <偏转>) (atBot)\n  - 传送假人到<x>,<y>,<z>，可选<仰俯>和<偏转>角度，如以<atBot>结尾则相对坐标以假人为原点');
	print('/tagplayer look <玩家名> <仰俯> <偏转>\n  - 转动假人视角，<x>、<y>可替换为“s”来代表你的视角方向');
	print('/tagplayer look <玩家名> <up/down/east/west/south/north>\n  - 让假人向<上/下/东/西/南/北>方向看');
	print('/tagplayer look <玩家名> <back/left/right>\n  - 让假人向<后/左/右>方向看');
	print('/tagplayer move <玩家名> <backward/forward/left/right>\n  - 让假人<向前/向后/向左/向右>移动');
	print('/tagplayer <attack/drop/dropStack/jump/swapHands/use> <玩家名> continuous\n  - 让假人持续<攻击或挖掘/丢一个物品/丢一组物品/跳跃/换手/使用物品>');
	print('/tagplayer <attack/drop/dropStack/jump/swapHands/use> <玩家名> interval <整数>\n  - 让假人每<整数>游戏刻<攻击/丢一个物品/丢一组物品/跳跃/换手/使用物品>一次');
	print('/tagplayer <attack/drop/dropStack/jump/swapHands/use> <玩家名> once\n  - 让假人<攻击或挖掘/丢一个物品/丢一组物品/跳跃/换手/使用物品>一次');
	print('/tagplayer <drop/dropStack> <玩家名> <mainhand/offhand>\n  - 让假人<丢一个/丢一组><主手/副手>的物品');
	print('/tagplayer <sneak/unsneak> <玩家名>\n  - 让假人<潜行/站立>');
	print('/tagplayer <sprint/unsprint> <玩家名>\n  - 让假人准备<疾跑/行走>，在水中疾跑以游泳');
	print('/tagplayer <mount/dismount> <玩家名>\n  - 让假人<乘坐/卸下>');
	print('/tagplayer stop <玩家名>\n  - 停止假人的一切动作');
	print('/tagplayer check <玩家名>\n  - 检查假人状态');
	print('/tagplayer checkall\n  - 检查所有假人状态');
	print('Version: '+global_version);
	return()
);
reload() ->(
	run('script unload tagplayer');
	run('script load tagplayer');
	run('tellraw @a {"text":"tagplayer重载成功！"}');
	return()
);
summon(player_name) ->(
	player_name = slice(player_name,0,15);
	__check_online(player_name);
	s_player = player();
	run(str('player %s spawn at %f %f %f facing %f %f', player_name, s_player~'x', s_player~'y', s_player~'z', query(s_player, 'yaw'), query(s_player, 'pitch')
		)
	);
	f_player = player(player_name);
	if (!f_player,
		print('§4生成失败');
		return()
	);
	__delete_all_files(f_player);
	run('team join carpetBot '+ f_player);
	run('tellraw @a {"text":"↑假的"}');
	scoreboard('carpetBot', f_player, 1);
	return()
);
kill(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s kill', f_player));
	game_tick(50);
	run('tellraw @a {"text":"↑假的"}');
	return()
);
killall() ->(
	i = 0;
	player_list = player('all');
	loop(2147483647,,,
		one_player_str = __player_list(i,player_list);
		if(one_player_str == '',
			break()
		);
		if(scoreboard('carpetBot', one_player_str) == 1,
			do_fake_player = 1
		);
		run(str('player %s kill', one_player_str));
		i += 1
	);
	if(do_fake_player != 1,
		print('§4不存在假人');
		return()
	);
	game_tick(50);
	run('tellraw @a {"text":"已清除全部假人"}');
	return()
);
//攻击
attack_continuous(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s attack continuous', player_name));
	delete_file(f_player + '-' + 'attack', 'text');
	write_file(f_player + '-' + 'attack', 'text', 0);
	return()
);
attack_interval(player_name,tick) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s attack interval %d', player_name, tick));
	delete_file(f_player + '-' + 'attack', 'text');
	write_file(f_player + '-' + 'attack', 'text', tick);
	return()
);
attack_once(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s attack once', player_name));
	delete_file(f_player + '-' + 'attack', 'text');
	return()
);
attack_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s attack', player_name));
	delete_file(f_player + '-' + 'attack', 'text');
	return()
);
//丢弃
drop_continuous(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s drop continuous', player_name));
	delete_file(f_player + '-' + 'drop', 'text');
	write_file(f_player + '-' + 'drop', 'text', 0);
	return()
);
drop_interval(player_name,tick) ->(
	f_player = player(player_name);
	__check_offline(player_name);	run(str('player %s drop interval %d', player_name, tick));
	delete_file(f_player + '-' + 'drop', 'text');
	write_file(f_player + '-' + 'drop', 'text', tick);
	return()
);
drop_once(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s drop once', player_name));
	delete_file(f_player + '-' + 'drop', 'text');
	return()
);
drop_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s drop', player_name));
	delete_file(f_player + '-' + 'drop', 'text');
	return()
);
drop_all(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s drop all', player_name));
	return()
);
drop_offhand(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	return()
);
drop_mainhand(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s drop mainhand', player_name));
	return()
);
//丢弃一组
drop_stack_continuous(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack continuous', player_name));
	delete_file(f_player + '-' + 'drop_stack', 'text');
	write_file(f_player + '-' + 'drop_stack', 'text', 0);
	return()
);
drop_stack_interval(player_name,tick) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack interval %d', player_name, tick));
	delete_file(f_player + '-' + 'drop_stack', 'text');
	write_file(f_player + '-' + 'drop_stack', 'text', tick);
	return()
);
drop_stack_once(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack once', player_name));
	delete(global_bot_state:f_player:'drop_stack');
	delete_file(f_player + '-' + 'drop_stack', 'text');
	return()
);
drop_stack_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack', player_name));
	delete_file(f_player + '-' + 'drop_stack', 'text');
	return()
);
drop_stack_all(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack all', player_name));
	return()
);
drop_stack_offhand(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack offhand', player_name));
	return()
);
drop_stack_mainhand(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dropStack mainhand', player_name));
	return()
);
//跳跃
jump_continuous(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s jump continuous', player_name));
	delete_file(f_player + '-' + 'jump', 'text');
	write_file(f_player + '-' + 'jump', 'text', 0);
	return()
);
jump_interval(player_name,tick) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s jump interval %d', player_name, tick));
	delete_file(f_player + '-' + 'jump', 'text');
	write_file(f_player + '-' + 'jump', 'text', tick);
	return()
);
jump_once(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s jump once', player_name));
	delete_file(f_player + '-' + 'jump', 'text');
	return()
);
jump_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s jump', player_name));
	delete_file(f_player + '-' + 'jump', 'text');
	return()
);
//换手
swap_hands_continuous(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s swapHands continuous', player_name));
	delete_file(f_player + '-' + 'swap_hands', 'text');
	write_file(f_player + '-' + 'swap_hands', 'text', 0);
	return()
);
swap_hands_interval(player_name,tick) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s swapHands interval %d', player_name, tick));
	delete_file(f_player + '-' + 'swap_hands', 'text');
	write_file(f_player + '-' + 'swap_hands', 'text', tick);
	return()
);
swap_hands_once(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s swapHands once', player_name));
	delete_file(f_player + '-' + 'swap_hands', 'text');
	return()
);
swap_hands_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s swapHands', player_name));
	delete_file(f_player + '-' + 'swap_hands', 'text');
	return()
);
//右键
use_continuous(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s use continuous', player_name));
	delete_file(f_player + '-' + 'use', 'text');
	write_file(f_player + '-' + 'use', 'text', 0);
	return()
);
use_interval(player_name,tick) ->(
	f_player = player(player_name);
	__check_offline(player_name);	run(str('player %s use interval %d', player_name, tick));
	delete_file(f_player + '-' + 'use', 'text');
	write_file(f_player + '-' + 'use', 'text', tick);
	return()
);
use_once(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s use once', player_name));
	delete_file(f_player + '-' + 'use', 'text');
	return()
);
use_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s use', player_name));
	delete_file(f_player + '-' + 'use', 'text');
	return()
);
//骑乘
mount(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s mount', player_name));
	return()
);
dismount(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s dismount', player_name));
	return()
);
//冲刺
sprint(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s sprint', player_name));
	write_file(f_player + '-' + 'sprint', 'text', tick);
	return()
);
unsprint(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s unsprint', player_name));
	delete_file(f_player + '-' + 'sprint', 'text');
	return()
);
//下蹲
sneak(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s sneak', player_name));
	write_file(f_player + '-' + 'sneak', 'text', tick);
	return()
);
unsneak(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s unsneak', player_name));
	delete_file(f_player + '-' + 'sneak', 'text');
	return()
);
//转向
turn_back(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s turn back', player_name));
	return()
);
turn_left(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s turn left', player_name));
	return()
);
turn_right(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s turn right', player_name));
	return()
);
//看向
look(player_name,rotation) ->(
	print(rotation);
	f_player = player(player_name);
	__check_offline(player_name);
	s_player = player();
	x = (rotation:1)%360;
	y = (rotation:0)%180;
	if(x > 180,
		x = x - 360
	);
	if(x < -180,
		x = x + 360
	);
	if(y > 90,
		y = y - 180
	);
	if(y < -90,
		y = y + 180
	);
	modify(player(player_name), 'yaw', x);
	modify(player(player_name), 'pitch', y);
	print(str('已将'+player_name+'的视角指向§a[%.1f,%.1f]',x,y));
	return()
);
look_up(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look up', player_name));
	return()
);
look_down(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look down', player_name));
	return()
);
look_east(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look east', player_name));
	return()
);
look_north(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look north', player_name));
	return()
);
look_south(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look south', player_name));
	return()
);
look_west(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look west', player_name));
	return()
);
look_pos(player_name, position) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s look at %f %f %f', player_name, position:0, position:1, position:2));
	return()
);
//移动
move_backward(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s move backward', player_name));
	delete_file(f_player + '-' + 'move_vertical', 'text');
	write_file(f_player + '-' + 'move_vertical', 'text', 'backward');
	return()
);
move_forward(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s move forward', player_name));
	delete_file(f_player + '-' + 'move_vertical', 'text');
	write_file(f_player + '-' + 'move_vertical', 'text', 'forward');
	return()
);
move_left(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s move left', player_name));
	delete_file(f_player + '-' + 'move_transverse', 'text');
	write_file(f_player + '-' + 'move_transverse', 'text', 'left');
	return()
);
move_right(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s move right', player_name));
	delete_file(f_player + '-' + 'move_transverse', 'text');
	write_file(f_player + '-' + 'move_transverse', 'text', 'right');
	return()
);
move_stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s move', player_name));
	delete_file(f_player + '-' + 'move_vertical', 'text');
	delete_file(f_player + '-' + 'move_transverse', 'text');
	return()
);
//停止
stop(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	run(str('player %s stop', player_name));
	__delete_all_files(f_player);
	return()
);
//传送
tp(player_name, position) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	s_player = player();
	x = position:0;
	y = position:1;
	if(y>4096 || y<-4096,
		print('§4y值不能超过±4096！');
		return()
	);
	z = position:2;
	print(s_player~'yaw'+'|'+s_player~'pitch');
	run(str('tp %s %f %f %f %f %f', f_player, x, y, z, s_player~'yaw', s_player~'pitch'));
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	return()
);
tp_with_rotation(player_name, position, rotation) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	s_player = player();
	f_player = player(player_name);
	x = position:0;
	y = position:1;
	if(y>4096 || y<-4096,
		print('§4y值不能超过±4096！');
		return()
	);
	z = position:2;
	yaw = (rotation:1)%360;
	pitch = (rotation:0)%180;
	if(yaw > 180,
		yaw = yaw - 360
	);
	if(yaw < -180,
		yaw = yaw + 360
	);
	if(pitch > 90,
		pitch = pitch - 180
	);
	if(pitch < -90,
		pitch = pitch + 180
	);
	run(str('tp %s %f %f %f %f %f', f_player, x, y, z, yaw, pitch));
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	return()
);
tp_to_player(player_name, target_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	s_player = player(target_name);
	if (!s_player,
		print('§4玩家未在线');
		return()
	);
	run(str('tp %s %s', f_player, s_player));
	print(str('已将'+player_name+'传送至'+s_player));
	return()
);
tp_at_bot(player_name, position) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	s_player = player();
	x = position:0;
	y = position:1;
	if(y>4096 || y<-4096,
		print('§4y值不能超过±4096！');
		return()
	);
	z = position:2;
	print(s_player~'yaw'+'|'+s_player~'pitch');
	run(str('execute at %s run tp %s %f %f %f', f_player, x, y, z));
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	return()
);
tp_at_bot_with_rotation(player_name, position, rotation) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	s_player = player();
	f_player = player(player_name);
	x = position:0;
	y = position:1;
	if(y>4096 || y<-4096,
		print('§4y值不能超过±4096！');
		return()
	);
	z = position:2;
	yaw = (rotation:1)%360;
	pitch = (rotation:0)%180;
	if(yaw > 180,
		yaw = yaw - 360
	);
	if(yaw < -180,
		yaw = yaw + 360
	);
	if(pitch > 90,
		pitch = pitch - 180
	);
	if(pitch < -90,
		pitch = pitch + 180
	);
	run(str('execute at %s run tp %s %f %f %f %f %f', f_player, f_player, x, y, z, yaw, pitch));
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	return()
);
//状态检查
check(player_name) ->(
	f_player = player(player_name);
	__check_offline(player_name);
	print('假人“'+f_player+'”：');
	//血量
	inner_health = number(str('%d',query(f_player,'health')+0.9));
	if(inner_health <= 5,
		inner_color = '§4';
	);
	if(inner_health > 5 && inner_health <= 10,
		inner_color = '§c';
	);
	if(inner_health > 10 && inner_health <= 15,
		inner_color = '§e';
	);
	if(inner_health > 15,
		inner_color = '§a';
	);
	print('- 血量：'+inner_color+inner_health);
	//位置
	if(f_player~'dimension' == 'overworld',
		f_dimension = '§2主世界'
	);
	if(f_player~'dimension' == 'the_nether',
		f_dimension = '§4地狱'
	);
	if(f_player~'dimension' == 'the_end',
		f_dimension = '§7末地'
	);
	print(str('- 位于：%s§a[%.2f,%.2f,%.2f]',f_dimension,f_player~'x',f_player~'y',f_player~'z'));
	//指向
	f_yaw = f_player~'yaw';
	if(f_yaw > 180,
		f_yaw = f_yaw - 360
	);
	if(f_yaw < -180,
		f_yaw = f_yaw + 360
	);
	if(f_yaw > -112.5 && f_yaw <= -67.5,
		f_yaw_curt = '东'
	);
	if(f_yaw > -22.5 && f_yaw <= 22.5,
		f_yaw_curt = '南'
	);
	if(f_yaw > 67.5 && f_yaw <= 112.5,
		f_yaw_curt = '西'
	);
	if(f_yaw > 157.5 || f_yaw <= -157.5,
		f_yaw_curt = '北'
	);
	if(f_yaw > -157.5 && f_yaw <= -112.5,
		f_yaw_curt = '东北'
	);
	if(f_yaw > -67.5 && f_yaw <= -22.5,
		f_yaw_curt = '东南'
	);
	if(f_yaw > 112.5 && f_yaw <= 157.5,
		f_yaw_curt = '西北'
	);
	if(f_yaw > 22.5 && f_yaw <= 67.5,
		f_yaw_curt = '西南'
	);
	f_pitch = f_player~'pitch';
	if(f_pitch > -15 && f_pitch <= 15,
		f_pitch_curt = '前方'
	);
	if(f_pitch > 15 && f_pitch <= 75,
		f_pitch_curt = '斜下方'
	);
	if(f_pitch > 75 && f_pitch <= 90,
		f_pitch_curt = '下方'
	);
	if(f_pitch > -75 && f_pitch <= -15,
		f_pitch_curt = '斜上方'
	);
	if(f_pitch >= -90 && f_pitch <= -75,
		f_pitch_curt = '上方'
	);
	print(str('- 指向：§e%s,%s§a[%.1f,%.1f]',f_yaw_curt,f_pitch_curt,f_yaw,f_pitch));
	f_state = global_bot_state:f_player;
	//潜行/疾跑/游泳
	inner_sneak = query(f_player,'sneaking');
	inner_sprint = query(f_player,'sprinting');
	inner_swim = query(f_player,'swimming');
//***************************************************
	noAct = true;
	//攻击/挖掘
	inner_attack = read_file(f_player + '-' + 'attack', 'text'):0;
	if(inner_attack != null,
		if(inner_attack == 0,
			print('- 正在挖掘');
			noAct = false
		);
		if(inner_attack > 0,
			inner_sec = inner_attack/20;
			print('- 每' + inner_attack + '游戏刻（' + inner_sec + '游戏秒）尝试攻击一次');
			noAct = false
		)
	);
	//扔东西
	inner_drop = read_file(f_player + '-' + 'drop', 'text'):0;
	if(inner_drop != null,
		if(inner_drop == 0,
			print('- 正在持续每次扔一个物品');
			noAct = false
		);
		if(inner_drop > 0,
			inner_sec = inner_drop/20;
			print('- 每' + inner_drop + '游戏刻（' + inner_sec + '游戏秒）扔1个物品');
			noAct = false
		)
	);
	inner_drop_stack = read_file(f_player + '-' + 'drop_stack', 'text'):0;
	if(inner_drop_stack != null,
		if(inner_drop_stack == 0,
			print('- 正在持续每次扔一组物品');
			noAct = false
		);
		if(inner_drop > 0,
			inner_sec = inner_drop_stack/20;
			print('- 每' + inner_drop_stack + '游戏刻（' + inner_sec + '游戏秒）扔1个物品');
			noAct = false
		)
	);
	//跳跃
	inner_jump = read_file(f_player + '-' + 'jump', 'text'):0;
	if(inner_jump != null,
		if(inner_jump == 0,
			print('- 正在持续跳跃');
			noAct = false
		);
		if(inner_jump > 0,
			inner_sec = inner_jump/20;
			print('- 每' + inner_jump + '游戏刻（' + inner_sec + '游戏秒）尝试跳跃一次');
			noAct = false
		)
	);
	//换手
	inner_swap_hands = read_file(f_player + '-' + 'swap_hands', 'text'):0;
	if(inner_swap_hands != null,
		if(inner_swap_hands == 0,
			print('- 正在持续交换左右手的物品');
			noAct = false
		);
		if(inner_swap_hands > 0,
			inner_sec = inner_swap_hands/20;
			print('- 每' + inner_swap_hands + '游戏刻（' + inner_sec + '游戏秒）交换一次左右手的物品');
			noAct = false
		)
	);
	//使用物品
	inner_use = read_file(f_player + '-' + 'use', 'text'):0;
	if(inner_use != null,
		if(inner_use == 0,
			print('- 正在持续使♂用物品');
			noAct = false
		);
		if(inner_use > 0,
			inner_sec = inner_use/20;
			print('- 每' + inner_use + '游戏刻（' + inner_sec + '游戏秒）尝试使用一次物♂品');
			noAct = false
		)
	);
	//移动**********************************重点*********************************
	inner_move_vertical = read_file(f_player + '-' + 'move_vertical', 'text'):0;
	inner_move_transverse = read_file(f_player + '-' + 'move_transverse', 'text'):0;
	if(inner_sneak == true,
		if(inner_move_vertical == 'forward',
			if(inner_move_transverse == 'right',
				print('- 正在向右前方潜行↗');
				noAct = false
			);
			if(inner_move_transverse == 'left',
				print('- 正在向左前方潜行↖');
				noAct = false
			);
			if(inner_move_transverse == null,
				print('- 正在向前潜行↑');
				noAct = false
			)
		);
		if(inner_move_vertical == 'backward',
			if(inner_move_transverse == 'right',
				print('- 正在向右后方潜行↘');
				noAct = false
			);
			if(inner_move_transverse == 'left',
				print('- 正在向左后方潜行↙');
				noAct = false
			);
			if(inner_move_transverse == null,
				print('- 正在向后潜行↓');
				noAct = false
			)
		);
		if(inner_move_vertical == null,
			if(inner_move_transverse == 'right',
				print('- 正在向右潜行→');
				noAct = false
			);
			if(inner_move_transverse == 'left',
				print('- 正在向左潜行←');
				noAct = false
			);
			if(inner_move_transverse == null,
				print('- 正在潜伏');
				noAct = false
			)
		)
	);
	if(inner_sprint == true,
		if(inner_swim == true,
			if(inner_move_vertical == 'forward',
				if(inner_move_transverse == 'right',
					print('- 正在向右前方游泳↗');
					noAct = false
				);
				if(inner_move_transverse == 'left',
					print('- 正在向左前方游泳↖');
					noAct = false
				);
				if(inner_move_transverse == null,
					print('- 正在向前游泳↑');
					noAct = false
				)
			);
			if(inner_move_vertical == 'backward',
				if(inner_move_transverse == 'right',
					print('- 正在向右后方游泳↘§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == 'left',
					print('- 正在向左后方游泳↙§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == null,
					print('- 正在向后游泳↓§e（没错它可以开挂）');
					noAct = false
				)
			);
			if(inner_move_vertical == null,
				if(inner_move_transverse == 'right',
					print('- 正在向右游泳→§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == 'left',
					print('- 正在向左游泳←§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == null,
					print('- 正在原地游泳↓§e（没错它可以开挂）');
					noAct = false
				)
			)
		);
		if(inner_swim == false,
			if(inner_move_vertical == 'forward',
				if(inner_move_transverse == 'right',
					print('- 正在向右前方疾跑↗');
					noAct = false
				);
				if(inner_move_transverse == 'left',
					print('- 正在向左前方疾跑↖');
					noAct = false
				);
				if(inner_move_transverse == null,
					print('- 正在向前疾跑↑');
					noAct = false
				)
			);
			if(inner_move_vertical == 'backward',
				if(inner_move_transverse == 'right',
					print('- 正在向右后方疾跑↘§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == 'left',
					print('- 正在向左后方疾跑↙§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == null,
					print('- 正在向后疾跑↓§e（没错它可以开挂）');
					noAct = false
				)
			);
			if(inner_move_vertical == null,
				if(inner_move_transverse == 'right',
					print('- 正在向右疾跑→§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == 'left',
					print('- 正在向左疾跑←§e（没错它可以开挂）');
					noAct = false
				);
				if(inner_move_transverse == null,
					print('- 正在原地疾跑，§e（没错它可以开挂）');
					noAct = false
				)
			)
		);	
	);
	if(inner_sprint == false && inner_sneak == false,
		if(inner_move_vertical == 'forward',
			if(inner_move_transverse == 'right',
				print('- 正在向右前方走↗');
				noAct = false
			);
			if(inner_move_transverse == 'left',
				print('- 正在向左前方走↖');
				noAct = false
			);
			if(inner_move_transverse == null,
				print('- 正在向前走↑');
				noAct = false
			)
		);
		if(inner_move_vertical == 'backward',
			if(inner_move_transverse == 'right',
				print('- 正在向右后方走↘');
				noAct = false
			);
			if(inner_move_transverse == 'left',
				print('- 正在向左后方走↙');
				noAct = false
			);
			if(inner_move_transverse == null,
				print('- 正在向后走↓');
				noAct = false
			)
		);
		if(inner_move_vertical == null,
			if(inner_move_transverse == 'right',
				print('- 正在向右走→');
				noAct = false
			);
			if(inner_move_transverse == 'left',
				print('- 正在向左走←');
				noAct = false
			)
		)
	);
	//乘坐
	inner_mount = f_player~'mount';
	if(inner_mount != null,
		if(inner_mount == 'horse',
			print('- 正在骑马')
		);
		if(inner_mount == 'donkey',
			print('- 正在骑驴')
		);
		if(inner_mount == 'mule',
			print('- 正在骑骡')
		);
		if(inner_mount == 'trader_llama',
			print('- 正在骑羊驼')
		);
		if(inner_mount == 'pig',
			print('- 正在骑猪')
		);
		if(inner_mount == 'skeleton_horse',
			print('- 正在骑骷髅马')
		);
		if(inner_mount == 'zombie_horse',
			print('- 正在骑僵尸马')
		);
		noAct = false
	);
	if(noAct == true,
		print('- 无动作')
	);
	return()
);
checkall() ->(
	i = 0;
	player_list = player('all');
	loop(2147483647,,,
		one_player_str = __player_list(i,player_list);
		if(one_player_str == '',
			break()
		);
		if(scoreboard('carpetBot', one_player_str) == 1,
			check(one_player_str);
			do_fake_player = 1
		);
		i += 1
	);
	if(do_fake_player != 1,
		print('§4当前无假人')
	);
	return()
);