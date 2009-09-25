-- This is roughly based on IHasNoScope from Haste.
-- Tweaks.lua is taken mostly from p3lim
local Eavu = CreateFrame('Frame', 'Eavu')

SetCVar("cameraDistanceMax", "30")

Eavu.PLAYER_LOGIN = function()
	HidePartyFrame()
end

SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

function Eavu:Register(event, method)
	self[event] = method
	self:RegisterEvent(event)
end

function Eavu:Print(...)
	print('|cffff8080So Eavu:|r', ...)
end

Eavu:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
Eavu:RegisterEvent"PLAYER_LOGIN"