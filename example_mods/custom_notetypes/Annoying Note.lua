function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Annoying Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'ANNOYINGNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Annoying Note' then
                              startVideo('annoyingsound');
		setProperty('health', -500);
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == "Annoying Note" then
		characterPlayAnim('BF','dodge',false)
		playSound('bahhumbug',1,'bahhumbugsnd')
		characterPlayAnim('GF','scared',false)
	end
end