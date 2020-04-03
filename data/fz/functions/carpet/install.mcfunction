scoreboard objectives add carpet dummy
scoreboard players reset script carpet
team add fakePlayer
team modify fakePlayer prefix [{"text":"假的 "}]
function fz:carpet/script
scoreboard players set carpet installed 1