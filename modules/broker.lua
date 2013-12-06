--------------------------------------------
-- Left Side
--------------------------------------------
local guild = LibStub('LibCargoShip-2.1'):CreateBlock('SocialState', {
  })
guild:SetPoint("LEFT", BottomPanel, "LEFT", 10, 0)

-- local friends = LibStub('LibCargoShip-2.1'):CreateBlock('Folks_Friends', {
--  })
-- friends:SetPoint("LEFT", guild, "RIGHT", 40, 0)

local dura= LibStub("LibCargoShip-2.1"):CreateBlock("Durability", {
  })
dura:SetPoint("LEFT", guild, "RIGHT", 40, 0)

--------------------------------------------
-- Right Side
--------------------------------------------
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

--------------------------------------------
-- Center No Side
--------------------------------------------
local dps = LibStub('LibCargoShip-2.1'):CreateBlock('DPS', {fontSize=10})
dps:SetPoint("RIGHT", BottomPanel, "CENTER", -250, 0)

local cbt = LibStub('LibCargoShip-2.1'):CreateBlock('CombatLogToggle', {fontSize=10})
cbt:SetPoint("CENTER", BottomPanel, "CENTER")
