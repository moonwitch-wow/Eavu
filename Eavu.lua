-- This is roughly based on IHasNoScope from Haste.
-- Tweaks.lua is taken mostly from p3lim

-- Some constants
local _G = _G
local _, Eavu = ...
local fontSize = 14
local EavuUiScale = GetCVar('uiScale')
local res = GetCVar('gxResolution')

-- I got tired of typing this all the damn time k?
local backdrop = {bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}}

function Eavu.GetScreen(hor, ver)
	local horScreen = string.match(({GetScreenResolutions()})[res], '(%d+)x%d+') 
	local verScreen = string.match(({GetScreenResolutions()})[res], '%d+x(%d+)')
	if arg1 == 'hor' then
		return horScreen
	elseif arg1 == 'ver' then
		return verScreen
	else
		return
	end
end

Eavu.dummy = function() end

local mult = 768/string.match(GetCVar('gxResolution'), '%d+x(%d+)')/(EavuUiScale or 1)

local function scale(x)
    return mult*math.floor(x/mult+.5)
end

function Eavu.Scale(x) return scale(x) end

function Eavu.CreatePanel(f, w, h, anchor1, parent, anchor2, x, y)
	sh = scale(h)
	sw = scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata('BACKGROUND')
	f:SetPoint(anchor1, parent, anchor2, x, y)
	f:SetBackdrop(backdrop)
	f:SetBackdropColor(unpack(EavuDB['media'].backdropcolor))
	f:SetBackdropBorderColor(unpack(EavuDB['media'].bordercolor))
end

function Eavu.Print(...)
	print('|cffff8080 Eavu.|r', ...)
end

-- Slash Commands
SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame

SLASH_JOURNAL1 = '/ej'
SlashCmdList.JOURNAL = function()
	ToggleFrame(EncounterJournal)
end

function Eavu.ADDON_LOADED(event, addon)
	self:UnregisterEvent("ADDON_LOADED")
	self.ADDON_LOADED = nil
	
	if(name ~= 'Blizzard_GMChatUI') then return end

	GMChatFrame:EnableMouseWheel()
	GMChatFrame:SetScript('OnMouseWheel', ChatFrame1:GetScript('OnMouseWheel'))
	GMChatFrame:SetHeight(GMChatFrame:GetHeight() * 3)

	if IsLoggedIn() then self:PLAYER_LOGIN() else self:RegisterEvent("PLAYER_LOGIN") end
end

function Eavu.PLAYER_LOGIN()
	self:RegisterEvent("PLAYER_LOGOUT")

	HidePartyFrame()
	Eavu.CreateLayout()

	self:UnregisterEvent("PLAYER_LOGIN")
	self.PLAYER_LOGIN = nil
end

function Eavu.PLAYER_LOGOUT()
	-- Do anything you need to do as the player logs out
end