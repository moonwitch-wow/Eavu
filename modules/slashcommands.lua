-- Slash Commands
SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame

SLASH_JOURNAL1 = '/ej'
SlashCmdList.JOURNAL = function()
	ToggleFrame(EncounterJournal)
end