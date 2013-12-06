--------------------------------------------
-- Localizing
--------------------------------------------
local UPDATEPERIOD, MEMTHRESH = 0.5, 32
local prevmem, elapsed, tipshown = collectgarbage("count"), 0.5
local string_format, math_modf, GetNetStats, GetFramerate, collectgarbage = string.format, math.modf, GetNetStats, GetFramerate, collectgarbage
local MAXADDONS = 15
local fperf = CreateFrame("frame")

--------------------------------------------
-- Util Funcs
--------------------------------------------
-- thanks @Tekkub for this function
local ColorGradient = function(perc, r1, g1, b1, r2, g2, b2, r3, g3, b3)
	if perc >= 1 then return r3, g3, b3 elseif perc <= 0 then return r1, g1, b1 end
	local segment, relperc = math_modf(perc*2)
	if segment == 1 then r1, g1, b1, r2, g2, b2 = r2, g2, b2, r3, g3, b3 end
	return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
end

local function usageSort(a,b) -- sort based on usage
	local aMem = GetAddOnMemoryUsage(a)
	local bMem = GetAddOnMemoryUsage(b)
	return aMem > bMem
end

--------------------------------------------
-- Creating DataObject
--------------------------------------------
local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Eavu_Perf",
	{
	type = "data source",
	text = "75.0fps 75ms",
	label = "Perf",

--------------------------------------------
-- Creating Tooltip - thus the majik
--------------------------------------------
	OnEnter = function(self)
		GameTooltip:SetOwner(self)
		GameTooltip:ClearLines()

		GameTooltip:AddLine("Eavu Performance Monitor")

		local addons, addon, total = {}, {}, 0

		for i=1, GetNumAddOns() do
			addon = {GetAddOnInfo(i), GetAddOnMemoryUsage(i)}
			table.insert(addons, addon)
			total = total + GetAddOnMemoryUsage(i)
		end

		table.sort(addons, (function(a, b) return a[2] > b[2] end))

		UpdateAddOnMemoryUsage()

		for i,addons in pairs(addons) do
			if addons[2] > MEMTHRESH then
				local r, g, b = ColorGradient((addons[2] - MEMTHRESH)/768, 0,1,0, 1,1,0, 1,0,0)
				local memstr = addons[2] > 1024 and string_format("%.1f MiB", addons[2]/1024) or string_format("%.1f KiB", addons[2])
				GameTooltip:AddDoubleLine(addons[1], memstr, 1,1,1, r,g,b)
			end
		end

		GameTooltip:AddLine(" ")

		local r, g, b = ColorGradient(total/(40*1024), 0,1,0, 1,1,0, 1,0,0)
		GameTooltip:AddDoubleLine("Addon memory:", string_format("%.2f MiB", total/1024), nil,nil,nil, r,g,b)

		local mem = collectgarbage("count")
		local r, g, b = ColorGradient(mem/(20*1024), 0,1,0, 1,1,0, 1,0,0)
		GameTooltip:AddDoubleLine("Default UI memory:", string_format("%.2f MiB", (gcinfo()-total)/1024), nil,nil,nil, r,g,b)

		GameTooltip:AddLine("------------------------------")
		GameTooltip:AddLine("Click to take out the trash :P")

		GameTooltip:Show()
	end,
	OnLeave = function (self)
		GameTooltip:Hide()
	end,
	OnClick = function(self,button)
		collectgarbage("count")
	end,
	})

--------------------------------------------
-- Update Funcs -
-- this makes sure the text is correct
-- And colorized it
--------------------------------------------
fperf:SetScript("OnUpdate", function(self, elap)
	elapsed = elapsed + elap
	if elapsed < UPDATEPERIOD then return end

	elapsed = 0
	local fps = GetFramerate()
	local _, _, lag = GetNetStats()
	local fpsr, fpsg, fpsb = ColorGradient(fps/75, 1,0,0, 1,1,0, 0,1,0)
	local lagr, lagg, lagb = ColorGradient(lag/1000, 0,1,0, 1,1,0, 1,0,0)
	dataobj.text = string_format("|cff%02x%02x%02x%.1f|r fps   |cff%02x%02x%02x%d|r ms", fpsr*255, fpsg*255, fpsb*255, fps,lagr*255, lagg*255, lagb*255, lag)
end)