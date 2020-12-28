__config() -> {
	'stay_loaded' -> true
};
__command() -> (
	run('gamemode spectator');
	run('execute at @s run tp @s ~ ~0.2 ~')
)