-- Bottom centered cargoship :P

local dps = cargoShip("picoDPS", {
	fontSize = 11,
	})
dps:SetPoint("BOTTOM", UIParent, "BOTTOM", -125, 2)

local dbm = cargoShip("Deadly Boss Mods", {
	noText = true,
	alpha = 1,
	width = 15,
})
dbm:SetPoint ("RIGHT", dps, "LEFT", -5, 0)

local fps = cargoShip("picoFPS", {
	fontSize = 11,
	})
fps:SetPoint("LEFT", dps, "RIGHT", 5, 0)

local dura = cargoShip("tekability", {
	fontSize = 11,
	})
dura:SetPoint("LEFT", fps, "RIGHT", 5, 0)

local group = cargoShip("picoGroup", {
	fontSize = 11,
	})
group:SetPoint("LEFT", dura, "RIGHT", 5, 0)

local tourguide = cargoShip("Tourguide", {
	fontSize = 11,
	})
tourguide:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 2)