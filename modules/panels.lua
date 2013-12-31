local __, Eavu = ...

--------------------------------------------
-- Panel Creation - Bottom
-- Syntax Eavu.CreatePanel(frameName, width, height, anchor1, parent, anchor2, x, y)
--------------------------------------------
CreateEavuPanel("BottomPanel" , UIParent:GetWidth()-10, UIParent:GetHeight()/45, "BOTTOM", UIParent, "BOTTOM", 0, 1)

--------------------------------------------
-- Panel Creation - Chat
--------------------------------------------
-- CreateEavuPanel(chatPanel, UIParent:GetWidth()/3.25, math.floor(UIParent:GetHeight()/6), "BOTTOMLEFT", "BottomPanel", "TOPLEFT", 0, 5)

--------------------------------------------
-- Panel Creation - CombatLog
--------------------------------------------
-- CreateEavuPanel(combatPanel, UIParent:GetWidth()/3.25, math.floor(UIParent:GetHeight()/6), "BOTTOMRIGHT", "BottomPanel", "TOPRIGHT", 0, 5)

-----------------------------
-- On Enter/On Leave

local FADE_IN_ALPHA = 1
local FADE_IN_DELAY = 0.1
local FADE_IN_DURATION = 0.2

local FADE_OUT_ALPHA = 0
local FADE_OUT_DELAY = 0.2
local FADE_OUT_DURATION = 0.4

local fadeGroup = BottomPanel:CreateAnimationGroup()
local fadeAnim = fadeGroup:CreateAnimation("Alpha")
fadeGroup:SetLooping("NONE")
fadeGroup:SetScript("OnFinished", function(self)
  BottomPanel:SetAlpha(self.targetAlpha)
end)
BottomPanel:SetAlpha(FADE_OUT_ALPHA)

local function FadeIn(self)
  fadeGroup:Stop()
  local a = floor(self:GetAlpha() * 100 + 0.5) / 100
  local d = FADE_IN_ALPHA - a
  local t = (FADE_IN_DURATION * d) / (FADE_IN_ALPHA - FADE_OUT_ALPHA)
  if d < 0.05 or t < 0.05 then
    -- Don't bother animating
    return self:SetAlpha(FADE_IN_ALPHA)
  end
  fadeAnim:SetChange(d)
  fadeAnim:SetStartDelay(a == FADE_OUT_ALPHA and FADE_IN_DELAY or 0)
  fadeAnim:SetDuration(t)
  fadeGroup.targetAlpha = FADE_IN_ALPHA
  fadeGroup:Play()
end

local function FadeOut(self)
  local a = floor(self:GetAlpha() * 100 + 0.5) / 100
  local d = a - FADE_OUT_ALPHA
  local t = (FADE_OUT_DURATION * d) / (FADE_IN_ALPHA - FADE_OUT_ALPHA)
  if d < 0.05 or t < 0.05 then
    -- Don't bother animating
    return self:SetAlpha(FADE_OUT_ALPHA)
  end
  fadeAnim:SetChange(-d)
  fadeAnim:SetStartDelay(a == FADE_IN_ALPHA and FADE_OUT_DELAY or 0)
  fadeAnim:SetDuration(t)
  fadeGroup.targetAlpha = FADE_OUT_ALPHA
  fadeGroup:Play()
end

BottomPanel:SetScript("OnEnter", function(self)
  if self.isMouseOver then return end
  self.isMouseOver = true
  FadeIn(self)
end)

BottomPanel:SetScript("OnLeave", function(self)
  if self:IsMouseOver() then return end
  self.isMouseOver = nil
  FadeOut(self)
end)

local function plugin_OnLeave(self)
  self:GetParent():GetScript("OnLeave")(BottomPanel)
end

-- for i = 1, #textpanes do
--   textpanes[i]:SetScript("OnLeave", plugin_OnLeave)
-- end
for i, v in ipairs(textpanes) do
  print(i, v)
end