-- This is roughly based on IHasNoScope from Haste.
-- Tweaks.lua is taken mostly from p3lim
-- ChatFrame came from TukUI and Kousei

-- Some constants
local _G = _G
local Eavu = CreateFrame('Frame', 'Eavu')
local fontSize = 14

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

function Eavu:CreatePanel(f, w, h, a1, p, a2, x, y)
	sh = scale(h)
	sw = scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, x, y)
	f:SetBackdrop({
	  bgFile = EavuDB["media"].blank, 
	  edgeFile = EavuDB["media"].blank, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	f:SetBackdropColor(unpack(EavuDB["media"].backdropcolor))
	f:SetBackdropBorderColor(unpack(EavuDB["media"].bordercolor))
end

local function CreateLayout()  -- Cvars and Chatsettings :P
	SetCVar("buffDurations", 1)
	SetCVar("lootUnderMouse", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("secureAbilityToggle", 0)
	SetCVar("showItemLevel", 1)
	SetCVar("equipmentManager", 1)
	SetCVar("mapQuestDifficulty", 1)
	SetCVar("previewTalents", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("nameplateShowFriends", 0)
	SetCVar("nameplateShowEnemies", 0)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("screenshotQuality", 10)
	SetCVar("cameraDistanceMax", 50)
	SetCVar("cameraDistanceMaxFactor", 3.4)
	SetCVar("chatLocked", 0)
	SetCVar("showClock", 1)
	SetCVar("cameraViewBlendStyle", 1)  -- How the camera should move between saved positions (1: smooth, 2: instant).
end

function Eavu:Print(...)
	print('|cffff8080 Eavu:|r', ...)
end

SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

Eavu.PLAYER_LOGIN = function()
	HidePartyFrame()
	CreateLayout()
end

Eavu:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
Eavu:RegisterEvent"PLAYER_LOGIN"