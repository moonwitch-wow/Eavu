local __, Eavu = ...

--------------------------------------------
-- Panel Creation - Bottom
-- Syntax Eavu.CreatePanel(frameName, width, height, anchor1, parent, anchor2, x, y)
--------------------------------------------
Eavu.CreatePanel("BottomPanel" , UIParent:GetWidth()-10, EavuDB["panels"].height, "BOTTOM", UIParent, "BOTTOM", 0, 5)

--------------------------------------------
-- Panel Creation - Chat
--------------------------------------------
Eavu.CreatePanel(chatPanel, EavuDB["panels"].width*1.3, EavuDB["panels"].height*7, "BOTTOMLEFT", "BottomPanel", "TOPLEFT", 0, 5)

--------------------------------------------
-- Panel Creation - CombatLog
--------------------------------------------
Eavu.CreatePanel(combatPanel, EavuDB["panels"].width*1.3, EavuDB["panels"].height*7, "BOTTOMRIGHT", "BottomPanel", "TOPRIGHT", 0, 5)