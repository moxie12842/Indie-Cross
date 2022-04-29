function onStepHit()
  if curStep==765 then
    setProperty('bg.visible',false)
    end
  if curStep==1277 then
    setProperty('bg.visible',true)
  end
  if curStep==896 then
    makeLuaSprite('black1','black',0,570)
    setObjectCamera('black1','other')
    scaleObject('black1',4,4)
    makeLuaSprite('black2','black',0,-570)
    setObjectCamera('black2','hud')
    scaleObject('black2',4,4)
    addLuaSprite('black1',false)
    addLuaSprite('black2',false)
  end
  if curStep==1149 then
    doTweenAlpha('black1','black1',0,1)
    doTweenAlpha('black2','black2',0,1)
  end
  if curStep==1791 then
    makeLuaSprite('bg3','white',-600,0)
    scaleObject('bg3',6000,6000)
    makeLuaSprite('black3','black',0,570)
    setObjectCamera('black3','other')
    scaleObject('black3',4,4)
    makeLuaSprite('black4','black',0,-570)
    setObjectCamera('black4','hud')
    scaleObject('black4',4,4)
    addLuaSprite('bg3',false)
    addLuaSprite('black3',false)
    addLuaSprite('black4',false)
  end
  if curStep==2048 then
    doTweenAlpha('white','bg3',0,0.1)
    doTweenAlpha('black5','black3',0,0.1)
    doTweenAlpha('black6','black4',0,0.1)
    end
  end