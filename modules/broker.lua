-- left side
local guild = LibStub('LibCargoShip-2.1'):CreateBlock('picoGuild', {
	})
guild:SetPoint("LEFT", BottomPanel, "LEFT", 10, 0)

local friends = LibStub('LibCargoShip-2.1'):CreateBlock('picoFriends', {
	})
friends:SetPoint("LEFT", guild, "RIGHT", 40, 0)

local dura= LibStub("LibCargoShip-2.1"):CreateBlock("tekability", {
	})
dura:SetPoint("LEFT", friends, "RIGHT", 40, 0)

local tg = LibStub("LibCargoShip-2.1"):CreateBlock("TourGuide", {
	width = 100,
	})
tg:SetPoint("LEFT", dura, "RIGHT", 40, 0)

-- right side
local money = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Money", {
	})
money:SetPoint("RIGHT", BottomPanel, "RIGHT", -10, 0)

local fps = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Perf", {
	width = 100,
	})
fps:SetPoint("RIGHT", money, "LEFT", -40, 0)

local bags = LibStub("LibCargoShip-2.1"):CreateBlock("Eavu_Bags", {
	})
bags:SetPoint("RIGHT", fps, "LEFT", -40, 0)

if select(2, UnitClass("player")) == "SHAMAN" then 
	local ankh = LibStub("LibCargoShip-2.1"):CreateBlock("AnkhUp", {
		})
	ankh:SetPoint("RIGHT", bags, "LEFT", -40, 0)
end

-- centered
local dps = LibStub('LibCargoShip-2.1'):CreateBlock('picoDPS', {fontSize=10})
dps:SetPoint("RIGHT", BottomPanel, "CENTER", -250, 0)

local group = LibStub("LibCargoShip-2.1"):CreateBlock("picoGroup", {fontSize = 10})
group:SetPoint("LEFT", BottomPanel, "CENTER", 250, 0)

local cbt = LibStub('LibCargoShip-2.1'):CreateBlock('CombatLogToggle', {fontSize=10})
cbt:SetPoint("CENTER", BottomPanel, "CENTER")
