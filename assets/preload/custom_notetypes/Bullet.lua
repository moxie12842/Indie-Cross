function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local shootAnims = {"gun", "gun", "gun", "gun"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet' then
		if difficulty <= 1 then
			playSound('picoshoot', 1.2);
		end
--		characterPlayAnim('dad', shootAnims[direction + 1], true);
		setProperty('dad.specialAnim', true)
		characterPlayAnim('boyfriend', 'dodge', false);
		setProperty('boyfriend.specialAnim', false)
    end
end	

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet' and difficulty <= 1 then
		setProperty('health', -1);
		playSound('picoshoot', 1.2);
	elseif noteType == 'Bullet' and difficulty <= 1 then
		setProperty('health', getProperty('health')-0.8);
		runTimer('bleed', 0.2, 20);
		playSound('picoshoot', 1.2);
		characterPlayAnim('boyfriend', 'hurt', false);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end