__config() -> {
	'stay_loaded' -> true
};
__command() -> (
	s_player = player();
	pos = query(s_player, 'pos');
	dim = query(s_player, 'dimension');
	scoreboard_add('here_pos_x');
	scoreboard_add('here_pos_y');
	scoreboard_add('here_pos_z');
	scoreboard('here_pos_x',s_player,round(get(pos, 0)));
	scoreboard('here_pos_y',s_player,round(get(pos, 1)));
	scoreboard('here_pos_z',s_player,round(get(pos, 2)));
	run(str('tellraw @s [{"selector": "@s"},{"text":"说：我在[x:","color": "aqua"},{"score": {"objective": "here_pos_x","name": "%s"}},{"text": ", y:"},{"score": {"objective": "here_pos_y","name": "%s"}},{"text": ", z:"},{"score": {"objective": "here_pos_z","name": "%s"}},{"text": ", dim:%s]"}]',
		s_player, s_player, s_player, dim
	));
	scoreboard_remove('here_pos_x');
	scoreboard_remove('here_pos_y');
	scoreboard_remove('here_pos_z');
	exit()
)