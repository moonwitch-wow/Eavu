local _, Eavu = ...

ReadyCheckListenerFrame:SetScript('OnShow', nil)
function Eavu.READY_CHECK()
	PlaySoundFile([=[Sound\Interface\ReadyCheck.wav]=])
end

function Eavu.LFG_PROPOSAL_SHOW()
	PlaySoundFile([=[Sound\Interface\ReadyCheck.wav]=])
end

function Eavu.PLAYER_REGEN_ENABLED()
UIErrorsFrame:AddMessage('-- Combat', 1, 1, 1)
end

function Eavu.PLAYER_REGEN_DISABLED()
UIErrorsFrame:AddMessage('++ Combat', 1, 1, 1)
end