function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf');
	makeLuaSprite('bg1', 'shootout/sky', 1320, 620);
	addLuaSprite('bg1', false);
	makeLuaSprite('bg2', 'shootout/buildings', 1320, 620);
	addLuaSprite('bg2', false);
	makeLuaSprite('bg3', 'shootout/building_platform', 1320, 620);
	addLuaSprite('bg3', false);
end