local __, Eavu = ...
local frame = CreateFrame("Frame")-- sets frame to be used for the hooks, and Eavu to a usable table

--------------------------------------------
-- Util funcs
--------------------------------------------
function money_to_string(value)
  if value == 0 then return nil end

  local gold = math.floor(value / 10000)
  local silver = mod(math.floor(value / 100), 100)
  local copper = mod(value, 100)

  return string.format("|cffffd700%i|r.|cffc7c7cf%02i|r.|cffeda55f%02i|r", gold, silver, copper)
end

function earned(value)
  return value > 0 and "|cff00ff00Profit|r" or value < 0 and "|cffff0000Loss|r" or nil
end

function Eavu.MERCHANT_SHOW()
-- Func to AutoRepair from guild if you can repair from guild and haven't exceeded the total amount
  if (CanMerchantRepair()) then -- can we repair from this dude?
    RepairAllItems(CanGuildBankRepair() and GetGuildBankWithdrawMoney() >= GetRepairAllCost())
    Eavu.print('Repaired for:'..GetRepairAllCost())
  end
-- Func to vendor all greys and print out for how much

  self:UnregisterEvent("MERCHANT_SHOW") -- Unregistering the correct event as well
end

frame:SetScript("OnEvent", function(self, event, ...)
 Eavu[event](self, ...); -- call one of the functions above
end)

for k, v in pairs(Eavu) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end