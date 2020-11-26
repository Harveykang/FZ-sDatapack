//*************************************************************
//************请将该文件放入"world\scripts"文件夹中************
//*************************************************************
scoreboard_add('carpetBot');
run('team add carpetBot');
run('team modify carpetBot prefix "假的 "');
__command() -> (
	help()
);
__config() -> m( l('stay_loaded', true)); 
global_version = '1.0.0';
global_bot_state = m();
__check_offline(player_name) ->(
	f_player = player(player_name);
	if (!f_player, 
		print('§4假人'+f_player+'未在线');
		exit()
	);
	if (scoreboard('carpetBot', f_player) != 1,
		print('§4'+f_player+'不是假人'+scoreboard('carpetBot', f_player));
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
__check_tick(tick) ->(
	tick = round(number(tick));
	if(tick == null,
		print('§4请输入正确的游戏刻间隔');
		exit()
	);
	if(tick < 2,
		print(tick);
		print(str('§4整数不能小于2，却发现了%d',tick));
		exit()
	);
	return(tick)
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
		scoreboard_remove('carpetBot', player);
		run('team leave '+ player)
	);
);
help() ->(
	print('--使用帮助(/tagplayer)：');
	print('/tagplayer summon <玩家名>\n  -生成假人');
	print('/tagplayer kill <玩家名>\n  -删除假人');
	print('/tagplayer killall\n  -删除全部假人');
	print('/tagplayer tp <玩家名> <x> <y> <z>\n  -传送假人，<x>、<y>、<z>可替换为“s”来代表你的位置');
	print('/tagplayer tp_at_<参数> <玩家名> <x> <y> <z>\n  -以<假人/玩家>为坐标原点传送假人');
	print('/tagplayer check <玩家名>\n  -检查假人状态');
	print('/tagplayer checkall\n  -检查所有假人状态');
	print('/tagplayer look <玩家名> <仰俯> <偏航>\n  -转动假人视角，<x>、<y>可替换为“s”来代表你的视角方向');
	print('/tagplayer look_<up/down/east/west/south/north> <玩家名>\n  -让假人向<上/下/东/西/南/北>方向看');
	print('/tagplayer turn_<back/left/right> <玩家名>\n  -让假人向<后/左/右>方向看');
	print('/tagplayer move_<backward/forward/left/right/stop> <玩家名>\n  -让假人<向前/向后/向左/向右/停止>移动');
	print('/tagplayer <attack/drop/drop_stack/jump/swap_hands/use>_continuous <玩家名>\n  -让假人持续<攻击或挖掘/丢一个物品/丢一组物品/跳跃/换手/使用物品>');
	print('/tagplayer <attack/drop/drop_stack/jump/swap_hands/use>_interval <玩家名> <整数>\n  -让假人每<整数>游戏刻<攻击/丢一个物品/丢一组物品/跳跃/换手/使用物品>一次');
	print('/tagplayer <attack/drop/drop_stack/jump/swap_hands/use>_once <玩家名>\n  -让假人<攻击或挖掘/丢一个物品/丢一组物品/跳跃/换手/使用物品>一次');
	print('/tagplayer <attack/drop/drop_stack/jump/swap_hands/use>_stop <玩家名>\n  -让假人停止<攻击或挖掘/丢一个物品/丢一组物品/跳跃/换手/使用物品>，如果没有动作则和<参数>_once功能一致');
	print('/tagplayer <sneak/unsneak> <玩家名>\n  -让假人<潜行/站立>');
	print('/tagplayer <sprint/unsprint> <玩家名>\n  -让假人准备<疾跑/行走>，在水中疾跑以游泳');
	print('/tagplayer <mount/dismount> <玩家名>\n  -让假人<乘坐/卸下>');
	print('/tagplayer stop <玩家名>\n  -停止假人的一切动作');
	print('Version: '+global_version);
	exit
);
reload() ->(
	run('script unload tagplayer');
	run('script load tagplayer');
	run('tellraw @a {"text":"tagplayer重载成功！"}');
	exit
);
summon(player_name) ->(
	player_name = slice(player_name,0,15);
	__check_online(player_name);
	s_player = player();
	run(str('player %s spawn at %f %f %f facing %f %f', player_name,
		s_player~'x', s_player~'y', s_player~'z', query(s_player, 'yaw'), query(s_player, 'pitch'))
	);
	if (!(player(player_name)),
		exit('§4生成失败')
	);
	scoreboard('carpetBot', player(player_name), 1);
	run('team join carpetBot '+ player(player_name));
	game_tick(50);
	run('tellraw @a {"text":"↑假的"}');
	global_bot_state:player(player_name) = m();
	exit()
);
kill(player_name) ->(
	__check_offline(player_name);
	scoreboard_remove('actimeCounter', player_name);
	run(str('player %s kill', player_name));
	game_tick(50);
	print('已清除'+player_name);
	exit
);
killall() ->(
	i = 0;
	player_list = player('all');
	loop(2147483647,,,
		one_player_str = __player_list(i,player_list);
		if(one_player_str == '',
			break()
		);
		if(query(player(one_player_str),'has_tag',global_tag),
			do_fake_player = 1
		);
		scoreboard_remove('actimeCounter', one_player_str);
		run(str('player %s kill', one_player_str)); 
		i += 1
	);
	if(do_fake_player != 1,
		exit('§4不存在假人');
		''
	);
	game_tick(50);
	print('已清除全部假人');
	exit
);
//攻击
attack_continuous(player_name) ->(
	__check_offline(player_name);
	run(str('player %s attack continuous', player_name));
	global_bot_state:player(player_name):'attack' = '1';
	''
);
attack_interval(player_name,tick) ->(
	__check_offline(player_name);
	tick = __check_tick(tick);
	run(str('player %s attack interval %d', player_name, tick));
	global_bot_state:player(player_name):'attack' = tick;
	''
);
attack_once(player_name) ->(
	__check_offline(player_name);
	run(str('player %s attack once', player_name));
	delete(global_bot_state:player(player_name):'attack');
	''
);
attack_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s attack', player_name));
	delete(global_bot_state:player(player_name):'attack');
	''
);
//丢弃
drop_continuous(player_name) ->(
	__check_offline(player_name);
	run(str('player %s drop continuous', player_name));
	global_bot_state:player(player_name):'drop' = '1';
	''
);
drop_interval(player_name,tick) ->(
	__check_offline(player_name);
	tick = __check_tick(tick);
	run(str('player %s drop interval %d', player_name, tick));
	global_bot_state:player(player_name):'drop' = tick;
	''
);
drop_once(player_name) ->(
	__check_offline(player_name);
	run(str('player %s drop once', player_name));
	delete(global_bot_state:player(player_name):'drop');
	''
);
drop_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s drop', player_name));
	delete(global_bot_state:player(player_name):'drop');
	''
);
drop_all(player_name) ->(
	__check_offline(player_name);
	run(str('player %s drop all', player_name));
	''
);
drop_offhand(player_name) ->(
	__check_offline(player_name);
	''
);
drop_mainhand(player_name) ->(
	__check_offline(player_name);
	run(str('player %s drop mainhand', player_name));
	''
);
//丢弃一组
drop_stack_continuous(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dropStack continuous', player_name));
	global_bot_state:player(player_name):'drop_stack' = '1';
	''
);
drop_stack_interval(player_name,tick) ->(
	__check_offline(player_name);
	tick = __check_tick(tick);
	run(str('player %s dropStack interval %d', player_name, tick));
	global_bot_state:player(player_name):'drop_stack' = tick;
	''
);
drop_stack_once(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dropStack once', player_name));
	delete(global_bot_state:player(player_name):'drop_stack');
	''
);
drop_stack_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dropStack', player_name));
	delete(global_bot_state:player(player_name):'drop_stack');
	''
);
drop_stack_all(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dropStack all', player_name));
	''
);
drop_stack_offhand(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dropStack offhand', player_name));
	''
);
drop_stack_mainhand(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dropStack mainhand', player_name));
	''
);
//跳跃
jump_continuous(player_name) ->(
	__check_offline(player_name);
	run(str('player %s jump continuous', player_name));
	global_bot_state:player(player_name):'jump' = '1';
	''
);
jump_interval(player_name,tick) ->(
	__check_offline(player_name);
	tick = __check_tick(tick);
	run(str('player %s jump interval %d', player_name, tick));
	global_bot_state:player(player_name):'jump' = tick;
	''
);
jump_once(player_name) ->(
	__check_offline(player_name);
	run(str('player %s jump once', player_name));
	delete(global_bot_state:player(player_name):'jump');
	''
);
jump_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s jump', player_name));
	delete(global_bot_state:player(player_name):'jump');
	''
);
//换手
swap_hands_continuous(player_name) ->(
	__check_offline(player_name);
	run(str('player %s swapHands continuous', player_name));
	global_bot_state:player(player_name):'swap_hands' = '1';
	''
);
swap_hands_interval(player_name,tick) ->(
	__check_offline(player_name);
	tick = __check_tick(tick);
	run(str('player %s swapHands interval %d', player_name, tick));
	global_bot_state:player(player_name):'swap_hands' = tick;
	''
);
swap_hands_once(player_name) ->(
	__check_offline(player_name);
	run(str('player %s swapHands once', player_name));
	delete(global_bot_state:player(player_name):'swap_hands');
	''
);
swap_hands_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s swapHands', player_name));
	delete(global_bot_state:player(player_name):'swap_hands');
	''
);
//右键
use_continuous(player_name) ->(
	__check_offline(player_name);
	run(str('player %s use continuous', player_name));
	global_bot_state:player(player_name):'use' = '1';
	''
);
use_interval(player_name,tick) ->(
	__check_offline(player_name);
	tick = __check_tick(tick);
	run(str('player %s use interval %d', player_name, tick));
	global_bot_state:player(player_name):'use' = tick;
	''
);
use_once(player_name) ->(
	__check_offline(player_name);
	run(str('player %s use once', player_name));
	delete(global_bot_state:player(player_name):'use');
	''
);
use_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s use', player_name));
	delete(global_bot_state:player(player_name):'use');
	''
);
//骑乘
mount(player_name) ->(
	__check_offline(player_name);
	run(str('player %s mount', player_name));
	''
);
dismount(player_name) ->(
	__check_offline(player_name);
	run(str('player %s dismount', player_name));
	''
);
//冲刺
sprint(player_name) ->(
	__check_offline(player_name);
	run(str('player %s sprint', player_name));
	''
);
unsprint(player_name) ->(
	__check_offline(player_name);
	run(str('player %s unsprint', player_name));
	''
);
//下蹲
sneak(player_name) ->(
	__check_offline(player_name);
	run(str('player %s sneak', player_name));
	''
);
unsneak(player_name) ->(
	__check_offline(player_name);
	run(str('player %s unsneak', player_name));
	''
);
//转向
turn_back(player_name) ->(
	__check_offline(player_name);
	run(str('player %s turn back', player_name));
	''
);
turn_left(player_name) ->(
	__check_offline(player_name);
	run(str('player %s turn left', player_name));
	''
);
turn_right(player_name) ->(
	__check_offline(player_name);
	run(str('player %s turn right', player_name));
	''
);
//看向
look(player_name,x,y) ->(
	__check_offline(player_name);
	s_player = player();
	if(x == 's',
		x = s_player~'yaw';
	);
	if(y == 's',
		y = s_player~'pitch'
	);
	x = __check_pos(x);
	y = __check_pos(y);
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
	''
);
look_up(player_name) ->(
	__check_offline(player_name);
	run(str('player %s look up', player_name));
	''
);
look_down(player_name) ->(
	__check_offline(player_name);
	run(str('player %s look down', player_name));
	''
);
look_east(player_name) ->(
	__check_offline(player_name);
	run(str('player %s look east', player_name));
	''
);
look_north(player_name) ->(
	__check_offline(player_name);
	run(str('player %s look north', player_name));
	''
);
look_south(player_name) ->(
	__check_offline(player_name);
	run(str('player %s look south', player_name));
	''
);
look_west(player_name) ->(
	__check_offline(player_name);
	run(str('player %s look west', player_name));
	''
);
//移动
move_backward(player_name) ->(
	__check_offline(player_name);
	run(str('player %s move backward', player_name));
	global_bot_state:player(player_name):'move_vertical' = 'backward';
	''
);
move_forward(player_name) ->(
	__check_offline(player_name);
	run(str('player %s move forward', player_name));
	global_bot_state:player(player_name):'move_vertical' = 'forward';
	''
);
move_left(player_name) ->(
	__check_offline(player_name);
	run(str('player %s move left', player_name));
	global_bot_state:player(player_name):'move_transverse' = 'left';
	''
);
move_right(player_name) ->(
	__check_offline(player_name);
	run(str('player %s move right', player_name));
	global_bot_state:player(player_name):'move_transverse' = 'right';
	''
);
move_stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s move', player_name));
	delete(global_bot_state:player(player_name):'move');
	''
);
//停止
stop(player_name) ->(
	__check_offline(player_name);
	run(str('player %s stop', player_name));
	''
);
//传送
tp(player_name,x,y,z) ->(
	__check_offline(player_name);
	s_player = player();
	f_player = player(player_name);
	if(x == 's',
		__check_dim(s_player,f_player);
		x = s_player~'x'
	);
	if(y == 's',
		__check_dim(s_player,f_player);
		y = s_player~'y'
	);
	if(z == 's',
		__check_dim(s_player,f_player);
		z = s_player~'z'
	);
	x = __check_pos(x);
	y = __check_pos(y);
	if(y>4096,
		exit('§4y值不能超过4096！');
		''
	);
	z = __check_pos(z);
	modify(f_player,'pos',x,y,z);
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	''
);
tp_at_player(player_name,x,y,z) ->(
	__check_offline(player_name);
	s_player = player();
	f_player = player(player_name);
	__check_dim(s_player,f_player);
	x = s_player~'x'+__check_pos(x);
	y = s_player~'y'+__check_pos(y);
	if(y>4096,
		exit('§4y值不能超过4096！');
		''
	);
	z = s_player~'z'+__check_pos(z);
	modify(f_player,'pos',x,y,z);
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	''
);
tp_at_bot(player_name,x,y,z) ->(
	__check_offline(player_name);
	f_player = player(player_name);
	x = f_player~'x'+__check_pos(x);
	y = f_player~'y'+__check_pos(y);
	if(y>4096,
		exit('§4y值不能超过4096！');
		''
	);
	z = f_player~'z'+__check_pos(z);
	modify(f_player,'pos',x,y,z);
	print(str('已将'+player_name+'传送至§a[%.2f,%.2f,%.2f]',x,y,z));
	''
);
//状态检查
check(player_name) ->(
	__check_offline(player_name);
	f_player = player(player_name);
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
	if(f_state == m() && inner_sneak == false && inner_sprint == false,
		print('- 无动作');
		''
	);
	if(f_state != m() || inner_sneak == true || inner_sprint == true,
		//攻击/挖掘
		if(f_state:'attack' != null,
			if(f_state:'attack' == 1,
				print('- 正在疯狂输出（然并卵）或挖掘')
			);
			if(f_state:'attack' > 1,
				inner_sec = f_state:'attack'/20;
				print('- 每'+f_state:'attack'+'游戏刻（'+inner_sec+'游戏秒）尝试攻击一次')
			)
		);
		//扔东西
		if(f_state:'drop' != null,
			inner_sec = f_state:'drop'/20;
			print('- 每'+f_state:'drop'+'游戏刻（'+inner_sec+'游戏秒）扔1个物品')
		);
		if(f_state:'drop_stack' != null,
			inner_sec = f_state:'drop_stack'/20;
			print('- 每'+f_state:'drop_stack'+'游戏刻（'+inner_sec+'游戏秒）扔1组物品')
		);
		//跳跃
		if(f_state:'jump' != null,
			if(f_state:'jump' == 1,
				print('- 正在持续跳跃')
			);
			if(f_state:'jump' > 1,
				inner_sec = f_state:'jump'/20;
				print('- 每'+f_state:'jump'+'游戏刻（'+inner_sec+'游戏秒）尝试跳跃一次')
			)
		);
		//换手
		if(f_state:'swap_hands' != null,
			inner_sec = f_state:'swap_hands'/20;
			print('- 每'+f_state:'swap_hands'+'游戏刻（'+inner_sec+'游戏秒）交换一次左右手的物品')
		);
		//使用物品
		if(f_state:'use' != null,
			if(f_state:'use' == 1,
				print('- 正在持续使♂用物品')
			);
			if(f_state:'use' > 1,
				inner_sec = f_state:'use'/20;
				print('- 每'+f_state:'use'+'游戏刻（'+inner_sec+'游戏秒）尝试使用一次物♂品')
			)
		);
		//移动**********************************重点*********************************
		if(f_state:'move_vertical' != null || f_state:'move_transverse' != null,
			if(inner_sneak == true,
				if(f_state:'move_vertical' == 'forward',
					if(f_state:'move_transverse' == 'right',
						print('- 正在向右前方潜行↗')
					);
					if(f_state:'move_transverse' == 'left',
						print('- 正在向左前方潜行↖')
					);
					if(f_state:'move_transverse' == null,
						print('- 正在向前潜行↑');
					)
				);
				if(f_state:'move_vertical' == 'backward',
					if(f_state:'move_transverse' == 'right',
						print('- 正在向右后方潜行↘')
					);
					if(f_state:'move_transverse' == 'left',
						print('- 正在向左后方潜行↙')
					);
					if(f_state:'move_transverse' == null,
						print('- 正在向后潜行↓');
					)
				)
			);
			if(inner_sprint == true,
				if(inner_swim == true,
					if(f_state:'move_vertical' == 'forward',
						if(f_state:'move_transverse' == 'right',
							print('- 正在向右前方游泳↗')
						);
						if(f_state:'move_transverse' == 'left',
							print('- 正在向左前方游泳↖')
						);
						if(f_state:'move_transverse' == null,
							print('- 正在向前游泳↑');
						)
					);
					if(f_state:'move_vertical' == 'backward',
						if(f_state:'move_transverse' == 'right',
							print('- 正在向右后方游泳↘')
						);
						if(f_state:'move_transverse' == 'left',
							print('- 正在向左后方游泳↙')
						);
						if(f_state:'move_transverse' == null,
							print('- 正在向后游泳↓');
						)
					)
				);
				if(inner_swim == false,
					if(f_state:'move_vertical' == 'forward',
						if(f_state:'move_transverse' == 'right',
							print('- 正在向右前方疾跑↗')
						);
						if(f_state:'move_transverse' == 'left',
							print('- 正在向左前方疾跑↖')
						);
						if(f_state:'move_transverse' == null,
							print('- 正在向前疾跑↑');
						)
					);
					if(f_state:'move_vertical' == 'backward',
						if(f_state:'move_transverse' == 'right',
							print('- 正在向右后方疾跑↘§e（没错它可以开挂）')
						);
						if(f_state:'move_transverse' == 'left',
							print('- 正在向左后方疾跑↙§e（没错它可以开挂）')
						);
						if(f_state:'move_transverse' == null,
							print('- 正在向后疾跑↓§e（没错它可以开挂）');
						)
					)
				);
				
			);
			if(inner_sprint == false && inner_sneak == false,
				if(f_state:'move_vertical' == 'forward',
					if(f_state:'move_transverse' == 'right',
						print('- 正在向右前方走↗')
					);
					if(f_state:'move_transverse' == 'left',
						print('- 正在向左前方走↖')
					);
					if(f_state:'move_transverse' == null,
						print('- 正在向前走↑');
					)
				);
				if(f_state:'move_vertical' == 'backward',
					if(f_state:'move_transverse' == 'right',
						print('- 正在向右后方走↘')
					);
					if(f_state:'move_transverse' == 'left',
						print('- 正在向左后方走↙')
					);
					if(f_state:'move_transverse' == null,
						print('- 正在向后走↓');
					)
				);
			)
		);
		if(f_state:'move_vertical' == null && f_state:'move_transverse' == null && inner_sneak == true,
			print('- 正在潜行')
		);
		if(f_state:'move_vertical' == null && f_state:'move_transverse' == null && inner_sprint == true && inner_swim == false,
			print('- 正在原地疾跑')
		);
		if(f_state:'move_vertical' == null && f_state:'move_transverse' == null && inner_swim == true,
			print('- 正在原地游泳')
		)
	);
	''
);
checkall() ->(
	i = 0;
	player_list = player('all');
	loop(2147483647,,,
		one_player_str = __player_list(i,player_list);
		if(one_player_str == '',
			break()
		);
		if(query(player(one_player_str),'has_tag',global_tag),
			check(one_player_str);
			do_fake_player = 1
		);
		i += 1
	);
	if(do_fake_player != 1,
		print('§4当前无假人')
	);
	''
);