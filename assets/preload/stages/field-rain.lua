function onCreate()
  --background
  makeLuaSprite('floor','cup/CH-RN-02',-1050,-750)
  scaleObject('floor',3.5,3.5)
  makeAnimatedLuaSprite('camera','cup/oldtimey',0,0)
  addAnimationByPrefix('camera','idle','Cupheadshit_gif instance 1',24,true)
  objectPlayAnimation('camera','idle',true)
  scaleObject('camera',2,2)
  setObjectCamera('camera','hud')
  makeAnimatedLuaSprite('rain','cup/rain',0,0)
  addAnimationByPrefix('rain','idle','RainFirstlayer instance 1',15,true)
  objectPlayAnimation('rain','idle',true)
  scaleObject('rain',2,2)
  setObjectCamera('rain','hud')
  addLuaSprite('floor',false)
  addLuaSprite('rain',false)
  addLuaSprite('camera',true)
  close(true);
  end