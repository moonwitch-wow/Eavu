-- blah blah
local mediaFolder = 'Interface\\AddOns\\Eavu\\media\\'

local FONT = [=[Fonts\ARIALN.TTF]=]
local TEXTURE = [=[Interface\TargetingFrame\UI-StatusBar]=]
local blankTex = "Interface\\Buttons\\WHITE8x8"	
local OVERLAY = [=[Interface\TargetingFrame\UI-TargetingFrame-Flash]=]
local FONTSIZE = 10
local FONTFLAG = "THINOUTLINE"
local iconSize = 20 --Size of all Icons, RaidIcon/ClassIcon/Castbar Icon
local FontShadowOffset = 0 -- 0 = no shadow

local hpHeight = 10
local hpWidth = 100
local cbHeight = 5
local cbWidth = 100
local cbIconSize = 20

local adWidth = 10				-- additional width for selected nameplate (hpWidth + adWidth)
local adHeight = 5				-- additional height for selected nameplate (hpHeight + adHeight)

local numChildren = -1
local frames = {}

SetCVar("ShowClassColorInNameplate", 1)
SetCVar("nameplateShowEnemyTotems", 0)
SetCVar("bloatnameplates",1)	
SetCVar("bloatthreat", 1)
SetCVar("bloattest", 0)	
SetCVar("threatWarning", 3)

-- format numbers
function round(num, idp)
  if idp and idp > 0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function CoolNumber(num)
	if(num >= 1e6) then
		return round(num/1e6,1).."m"
	elseif(num >= 1e3) then
		return round(num/1e3,1).."k"
	else
		return num
	end
end

-- hide objects
local function QueueObject(parent, object)
	parent.queue = parent.queue or {}
	parent.queue[object] = true
end

dummy = function() return end
local function HideObjects(parent)
	for object in pairs(parent.queue) do
		if(object:GetObjectType() == 'Texture') then
			object:SetTexture(nil)
			object.SetTexture = dummy
		elseif (object:GetObjectType() == 'FontString') then
			object.ClearAllPoints = dummy
			object.SetFont = dummy
			object.SetPoint = dummy
			object:Hide()
			object.Show = dummy
			object.SetText = dummy
			object.SetShadowOffset = dummy			
		else
			object:Hide()
			object.Show = dummy
		end
	end
end

-- update
local function UpdateFrame(frame)
local name = frame.oldname:GetText()
	
	-- color name by threat
	if(frame.region:IsShown()) then
		local _, val = frame.region:GetVertexColor()
		if(val > 0.7) then
			frame.name:SetTextColor(1, 1, 0)
		else
			frame.name:SetTextColor(1, 0, 0)
		end
	else
		frame.name:SetTextColor(1, 1, 1)
	end
	
	-- current health value
    local minHealth, maxHealth = frame.healthOriginal:GetMinMaxValues()
    local valueHealth = frame.healthOriginal:GetValue()
	local d =(valueHealth/maxHealth)*100

	frame.hp.value:SetText(CoolNumber(valueHealth))

		if(d <= 35 and d >= 25) then
			frame.hp.value:SetTextColor(253/255, 238/255, 80/255)
		elseif(d < 25 and d >= 20) then
			frame.hp.value:SetTextColor(250/255, 130/255, 0/255)
		elseif(d < 20) then
			frame.hp.value:SetTextColor(200/255, 20/255, 40/255)
		else
			frame.hp.value:SetTextColor(1,1,1)
		end	
	
	-- highlight selected plate
	if(UnitName('target') and frame:GetAlpha() == 1) then
		frame.select:Show()
		frame.hp:SetSize(hpWidth+adWidth, hpHeight+adHeight)
	else
		frame.select:Hide()
		frame.hp:SetSize(hpWidth, hpHeight)
	end		
end

local function UpdateObjects(frame)
	frame = frame:GetParent()
	local name = frame.oldname:GetText()
	
	local r, g, b = frame.level:GetTextColor()
	if(frame.boss:IsShown()) then
		frame.name:SetText('|cffff0000B|r ' .. frame.oldname:GetText())
	else
		frame.name:SetText(format('|cff%02x%02x%02x', r*255, g*255, b*255) .. tonumber(frame.level:GetText()) .. (frame.elite:IsShown() and '+' or '') .. '|r ' .. frame.oldname:GetText())
	end	
	
	-- color hp bg dependend on hp color
    local BGr, BGg, BGb = frame.hp:GetStatusBarColor()
	frame.hp.hpbg2:SetVertexColor(BGr*0.3, BGg*0.3, BGb*0.3)
	
	frame.level:ClearAllPoints()
	HideObjects(frame)
end

local function UpdateCastbar(frame)
	frame:ClearAllPoints()
	frame:SetSize(cbWidth+adWidth, cbHeight)
	frame:SetPoint('TOP', frame:GetParent().hp, 'BOTTOM', 0, -5)
	frame:GetStatusBarTexture():SetHorizTile(true)

	if(frame.shield:IsShown()) then
		frame:SetStatusBarColor(0.9, 0, 1.0, 0.6)
	end
end	
	
local OnValueChanged = function(self)
	if self.needFix then
		UpdateCastbar(self)
		self.needFix = nil
	end
end

local OnSizeChanged = function(self)
	self.needFix = true
end

local function OnHide(frame)
	frame.cb:Hide()
	frame.hasClass = nil

	frame:SetScript("OnUpdate",nil)
end

-- style
local function SkinObjects(frame)
	local hp, cb = frame:GetChildren()
	local offset = UIParent:GetScale() / hp:GetEffectiveScale()
	
	local threat, hpborder, overlay, oldname, level, bossicon, raidicon, elite = frame:GetRegions()
	local _, cbborder, cbshield, cbicon = cb:GetRegions()
	
	frame.healthOriginal = hp
	
	-- health
	local hpbg = hp:CreateTexture(nil, 'BACKGROUND')
	hpbg:SetPoint('BOTTOMRIGHT', offset, -offset)
	hpbg:SetPoint('TOPLEFT', -offset, offset)
	hpbg:SetTexture(0, 0, 0)
	
	hp.hpbg2 = hp:CreateTexture(nil, 'BORDER')
	hp.hpbg2:SetAllPoints(hp)
	hp.hpbg2:SetTexture(blankTex)	
	
	hp:HookScript('OnShow', UpdateObjects)
	hp:SetStatusBarTexture(TEXTURE)
	frame.hp = hp
	
	hp.value = hp:CreateFontString(nil, "OVERLAY")	
	hp.value:SetFont(FONT, FONTSIZE, FONTFLAG)
	hp.value:SetPoint("RIGHT", hp, "TOPRIGHT", 10, 2)
	hp.value:SetShadowOffset(FontShadowOffset, -FontShadowOffset)
	
	-- selection highlight
	local select = frame:CreateTexture(nil, 'OVERLAY')
	select:SetAllPoints(hp)
	select:SetTexture(mediaFolder.."highlight")
	select:SetTexCoord(0,1,1,0)
	select:SetVertexColor(1,1,1,0.4)
	select:SetBlendMode('ADD')
	select:Hide()
	frame.select = select
	
	-- cast
	local cbbg = cb:CreateTexture(nil, 'BACKGROUND')
	cbbg:SetPoint('BOTTOMRIGHT', offset, -offset)
	cbbg:SetPoint('TOPLEFT', -offset, offset)
	cbbg:SetTexture(0, 0, 0)	

	local cbbg2 = cb:CreateTexture(nil, 'BORDER')
	cbbg2:SetAllPoints(cb)
	cbbg2:SetTexture(1/3, 1/3, 1/3)

	cbicon:ClearAllPoints()
	cbicon:SetPoint("TOPRIGHT", hp, "TOPLEFT", -4, 0)		
	cbicon:SetSize(cbIconSize, cbIconSize)
	cbicon:SetTexCoord(.07, .93, .07, .93)
	
	local cbiconbg = cb:CreateTexture(nil, 'BACKGROUND')
	cbiconbg:SetPoint('BOTTOMRIGHT', cbicon, offset, -offset)
	cbiconbg:SetPoint('TOPLEFT', cbicon, -offset, offset)
	cbiconbg:SetTexture(0, 0, 0)
	
	cb.icon = cbicon
	cb.shield = cbshield
	cb:HookScript('OnShow', UpdateCastbar)
	cb:HookScript('OnSizeChanged', OnSizeChanged)
	cb:HookScript('OnValueChanged', OnValueChanged)	
	cb:SetStatusBarTexture(TEXTURE)
	frame.cb = cb

	-- name
	local name = hp:CreateFontString(nil, 'OVERLAY')
	name:SetFont(FONT, FONTSIZE, FONTFLAG)
	name:SetPoint("LEFT", hp, "TOPLEFT", -10, 2)
	frame.oldname = oldname
	frame.name = name
	name:SetShadowOffset(FontShadowOffset, -FontShadowOffset)
	
	-- raid icon
	raidicon:ClearAllPoints()
	raidicon:SetParent(hp)	
	raidicon:SetPoint("TOPRIGHT", hp, "TOPLEFT", -4, 0)
	raidicon:SetSize(cbIconSize, cbIconSize)
	raidicon:SetTexture(mediaFolder.."raidicons")		
	
	frame.level = level
	frame.elite = elite
	frame.boss = bossicon	
		
	QueueObject(frame, threat)
	QueueObject(frame, hpborder)
	QueueObject(frame, cbshield)
	QueueObject(frame, cbborder)
	QueueObject(frame, overlay)
	QueueObject(frame, oldname)
	QueueObject(frame, level)
	QueueObject(frame, bossicon)
	QueueObject(frame, elite)
	
	UpdateObjects(hp)
	UpdateCastbar(cb)
	
	frame:HookScript('OnHide', OnHide)	
	frames[frame] = true
end

-- update
local select = select
local function HookFrames(...)
	for index = 1, select('#', ...) do
		local frame = select(index, ...)
		local region = frame:GetRegions()

		if(not frames[frame] and (frame:GetName() and frame:GetName():find("NamePlate%d")) and region and region:GetObjectType() == 'Texture' and region:GetTexture() == OVERLAY) then
			SkinObjects(frame)
			frame.region = region
		end
	end
end

CreateFrame('Frame'):SetScript('OnUpdate', function(self, elapsed)
	if(WorldFrame:GetNumChildren() ~= numChildren) then
		numChildren = WorldFrame:GetNumChildren()
		HookFrames(WorldFrame:GetChildren())
	end

	if(self.elapsed and self.elapsed > 0.1) then
		for frame in pairs(frames) do
			UpdateFrame(frame)
		end

		self.elapsed = 0
	else
		self.elapsed = (self.elapsed or 0) + elapsed
	end
end)