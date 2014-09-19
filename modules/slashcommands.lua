local addonName, ns = ...
-- Slash Commands
SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame

SLASH_PROF1 = '/prof'
SLASH_PROF2 = '/professions'
SlashCmdList.PROF = function()
  CastSpell('Cooking')
end

SLASH_TEST1 = '/uitest'
SlashCmdList.TEST = function()
  print(addonName)
end