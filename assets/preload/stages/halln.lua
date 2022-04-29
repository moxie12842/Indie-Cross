function onCreate()
  --background
  makeAnimatedLuaSprite('bg','Nightmare Sans Stage',-300,-250)
  addAnimationByPrefix('bg','idle','Normal instance 1',24,true)
  addAnimationByPrefix('bg','floor','Normal',24,true)
  addAnimationByPrefix('bg','wall','sd',15,false)
  objectPlayAnimation('bg','idle',true)
  scaleObject('bg',2.6,2.6)
  addLuaSprite('bg',false)
end
function onStepHit()
  if curStep==490 then
    objectPlayAnimation('bg','floor',true)
    end
  if curStep==512 then
    objectPlayAnimation('bg','wall',true)
  end
  if curStep==774 then
    objectPlayAnimation('bg','floor',true)
  end
  end