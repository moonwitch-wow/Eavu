local _, Eavu = ...

function Eavu.MERCHANT_SHOW()
	local val, afford = GetRepairAllCost()
	if(CanMerchantRepair() and afford) then
		if(val > 1e4) then
			self:Print(format('Repaired for |cffffff66%d|r|TInterface\\MoneyFrame\\UI-GoldIcon:18|t |cffc0c0c0%d|r|TInterface\\MoneyFrame\\UI-SilverIcon:18|t |cffcc9900%d|r|TInterface\\MoneyFrame\\UI-CopperIcon:18|t', val / 1e4, mod(val, 1e4) / 1e2, mod(val, 1e2)))
		elseif(val > 1e2) then
			self:Print(format('Repaired for |cffc0c0c0%d|r|TInterface\\MoneyFrame\\UI-SilverIcon:18|t |cffcc9900%d|r|TInterface\\MoneyFrame\\UI-CopperIcon:18|t', val / 1e2, mod(val, 1e2)))
		else
			self:Print(format('Repaired for |cffcc9900%d|r|TInterface\\MoneyFrame\\UI-CopperIcon:18|t', val))
		end
	
		RepairAllItems(CanGuildBankRepair() and GetGuildBankWithdrawMoney() >= GetRepairAllCost())
	end

	self:UnregisterEvent("MERCHANT_SHOW")
end