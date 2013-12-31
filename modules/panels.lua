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
-- Syntax UIFrameFadeOut(frame, timeToFade, startAlpha, endAlpha)
-- UIFrameFadeIn(frame, timeToFade, startAlpha, endAlpha)
-- Turns out I need to get the children for this to work as intended.
-- local innieAndOutie = function(self)
--   local panels = {}
--   panels = BottomPanel:GetChildren()
--   tinsert(panels, #panels+1, BottomPanel)

--   if panels:
--   UIFrameFadeIn
-- end

BottomPanel:SetScript("OnEnter", function()
  BottomPanel:SetAlpha(1)
  -- UIFrameFadeIn(BottomPanel, 2.0, 0.0, 1.0)
end)

BottomPanel:SetScript("OnLeave", function()
  BottomPanel:SetAlpha(0)
  -- UIFrameFadeOut(BottomPanel, 2.0, 1.0, 0.0)
end)