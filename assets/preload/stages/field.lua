function onCreate()
  --background
  makeLuaSprite('floor','cup/Foreground',-820,-620)
  scaleObject('floor',1.6,1.6)
  makeAnimatedLuaSprite('camera','cup/oldtimey',0,0)
  addAnimationByPrefix('camera','idle','Cupheadshit_gif instance 1',24,true)
  objectPlayAnimation('camera','idle',true)
  scaleObject('camera',2,2)
  setObjectCamera('camera','hud')
  addLuaSprite('floor',false)
  addLuaSprite('camera',true)
  close(true);
  end