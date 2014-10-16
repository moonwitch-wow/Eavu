local _, Eavu = ...
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

function Eavu.MERCHANT_SHOW()
-- Func to AutoRepair from guild if you can repair from guild and haven't exceeded the total amount
  if not CanMerchantRepair() then
    return
  else
    if (IsInGuild() and CanGuildBankRepair() and not IsShiftKeyDown()) then -- can we repair from this dude?
      RepairAllItems(CanGuildBankRepair() and GetGuildBankWithdrawMoney() >= GetRepairAllCost())
      if GetRepairAllCost() > 0 then
        print('Guild repaired for :'..money_to_string(GetRepairAllCost()))
      end
    else
      RepairAllItems()
      if GetRepairAllCost() > 0 then
        print('Repaired for :'..money_to_string(GetRepairAllCost()))
      end
    end
  end

-- Func to vendor all greys and print out for how much
  local bag, slot
    local valueSold = 0, 0

    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local _, count, _, _, _, _, link = GetContainerItemInfo(bag, slot)
            if link then
                local _, _, quality, _, _, _, _, _, _, _, vendorPrice = GetItemInfo(link)

                if quality == 0 and vendorPrice > 0 then
                    ShowContainerSellCursor(bag, slot)
                    UseContainerItem(bag, slot)

                    valueSold = valueSold + vendorPrice * count
                end
            end
        end
    end
    if valueSold > 0 then
      EavuPrint('Sold stuff for ', GetMoneyString(valueSold))
    end

  -- frame:UnregisterEvent("MERCHANT_SHOW") -- Unregistering the correct event as well
end

frame:SetScript("OnEvent", function(self, event, ...)
 Eavu[event](self, ...); -- call one of the functions above
end)

for k, v in pairs(Eavu) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end