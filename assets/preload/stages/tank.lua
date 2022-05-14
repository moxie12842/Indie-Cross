-- Lua stuff
tankX = 400;
tankSpeed = 0;
tankAngle = 0;
startedPlaying = false;

function onCreate()
	-- background shit
	math.randomseed(getSongPosition() / 100);
	tankSpeed = math.random(5, 7);
	tankAngle = math.random(-90, 45);
	makeLuaSprite('tankSky', 'tankSky', -400, -400);
	setLuaSpriteScrollFactor('tankSky', 0, 0);

	makeLuaSprite('tankBuildings', 'tankBuildings', -200, 0);
	setLuaSpriteScrollFactor('tankBuildings', 0.3, 0.3);
	scaleObject('tankBuildings', 1.1, 1.1);

	makeLuaSprite('tankRuins', 'tankRuins', -200, 0);
	setLuaSpriteScrollFactor('tankRuins', 0.35, 0.35);
	scaleObject('tankRuins', 1.1, 1.1);

	makeAnimatedLuaSprite('tankWatchtower', 'tankWatchtower', 100, 50);
	luaSpriteAddAnimationByPrefix('tankWatchtower', 'idle', 'watchtower', 24, false);
	setLuaSpriteScrollFactor('tankWatchtower', 0.5, 0.5);

	makeAnimatedLuaSprite('tankRolling', 'tankRolling', 300, 0);
	luaSpriteAddAnimationByPrefix('tankRolling', 'idle', 'BG tank w lighting', 24, true);
	setLuaSpriteScrollFactor('tankRolling', 0.5, 0.7);

	makeLuaSprite('tankGround', 'tankGround', -420, -150);
	scaleObject('tankGround', 1.15, 1.15);
	
	-- those are only loaded if you have Low quality turned off, to decrease loading times and memory
	if not lowQuality then
		makeLuaSprite('tankClouds', 'tankClouds', math.random(-700, -100), math.random(-20, 20));
		setLuaSpriteScrollFactor('tankClouds', 0.1, 0.1);
		setProperty('tankClouds.velocity.x', math.random(5, 15));

		makeLuaSprite('tankMountains', 'tankMountains', -300, -20);
		setLuaSpriteScrollFactor('tankMountains', 0.2, 0.2);
		scaleObject('tankMountains', 1.2, 1.2);

		makeAnimatedLuaSprite('smokeLeft', 'smokeLeft', -200, -100);
		luaSpriteAddAnimationByPrefix('smokeLeft', 'idle', 'SmokeBlurLeft');
		setLuaSpriteScrollFactor('smokeLeft', 0.4, 0.4);

		makeAnimatedLuaSprite('smokeRight', 'smokeRight', 1100, -100);
		luaSpriteAddAnimationByPrefix('smokeRight', 'idle', 'SmokeRight');
		setLuaSpriteScrollFactor('smokeRight', 0.4, 0.4);
	end

	addLuaSprite('tankSky', false);
	addLuaSprite('tankClouds', false);
	addLuaSprite('tankMountains', false);
	addLuaSprite('tankBuildings', false);
	addLuaSprite('tankRuins', false);
	addLuaSprite('smokeLeft', false);
	addLuaSprite('smokeRight', false);
	addLuaSprite('tankWatchtower', false);
	addLuaSprite('tankRolling', false);
	addLuaSprite('tankGround', false);


	-- foreground shit
	makeAnimatedLuaSprite('tank0', 'tank0', -500, 650);
	luaSpriteAddAnimationByPrefix('tank0', 'idle', 'fg', 24, false);
	setLuaSpriteScrollFactor('tank0', 1.7, 1.5);
	
	makeAnimatedLuaSprite('tank2', 'tank2', 450, 940);
	luaSpriteAddAnimationByPrefix('tank2', 'idle', 'foreground', 24, false);
	setLuaSpriteScrollFactor('tank2', 1.5, 1.5);
	
	makeAnimatedLuaSprite('tank5', 'tank5', 1620, 700);
	luaSpriteAddAnimationByPrefix('tank5', 'idle', 'fg', 24, false);
	setLuaSpriteScrollFactor('tank5', 1.5, 1.5);
	
	if not lowQuality then
		makeAnimatedLuaSprite('tank1', 'tank1', -300, 1050);
		luaSpriteAddAnimationByPrefix('tank1', 'idle', 'fg', 24, false);
		setLuaSpriteScrollFactor('tank1', 2.0, 2.0);
		
		makeAnimatedLuaSprite('tank4', 'tank4', 1300, 900);
		luaSpriteAddAnimationByPrefix('tank4', 'idle', 'fg', 24, false);
		setLuaSpriteScrollFactor('tank4', 1.5, 1.5);
		
		makeAnimatedLuaSprite('tank3', 'tank3', 1300, 1200);
		luaSpriteAddAnimationByPrefix('tank3', 'idle', 'fg', 24, false);
		setLuaSpriteScrollFactor('tank3', 3.5, 2.5);
	end

	addLuaSprite('tank0', true);
	addLuaSprite('tank1', true);
	addLuaSprite('tank2', true);
	addLuaSprite('tank4', true);
	addLuaSprite('tank5', true);
	addLuaSprite('tank3', true);

	moveTank(0);
	print('finished loading stage successfully')
end

function onUpdate(elapsed)
	moveTank(elapsed);
end

function moveTank(elapsed)
	if not inCutscene then
		tankAngle = tankAngle + (elapsed * tankSpeed);
		setProperty('tankRolling.angle', tankAngle - 90 + 15);
		setProperty('tankRolling.x', tankX + (1500 * math.cos(math.pi / 180 * (1 * tankAngle + 180))));
		setProperty('tankRolling.y',1350 + (1100 * math.sin(math.pi / 180 * (1 * tankAngle + 180))));
	end
end

-- Gameplay/Song interactions
function onBeatHit()
	-- triggered 4 times per section
	luaSpritePlayAnimation('tankWatchtower', 'idle', true);
	luaSpritePlayAnimation('tank0', 'idle', true);
	luaSpritePlayAnimation('tank1', 'idle', true);
	luaSpritePlayAnimation('tank2', 'idle', true);
	luaSpritePlayAnimation('tank3', 'idle', true);
	luaSpritePlayAnimation('tank4', 'idle', true);
	luaSpritePlayAnimation('tank5', 'idle', true);
end

function onCountdownTick(counter)
	onBeatHit();
end