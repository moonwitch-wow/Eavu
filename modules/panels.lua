local __, Eavu = ...

--------------------------------------------
-- Panel Creation - Bottom
-- Syntax Eavu.CreatePanel(frameName, width, height, anchor1, parent, anchor2, x, y)
--------------------------------------------
CreateEavuPanel("BottomPanel" , UIParent:GetWidth()-10, UIParent:GetHeight()/45, "BOTTOM", UIParent, "BOTTOM", 0, 5)

--------------------------------------------
-- Panel Creation - Chat
--------------------------------------------
CreateEavuPanel(chatPanel, UIParent:GetWidth()/3.25, math.floor(UIParent:GetHeight()/7), "BOTTOMLEFT", "BottomPanel", "TOPLEFT", 0, 5)

--------------------------------------------
-- Panel Creation - CombatLog
--------------------------------------------
CreateEavuPanel(combatPanel, UIParent:GetWidth()/3.25, math.floor(UIParent:GetHeight()/7), "BOTTOMRIGHT", "BottomPanel", "TOPRIGHT", 0, 5)
-- CreateEavuPanel(combatPanel, EavuDB["panels"].width*1.3, EavuDB["panels"].height*7, "BOTTOMRIGHT", "BottomPanel", "TOPRIGHT", 0, 5)