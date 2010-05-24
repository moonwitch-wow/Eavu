------------------------------------------------------------------------
--[[ move some frames
------------------------------------------------------------------------
local wf = WatchFrame
local wfmove = false

wf:SetMovable(true)
wf:SetClampedToScreen(false) 
wf:ClearAllPoints()
wf:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", EavuDB:Scale(17), EavuDB:Scale(-80))
wf:SetWidth(EavuDB:Scale(250))
wf:SetHeight(EavuDB:Scale(600))
wf:SetUserPlaced(true)
wf.SetPoint = function() end
wf.ClearAllPoints = function() end

local function WATCHFRAMELOCK()
	if wfmove == false then
		wfmove = true
		wf:EnableMouse(true);
		wf:RegisterForDrag("LeftButton"); 
		wf:SetScript("OnDragStart", wf.StartMoving); 
		wf:SetScript("OnDragStop", wf.StopMovingOrSizing);
	elseif wfmove == true then
		wf:EnableMouse(false);
		wfmove = false
	end
end

SLASH_WATCHFRAMELOCK1 = "/wf"
SlashCmdList["WATCHFRAMELOCK"] = WATCHFRAMELOCK
--]]