-- Left Info Panel contains picoGuild, picoFriends and tekDurability
local guild = LibStub('LibCargoShip-2.1'):CreateBlock('picoGuild', {
	fontSize=10,
	width=20,
	})
guild:SetPoint("LEFT", LeftPanel, "LEFT", 25, 0)

local friends = LibStub('LibCargoShip-2.1'):CreateBlock('picoFriends', {
	fontSize=10,
	width=20,
	})
friends:SetPoint("CENTER", LeftPanel, "CENTER", 0, 0)

local dura= LibStub("LibCargoShip-2.1"):CreateBlock("tekability", {
	fontSize=10,
	width=20,
	})
dura:SetPoint("RIGHT", LeftPanel, "RIGHT", -25, 0)

-- Right Info Panel contains FPS/PING/Mem, free bags and gold
local money = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Money", {
	fontSize=10,
	width=20,
	})
money:SetPoint("RIGHT", RightPanel, "RIGHT", -25, 0)

local fps = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Perf", {
	fontSize=10,
	width=20,
	})
fps:SetPoint("LEFT", RightPanel, "LEFT", 20, 0)

if select(2, UnitClass("player")) ~= "SHAMAN" then 
	local bags = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Bags", {
		fontSize=10,
		width=20,
		})
	bags:SetPoint("CENTER", RightPanel, "CENTER", 0, 0)
else
	local bags = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Bags", {
		fontSize=10,
		width=20,
	})
	bags:SetPoint("CENTER", RightPanel, "CENTER", 45, 0)
	
	local ankh = LibStub("LibCargoShip-2.1"):CreateBlock("AnkhUp", {
		fontSize=10,
		width = 20,
		})
	ankh:SetPoint("RIGHT", bags, "LEFT", -20, 0)
end

-- Center panel goodness - requires reload IN instance to work :(
--local inInstance,_ = IsInInstance()
--if inInstance then
local dps = LibStub('LibCargoShip-2.1'):CreateBlock('picoDPS', {fontSize=10})
	dps:SetPoint("LEFT", CenterPanel, "LEFT", 10, 0)

	local group = LibStub("LibCargoShip-2.1"):CreateBlock("picoGroup", {fontSize = 10})
	group:SetPoint("RIGHT", CenterPanel, "RIGHT", -10, 0)
--else
--	return
--end
