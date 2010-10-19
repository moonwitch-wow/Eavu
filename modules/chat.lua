local type = type
local tonumber = tonumber
local string_split = string.split

local _AddMessage = ChatFrame1.AddMessage
local _SetItemRef = SetItemRef

local buttons = {"UpButton", "DownButton", "BottomButton"}
local dummy = function() end
local ts = "|cffffffff|HyChat|h%s|h|||r %s"

local origs = {}

local blacklist = {
	[ChatFrame2] = true,
	[ChatFrame5] = true, -- loot
}

-- replacements
CHAT_GUILD_GET = '|Hchannel:Guild|hg|h %s:\32'
CHAT_RAID_GET = "|Hchannel:raid|hr|h %s:\32"
CHAT_PARTY_GET = "|Hchannel:Party|hp|h %s:\32"
CHAT_PARTY_LEADER_GET = '|Hchannel:party|hP|h %s:\32'
CHAT_PARTY_GUIDE_GET =  CHAT_PARTY_LEADER_GET
CHAT_RAID_WARNING_GET = "w %s:\32"
CHAT_RAID_LEADER_GET = "|Hchannel:raid|hR|h %s:\32"
CHAT_OFFICER_GET = "|Hchannel:o|ho|h %s:\32"
CHAT_BATTLEGROUND_GET = "|Hchannel:Battleground|hb|h %s:\32"
CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:Battleground|hB|h %s:\32"
CHAT_SAY_GET = "s %s:\32"
CHAT_YELL_GET = "y %s:\32"
CHAT_WHISPER_GET = "Fr %s:\32"
CHAT_WHISPER_INFORM_GET = "To %s:\32"
CHAT_FLAG_AFK = "[AFK]"
CHAT_FLAG_DND = "[DND]"
CHAT_FLAG_GM = "[GM]"

-- Stickies
ChatTypeInfo['SAY'].sticky = 1
ChatTypeInfo['YELL'].sticky = 0
ChatTypeInfo['PARTY'].sticky = 1
ChatTypeInfo['GUILD'].sticky = 1
ChatTypeInfo['OFFICER'].sticky = 1
ChatTypeInfo['RAID'].sticky = 1
ChatTypeInfo['RAID_WARNING'].sticky = 1
ChatTypeInfo['BATTLEGROUND'].sticky = 1
ChatTypeInfo['WHISPER'].sticky = 1
ChatTypeInfo['CHANNEL'].sticky = 1

-- 1: index, 2: channelname, 3: twatt
-- Examples are based on this: [1. Channel] Otravi: Hi
local str = "[%2$.3s] %s" -- gives: [Cha] Otravi: Hi
--local str = "[%d. %2$.3s] %s" -- gives: [1. Cha] Otravi: Hi
--local str = "%d|h %3$s" -- gives: 1 Otravi: Hi
local channel = function(...)
	return str:format(...)
end

local AddMessage = function(self, text, ...)
	if(type(text) == "string") then
		text = text:gsub('|Hchannel:(%d+)|h%[?(.-)%]?|h.+(|Hplayer.+)', channel)

		text = ts:format(date"%H:%M", text)
	end

	return origs[self](self, text, ...)
end

local scroll = function(self, dir)
	if(dir > 0) then
		if(IsShiftKeyDown()) then
			self:ScrollToTop()
		else
			self:ScrollUp()
		end
	elseif(dir < 0) then
		if(IsShiftKeyDown()) then
			self:ScrollToBottom()
		else
			self:ScrollDown()
		end
	end
end

for i=1, NUM_CHAT_WINDOWS do
	local cf = _G["ChatFrame"..i]
	cf:EnableMouseWheel(true)

	cf:SetFading(false)
	cf:SetScript("OnMouseWheel", scroll)

	for k, button in pairs(buttons) do
		button = _G["ChatFrame"..i..button]
		button:Hide()
		button.Show = dummy
	end

	if(not blacklist[cf]) then
		origs[cf] = cf.AddMessage
		cf.AddMessage = AddMessage
	end
end

buttons = nil

-- hide chatbuttons
ChatFrameMenuButton:Hide()
ChatFrameMenuButton.Show = dummy

-- relocate the editbox
local eb = ChatFrameEditBox
eb:ClearAllPoints()
eb:SetPoint("BOTTOMLEFT",  ChatFrame1, "TOPLEFT", -5, 20)
eb:SetPoint("BOTTOMRIGHT", ChatFrame1, "TOPRIGHT", 5, 20)
eb:SetAltArrowKeyMode(false)

-- hides the box around the edit box
local a, b, c = select(6, eb:GetRegions())
a:Hide(); b:Hide(); c:Hide()

--[[ NeonChat
for i=6,8 do select(i, ChatFrameEditBox:GetRegions()):Hide() end

local editbox = CreateFrame("Button", nil, ChatFrameEditBox)
editbox:SetBackdrop(GameTooltip:GetBackdrop())
editbox:SetPoint("TOPLEFT", "ChatFrameEditBoxLeft", "TOPLEFT", 1, -2)
editbox:SetPoint("BOTTOMRIGHT", "ChatFrameEditBoxRight", "BOTTOMRIGHT", -1, 2)
editbox:SetFrameLevel(ChatFrameEditBox:GetFrameLevel()-1)

local chatborder = CreateFrame("Button", nil, ChatFrameEditBox)
chatborder:SetBackdrop(GameTooltip:GetBackdrop())
chatborder:SetPoint("TOPLEFT", "ChatFrame1ResizeTopLeft")
chatborder:SetPoint("BOTTOMRIGHT", "ChatFrame1ResizeBottomRight")
chatborder:SetBackdropColor(0,0, 0, 0)
chatborder:EnableMouse(false)

local function colorize(r,g,b)
	editbox:SetBackdropBorderColor(r, g, b, .9)
	chatborder:SetBackdropBorderColor(r, g, b, .8)
	--chatborder:Show()
	editbox:SetBackdropColor(r/3,g/3,b/3, .9)
end

hooksecurefunc("ChatEdit_UpdateHeader", function()
	local type = DEFAULT_CHAT_FRAME.editBox:GetAttribute("chatType")
	if ( type == "CHANNEL" ) then
		local id = GetChannelName(DEFAULT_CHAT_FRAME.editBox:GetAttribute("channelTarget"))
		if id == 0 then	colorize(0.5,0.5,0.5)
		else colorize(ChatTypeInfo[type..id].r,ChatTypeInfo[type..id].g,ChatTypeInfo[type..id].b)
		end
	else colorize(ChatTypeInfo[type].r,ChatTypeInfo[type].g,ChatTypeInfo[type].b)
	end
end)
--]]
-- Modified version of MouseIsOver from UIParent.lua
local MouseIsOver = function(frame)
	local s = frame:GetParent():GetEffectiveScale()
	local x, y = GetCursorPosition()
	x = x / s
	y = y / s

	local left = frame:GetLeft()
	local right = frame:GetRight()
	local top = frame:GetTop()
	local bottom = frame:GetBottom()

	-- Hack to fix a symptom not the real issue
	if(not left) then
		return
	end

	if((x > left and x < right) and (y > bottom and y < top)) then
		return 1
	else
		return
	end
end

local borderManipulation = function(...)
	for l = 1, select("#", ...) do
		local obj = select(l, ...)
		if(obj:GetObjectType() == "FontString" and MouseIsOver(obj)) then
			return obj:GetText()
		end
	end
end

SetItemRef = function(link, text, button, ...)
	if(link:sub(1, 5) ~= "oChat") then return _SetItemRef(link, text, button, ...) end

	local text = borderManipulation(SELECTED_CHAT_FRAME:GetRegions())
	if(text) then
		text = text:gsub("|c%x%x%x%x%x%x%x%x(.-)|r", "%1")
		text = text:gsub("|H.-|h(.-)|h", "%1")

		eb:Insert(text)
		eb:Show()
		eb:HighlightText()
		eb:SetFocus()
	end
end

-- Tell Target
local function tellTarget(s)
   if not UnitExists('target') and UnitName('target') and UnitIsPlayer('target') and GetDefaultLanguage('player') == GetDefaultLanguage('target') or not (s and s:len()>0) then
      return
   end
local name, realm = UnitName('target')
   if realm and realm ~= GetRealmName() then
      name = ('%s-%s'):format(name, realm)
   end
   SendChatMessage(s, 'WHISPER', nil, name)
end

SlashCmdList['TELLTARGET'] = tellTarget
SLASH_TELLTARGET1 = '/tt'

-- URL copy
local color = "BD0101"
local pattern = "[wWhH][wWtT][wWtT][\46pP]%S+[^%p%s]"

function string.color(text, color)
	return "|cff"..color..text.."|r"
end

function string.link(text, type, value, color)
	return "|H"..type..":"..tostring(value).."|h"..tostring(text):color(color or "ffffff").."|h"
end

StaticPopupDialogs["LINKME"] = {
	text = "URL COPY",
	button2 = CANCEL,
	hasEditBox = true,
    hasWideEditBox = true,
	timeout = 0,
	exclusive = 1,
	hideOnEscape = 1,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
	whileDead = 1,
	maxLetters = 255,
}

local function f(url)
	return string.link("["..url.."]", "url", url, color)
end

local function hook(self, text, ...)
	self:f(text:gsub(pattern, f), ...)
end

for i = 1, NUM_CHAT_WINDOWS do
	if ( i ~= 2 ) then
		local frame = _G["ChatFrame"..i]
		frame.f = frame.AddMessage
		frame.AddMessage = hook
	end
end

local f = ChatFrame_OnHyperlinkShow
function ChatFrame_OnHyperlinkShow(self, link, text, button)
	local type, value = link:match("(%a+):(.+)")
	if ( type == "url" ) then
		local dialog = StaticPopup_Show("LINKME")
		local editbox = _G[dialog:GetName().."WideEditBox"]  
		editbox:SetText(value)
		editbox:SetFocus()
		editbox:HighlightText()
		local button = _G[dialog:GetName().."Button2"]
            
		button:ClearAllPoints()
           
		button:SetPoint("CENTER", editbox, "CENTER", 0, -30)
	else
		f(self, link, text, button)
	end
end