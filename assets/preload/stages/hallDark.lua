function onCreate()
  --background
  makeLuaSprite('bg','halldark',-195,-70)
  makeLuaSprite('bg2','battle',160,-625)
  scaleObject('bg',1.7,1.5)
  scaleObject('bg2',2,2)
  addLuaSprite('bg2',false)
  addLuaSprite('bg',false)
end