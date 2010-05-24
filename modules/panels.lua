
-- Center Panel (encompass actionbuttons + stats if in raid)
local cPanel = CreateFrame("Frame", "CenterPanel", UIParent)
Eavu:CreatePanel(cPanel, 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 15)
cPanel:SetHeight(EavuDB["panels"].height)
--[[
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
--]]

--local inInstance,_ = IsInInstance()
--if inInstance then
	cPanel:SetWidth(EavuDB["panels"].width + 200)
--else
--	cPanel:SetWidth(EavuDB["panels"].width)
--end
--[[
cPanel:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
cPanel:RegisterEvent"PARTY_MEMBERS_CHANGED"
cPanel:RegisterEvent"RAID_ROSTER_UPDATE"
--]]
-- Left stat panel
local lPanel = CreateFrame("Frame", "LeftPanel", UIParent)
Eavu:CreatePanel(lPanel, EavuDB["panels"].width, EavuDB["panels"].height, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 40, 15)
--lPanel:SetFrameLevel(2)

-- INFO RIGHT (FOR STATS)
local rPanel = CreateFrame("Frame", "RightPanel", UIParent)
Eavu:CreatePanel(rPanel, EavuDB["panels"].width, EavuDB["panels"].height, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -40, 15)

--[[ Panel Behind chat
local chatPanel = CreateFrame("Frame", "chatPanel", LeftPanel)
Eavu:CreatePanel(chatPanel, EavuDB["panels"].width, EavuDB["panels"].height*5, "BOTTOMLEFT", LeftPanel, "TOPLEFT", 0, 10)
--]]
--[[
-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "InfoLeftLineVertical", barbg)
Eavu:CreatePanel(ileftlv, 2, 130, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", Eavu:Scale(22), Eavu:Scale(30))

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "InfoRightLineVertical", barbg)
Eavu:CreatePanel(irightlv, 2, 130, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", Eavu:Scale(-22), Eavu:Scale(30))

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "LineToABLeft", barbg)
Eavu:CreatePanel(ltoabl, 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabl:ClearAllPoints()
ltoabl:SetPoint("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:SetPoint("RIGHT", barbg, "BOTTOMLEFT", Eavu:Scale(-1), Eavu:Scale(17))

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "LineToABRight", barbg)
Eavu:CreatePanel(ltoabr, 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabr:ClearAllPoints()
ltoabr:SetPoint("LEFT", barbg, "BOTTOMRIGHT", Eavu:Scale(1), Eavu:Scale(17))
ltoabr:SetPoint("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)

--RIGHT BAR BACKGROUND
if EavuDB["actionbar"].enable == true or not (IsAddOnLoaded("Dominos") or IsAddOnLoaded("Bartender4") or IsAddOnLoaded("Macaroon")) then
	local barbgr = CreateFrame("Frame", "ActionBarBackgroundRight", MultiBarRight)
	Eavu:CreatePanel(barbgr, 1, (buttonsize * 12) + (buttonspacing * 13), "RIGHT", UIParent, "RIGHT", Eavu:Scale(-23), Eavu:Scale(-13.5))
	if EavuDB["actionbar"].rightbars == 1 then
		barbgr:SetWidth(buttonsize + (buttonspacing * 2))
	elseif EavuDB["actionbar"].rightbars == 2 then
		barbgr:SetWidth((buttonsize * 2) + (buttonspacing * 3))
	elseif EavuDB["actionbar"].rightbars == 3 then
		barbgr:SetWidth((buttonsize * 3) + (buttonspacing * 4))
	else
		barbgr:Hide()
	end
	if EavuDB["actionbar"].rightbars > 0 then
		local rbl = CreateFrame("Frame", "RightBarLine", barbgr)
		local crblu = CreateFrame("Frame", "CubeRightBarUP", barbgr)
		local crbld = CreateFrame("Frame", "CubeRightBarDown", barbgr)
		Eavu:CreatePanel(rbl, 2, (buttonsize / 2 * 27) + (buttonspacing * 6), "RIGHT", barbgr, "RIGHT", Eavu:Scale(1), 0)
		rbl:SetWidth(Eavu:Scale(2))
		Eavu:CreatePanel(crblu, 10, 10, "BOTTOM", rbl, "TOP", 0, 0)
		Eavu:CreatePanel(crbld, 10, 10, "TOP", rbl, "BOTTOM", 0, 0)
	end

	local petbg = CreateFrame("Frame", "PetActionBarBackground", PetActionButton1)
	if EavuDB["actionbar"].rightbars > 0 then
		Eavu:CreatePanel(petbg, petbuttonsize + (petbuttonspacing * 2), (petbuttonsize * 10) + (petbuttonspacing * 11), "RIGHT", barbgr, "LEFT", Eavu:Scale(-6), 0)
	else
		Eavu:CreatePanel(petbg, petbuttonsize + (petbuttonspacing * 2), (petbuttonsize * 10) + (petbuttonspacing * 11), "RIGHT", UIParent, "RIGHT", Eavu:Scale(-6), Eavu:Scale(-13.5))
	end

	local ltpetbg1 = CreateFrame("Frame", "LineToPetActionBarBackground", petbg)
	Eavu:CreatePanel(ltpetbg1, 30, 265, "TOPLEFT", petbg, "TOPRIGHT", 0, Eavu:Scale(-33))
	ltpetbg1:SetFrameLevel(0)
	ltpetbg1:SetAlpha(.8)
end
--]]