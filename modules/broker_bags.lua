local pName = "Eavu_Bags"
local f = CreateFrame("frame")
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataobj = ldb:NewDataObject(pName, {
  type = "data source",
  text = "0/0",
  icon = "Interface\\AddOns\\Eavu\\media\\bags.tga",
  OnClick = function()
    ToggleBackpack()
  end
})

-- Set this to false if you want to disable text coloring
local color = true

f:RegisterEvent("BAG_UPDATE")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function()
  local total = 0
  local free = 0
  local used = 0
  for i = 0, NUM_BAG_SLOTS do
    total = total + GetContainerNumSlots(i)
    free = free + GetContainerNumFreeSlots(i)
  end
  used = total - free
  
  local tColor = "|r"
  if color then
    local p = used / total
    
    if p > 0.8 then
      tColor = "|cffDD3A00"
    elseif p > 0.6 then
      tColor = "|cffFF9900"
    elseif p > 0.4 then
      tColor = "|cffFFFF00"
    elseif p > 0.2 then
      tColor = "|cff99FF00"
    else
      tColor = "|cff00FF00"
    end
  end
  
  dataobj.text = format("%s%i/%i", tColor, used, total)
end)