--[[ Last receipt in mail ]]
do
	local last
	Eavu:Register('MAIL_SEND_SUCCESS', function()
		if(last) then
			SendMailNameEditBox:SetText(last)
			SendMailNameEditBox:HighlightText()
		end
	end)

	local orig = SendMailFrame_SendMail
	function SendMailFrame_SendMail(...)
		last = SendMailNameEditBox:GetText()
		orig(...)
	end
end

--[[ Force readycheck warning ]]
ReadyCheckListenerFrame:SetScript('OnShow', nil)
Eavu:Register('READY_CHECK', function()
	PlaySoundFile([=[Sound\Interface\ReadyCheck.wav]=])
end)

--[[ Force LFG invite warning ]]
Eavu:Register('LFG_PROPOSAL_SHOW', function()
	PlaySoundFile([=[Sound\Interface\ReadyCheck.wav]=])
end)

Eavu:Register('PLAYER_REGEN_ENABLED', function()
UIErrorsFrame:AddMessage('-- Combat', 1, 1, 1)
end)

Eavu:Register('PLAYER_REGEN_DISABLED', function()
UIErrorsFrame:AddMessage('++ Combat', 1, 1, 1)
end)

--[[ GM chat frame enhancement ]]
Eavu:Register('ADDON_LOADED', function(self, event, name)
	if(name ~= 'Blizzard_GMChatUI') then return end

	GMChatFrame:EnableMouseWheel()
	GMChatFrame:SetScript('OnMouseWheel', ChatFrame1:GetScript('OnMouseWheel'))
	GMChatFrame:SetHeight(GMChatFrame:GetHeight() * 3)

	self:UnregisterEvent(event)
end)

--[[ GM ticket shortcut ]]
SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame


