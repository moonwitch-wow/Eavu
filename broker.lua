-- Bottom centered cargoship :P
local dps = LibStub('LibCargoShip-2.1'):CreateBlock('picoDPS', {fontSize=11})
dps:SetPoint("BOTTOM", UIParent, "BOTTOM", -125, 2)

local dbm = LibStub("LibCargoShip-2.1"):CreateBlock("Deadly Boss Mods", {
	noText = true,
	alpha = 1,
	width = 15
	})
dbm:SetPoint ("RIGHT", dps, "LEFT", -5, 0)

local fps = LibStub("LibCargoShip-2.1"):CreateBlock("picoFPS", {
	fontSize = 11,
	})
fps:SetPoint("LEFT", dps, "RIGHT", 5, 0)

local dura = LibStub("LibCargoShip-2.1"):CreateBlock("tekability", {
	fontSize = 11,
	})
dura:SetPoint("LEFT", fps, "RIGHT", 5, 0)

local group = LibStub("LibCargoShip-2.1"):CreateBlock("picoGroup", {
	fontSize = 11,
	})
group:SetPoint("LEFT", dura, "RIGHT", 5, 0)

local tourguide = LibStub("LibCargoShip-2.1"):CreateBlock("Tourguide", {
	fontSize = 11,
	})
tourguide:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 2)