--[[
-----------------------------
-- INIT
-----------------------------
local _G = _G
-----------------------------
-- FUNCTIONS
-----------------------------
local function init()
	local wf = _G['WatchFrame']
	local wfh = _G['WatchFrameHeader']
	local wfl = _G['WatchFrameLines']
    
	wf:SetUserPlaced(true)
		
	wfh:EnableMouse(true)
	wfh:RegisterForDrag("LeftButton")
	wfh:SetHitRectInsets(-15, -15, -5, -5)
	wfh:SetScript("OnDragStart", function(s) 
	local f = s:GetParent()
		f:StartMoving()
		end)
	wfh:SetScript("OnDragStop", function(s) 
		local f = s:GetParent()
		f:StopMovingOrSizing()
		end)
end

local a = CreateFrame("Frame")

a:SetScript("OnEvent", function(self, event)
if(event=="PLAYER_LOGIN") then
init()
end
end)
  
  a:RegisterEvent("PLAYER_LOGIN")
  --]]