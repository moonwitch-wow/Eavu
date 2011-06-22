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
bottomPanel:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}})
bottomPanel:SetBackdropColor(unpack(EavuDB["media"].backdropcolor))
bottomPanel:SetBackdropBorderColor(unpack(EavuDB["media"].bordercolor))

-- Panel Behind chat
local chatPanel = CreateFrame("Frame", "chatPanel", UIParent)
-- Eavu:CreatePanel(chatPanel, EavuDB["panels"].width, 135, "BOTTOMLEFT", bottomPanel, "TOPLEFT", 0, 5)
chatPanel:SetSize(EavuDB["panels"].width*1.5, EavuDB["panels"].height*7)
chatPanel:SetFrameLevel(1)
chatPanel:SetFrameStrata("BACKGROUND")
chatPanel:SetPoint("BOTTOMLEFT", bottomPanel, "TOPLEFT", 0, 5)
chatPanel:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}})
chatPanel:SetBackdropColor(unpack(EavuDB["media"].backdropcolor))
chatPanel:SetBackdropBorderColor(unpack(EavuDB["media"].bordercolor))

local combatPanel = CreateFrame("Frame", "combatPanel", UIParent)
-- Eavu:CreatePanel(combatPanel, EavuDB["panels"].width, 135, "BOTTOMRIGHT", bottomPanel, "TOPRIGHT", 0, 5)
combatPanel:SetSize(EavuDB["panels"].width*1.5, EavuDB["panels"].height*7)
combatPanel:SetFrameLevel(1)
combatPanel:SetFrameStrata("BACKGROUND")
combatPanel:SetPoint("BOTTOMRIGHT", bottomPanel, "TOPRIGHT", 0, 5)
combatPanel:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8", edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}})
combatPanel:SetBackdropColor(unpack(EavuDB["media"].backdropcolor))
combatPanel:SetBackdropBorderColor(unpack(EavuDB["media"].bordercolor))