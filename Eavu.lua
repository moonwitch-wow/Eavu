-- This is roughly based on IHasNoScope from Haste.
-- Tweaks.lua is taken mostly from p3lim

-- Some constants
local _G = _G
local Eavu = CreateFrame('Frame', 'Eavu')
local fontSize = 14
--local uiScale = SetCVar("uiScale", 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))

function Eavu:GetScreen()
	local screenRes = string.match(({GetScreenResolutions()})[GetCurrentResolution()], "(%d+)x%d+") 
	return screenRes
end

function Eavu:Register(event, method)
	self[event] = method
	self:RegisterEvent(event)
end

Eavu.dummy = function() end

local mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/EavuDB["general"].uiscale
local function scale(x)
    return mult*math.floor(x/mult+.5)
end

function Eavu:Scale(x) return scale(x) end
Eavu.mult = mult

function Eavu:CreatePanel(f, w, h, anchor1, parent, anchor2, x, y)
	sh = scale(h)
	sw = scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(h)
	f:SetWidth(w)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(anchor1, parent, anchor2, x, y)
	f:SetBackdrop({
	  bgFile = EavuDB["media"].blank, 
	  edgeFile = EavuDB["media"].blank, 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	f:SetBackdropColor(unpack(EavuDB["media"].backdropcolor))
	f:SetBackdropBorderColor(unpack(EavuDB["media"].bordercolor))
end

local function CreateLayout()  -- Cvars and Chatsettings :P
	SetCVar("deselectOnClick", 0)
	SetCVar("autoLootDefault", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("autoDismountFlying", 1)
	SetCVar("threatShowNumeric", 0)
	SetCVar("showLootSpam", 0)
	SetCVar("advancedWatchFrame", 1)
	SetCVar("watchFrameIgnoreCursor", 1)
	SetCVar("profanityFilter", 0)
	SetCVar("chatBubbles", 0)
	SetCVar("chatBubblesParty", 0)
	SetCVar("spamFilter", 0)
	SetCVar("removeChatDelay", 1)
	SetCVar("guildMemberNotify", 1)
	SetCVar("guildRecruitmentChannel", 0)
	SetCVar("UnitNameOwn", 1)
	SetCVar("CombatDamage", 0)
	SetCVar("CombatHealing", 1)
	SetCVar("showArenaEnemyFrames", 0)
	SetCVar("cameraDistanceMax", 40)
	SetCVar("cameraDistanceMaxFactor", 4)
	SetCVar("cameraWaterCollision", 0)
	SetCVar("scriptErrors", 1)

	SetCVar("buffDurations", 1)
	SetCVar("lootUnderMouse", 1)
	SetCVar("secureAbilityToggle", 0)
	--SetCVar("showItemLevel", 1)
	--SetCVar("equipmentManager", 1)
	SetCVar("mapQuestDifficulty", 1)
	--SetCVar("previewTalents", 1)
	SetCVar("nameplateShowFriends", 0)
	SetCVar("nameplateShowEnemies", 0)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("screenshotQuality", 10)
	--SetCVar("chatLocked", 0)
	--SetCVar("showClock", 1)
	SetCVar("cameraViewBlendStyle", 1)  -- How the camera should move between saved positions (1: smooth, 2: instant).
end

function Eavu:Print(...)
	print('|cffff8080 Eavu:|r', ...)
end

Eavu:Print(Eavu:GetScreen())

SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

Eavu.PLAYER_LOGIN = function()
	HidePartyFrame()
	CreateLayout()
end

Eavu:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
Eavu:RegisterEvent"PLAYER_LOGIN"