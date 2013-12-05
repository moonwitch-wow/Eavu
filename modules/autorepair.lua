local _, Eavu = ...

function Eavu.MERCHANT_SHOW()
	local val, afford = GetRepairAllCost()
	if(CanMerchantRepair() and afford) then
		if(val > 1e4) then
			self:Print(format('Eavu : Repaired for |cffffff66%d|r|TInterface\\MoneyFrame\\UI-GoldIcon:18|t |cffc0c0c0%d|r|TInterface\\MoneyFrame\\UI-SilverIcon:18|t |cffcc9900%d|r|TInterface\\MoneyFrame\\UI-CopperIcon:18|t', val / 1e4, mod(val, 1e4) / 1e2, mod(val, 1e2)))
		elseif(val > 1e2) then
			self:Print(format('Eavu : Repaired for |cffc0c0c0%d|r|TInterface\\MoneyFrame\\UI-SilverIcon:18|t |cffcc9900%d|r|TInterface\\MoneyFrame\\UI-CopperIcon:18|t', val / 1e2, mod(val, 1e2)))
		else
			self:Print(format('Eavu : Repaired for |cffcc9900%d|r|TInterface\\MoneyFrame\\UI-CopperIcon:18|t', val))
		end

		RepairAllItems(CanGuildBankRepair() and GetGuildBankWithdrawMoney() >= GetRepairAllCost())
	end

	-- Total rip off of Kaelten's KC_Trashman
	local bag, slot
    local number_sold, value_sold = 0, 0

    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            -- can't rely on the quality returned from this API
            local texture, count, locked, quality, readable, lootable, link = GetContainerItemInfo(bag, slot)

            if link then
                local _, _, quality, _, _, _, _, _, _, _, vendor_price = GetItemInfo(link)

                if quality == 0 and vendor_price > 0 then
                    ShowContainerSellCursor(bag, slot)
                    UseContainerItem(bag, slot)

                    number_sold = number_sold + count
                    value_sold = value_sold + vendor_price * count
                end
            end
        end
    end

    if number_sold > 0 then
        self:Printf('Eavu : Sold %d items for a total value of %s.', number_sold, GetMoneyString(value_sold))
    end

	self:UnregisterEvent("MERCHANT_SHOW")
end