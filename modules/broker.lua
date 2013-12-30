------------------------------------------------------------------------
-- Dataobjectifying
------------------------------------------------------------------------
local LCS = LibStub("LibCargoShip-2.1")

--------------------------------------------
-- Left Side
--------------------------------------------
local guild = LCS:CreateBlock('|cFFFFB366Ara|r Guild', {
  parent = BottomPanel,
  })
guild:SetPoint("LEFT", BottomPanel, "LEFT", 10, 0)

local friends = LCS:CreateBlock('|cFFFFB366Ara|r Friends', {
  parent = BottomPanel,
 })
friends:SetPoint("LEFT", guild, "RIGHT", 40, 0)

local dura= LCS:CreateBlock("Durability", {
  parent = BottomPanel,
  })
dura:SetPoint("LEFT", friends, "RIGHT", 40, 0)

--------------------------------------------
-- Right Side
--------------------------------------------
local money = LCS:CreateBlock("Eavu_Money", {
  parent = BottomPanel,
  })
money:SetPoint("RIGHT", BottomPanel, "RIGHT", -10, 0)

local fps = LCS:CreateBlock("Eavu_Perf", {
  parent = BottomPanel,
  width = 100,
  })
fps:SetPoint("RIGHT", money, "LEFT", -40, 0)

local bags = LCS:CreateBlock("Eavu_Bags", {
  parent = BottomPanel,
  })
bags:SetPoint("RIGHT", fps, "LEFT", -40, 0)

--------------------------------------------
-- Center No Side
--------------------------------------------
local dps = LCS:CreateBlock('DPS', {
  fontSize=10,
  parent = BottomPanel,
  })
dps:SetPoint("RIGHT", BottomPanel, "CENTER", -250, 0)

local cbt = LCS:CreateBlock('CombatLogToggle', {
  fontSize=10,
  parent = BottomPanel,
  })
cbt:SetPoint("CENTER", BottomPanel, "CENTER")
