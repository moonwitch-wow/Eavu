--[[ Because I use 2 machines to play with each a different resolution, 
I have to check for said resolution to get everything just right.
--]]


-- Making new panels -- keeping old ones in :P
local bottomPanel = CreateFrame("Frame", "BottomPanel", UIParent)
--Eavu:CreatePanel(bottomPanel, Eavu:GetScreen(), EavuDB["panels"].height, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 15, 10)
bottomPanel:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 15, 5)
bottomPanel:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -15, 5)
bottomPanel:SetHeight(EavuDB["panels"].height)
bottomPanel:SetFrameLevel(1)
bottomPanel:SetFrameStrata("BACKGROUND")
bottomPanel:SetBackdrop({
	  bgFile = EavuDB["media"].blank, 
	  edgeFile = EavuDB["media"].blank, 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -2}
	})
bottomPanel:SetBackdropColor(unpack(EavuDB["media"].backdropcolor))
bottomPanel:SetBackdropBorderColor(unpack(EavuDB["media"].bordercolor))

--[[
-- Center Panel (encompass actionbuttons + stats if in raid)
local cPanel = CreateFrame("Frame", "CenterPanel", UIParent)
Eavu:CreatePanel(cPanel, 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 15)
cPanel:SetHeight(EavuDB["panels"].height)

cPanel.PARTY_MEMBERS_CHANGED = function(self)
	cPanel:changeLayout()
end

cPanel.RAID_ROSTER_UPDATE = function(self)
	cPanel:changeLayout()
end

function cPanel:changeLayout (self)
	local pmems = GetNumPartyMembers()
	local rmems = GetNumRaidMembers()
	if (pmems > 1) or (rmems > 1) then
		cPanel:SetWidth(EavuDB["panels"].width + 200)
	else
		cPanel:SetWidth(EavuDB["panels"].width)
	end
end


--local inInstance,_ = IsInInstance()
--if inInstance then
	cPanel:SetWidth(EavuDB["panels"].width + 200)
--else
--	cPanel:SetWidth(EavuDB["panels"].width)
--end

cPanel:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
cPanel:RegisterEvent"PARTY_MEMBERS_CHANGED"
cPanel:RegisterEvent"RAID_ROSTER_UPDATE"

-- Left stat panel
local lPanel = CreateFrame("Frame", "LeftPanel", UIParent)
Eavu:CreatePanel(lPanel, EavuDB["panels"].width, EavuDB["panels"].height, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 40, 15)
--lPanel:SetFrameLevel(2)

-- INFO RIGHT (FOR STATS)
local rPanel = CreateFrame("Frame", "RightPanel", UIParent)
Eavu:CreatePanel(rPanel, EavuDB["panels"].width, EavuDB["panels"].height, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -40, 15)
--]]
-- Panel Behind chat
local chatPanel = CreateFrame("Frame", "chatPanel", LeftPanel)
Eavu:CreatePanel(chatPanel, EavuDB["panels"].width, 135, "BOTTOMLEFT", bottomPanel, "TOPLEFT", 0, 5)

local combatPanel = CreateFrame("Frame", "combatPanel", RightPanel)
Eavu:CreatePanel(combatPanel, EavuDB["panels"].width, 135, "BOTTOMRIGHT", bottomPanel, "TOPRIGHT", 0, 5)
--]]