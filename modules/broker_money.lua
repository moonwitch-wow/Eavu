local f, n, r = CreateFrame("Frame"), UnitName("player"), GetRealmName()
local Eavu_Money = LibStub("LibDataBroker-1.1"):NewDataObject("Eavu_Money", {["type"] = "data source"})
local start, delta = 0, 0

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

Eavu_Money.OnTooltipShow = function(Tooltip)
	local server_total = 0

	Tooltip:AddLine("Eavu_Money")

	for i,v in pairs(EavuSV_DB[r]) do
		Tooltip:AddDoubleLine(i, money_to_string(v), 1,1,1, 1,1,1)
		server_total = server_total + v
	end
	Tooltip:AddLine(" ")
	Tooltip:AddDoubleLine(r, money_to_string(server_total), 1,1,1, 1,1,1)
	Tooltip:AddDoubleLine(earned(delta), money_to_string(math.abs(delta)), 1,1,1, 1,1,1)
end

f:SetScript("OnEvent", function(_, event)
	if event == "PLAYER_LOGIN" then
		EavuSV_DB = EavuSV_DB or {}
		EavuSV_DB[r] = EavuSV_DB[r] or {}
		start = GetMoney()
	end
	EavuSV_DB[r][n] = GetMoney()
	Eavu_Money.text = money_to_string(GetMoney())

	delta = GetMoney() - start
end)

f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_MONEY")
f:RegisterEvent("PLAYER_TRADE_MONEY")
f:RegisterEvent("TRADE_MONEY_CHANGED")
f:RegisterEvent("SEND_MAIL_MONEY_CHANGED")
f:RegisterEvent("SEND_MAIL_COD_CHANGED")