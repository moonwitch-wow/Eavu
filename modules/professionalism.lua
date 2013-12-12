-- local __, Eavu = ...

-- -- Enchanting
-- Eavu.RegisterEvent('ADDON_LOADED', function(addon)
--   if(addon ~= 'Blizzard_TradeSkillUI') then return end

--   if(IsSpellKnown(13262)) then
--     local button = CreateFrame('Button', 'TradeSkillVellumButton', TradeSkillCreateButton, 'MagicButtonTemplate')
--     button:SetPoint('TOPRIGHT', TradeSkillCreateButton, 'TOPLEFT')
--     button:SetSize(80, 22)
--     button:SetText('Scroll')
--     button:SetScript('OnClick', function()
--       DoTradeSkill(TradeSkillFrame.selectedSkill)
--       UseItemByName(38682)
--     end)

--     local enchanting = GetSpellInfo(7411)
--     hooksecurefunc('TradeSkillFrame_Update', function()
--       if(IsTradeSkillGuild() or IsTradeSkillLinked()) then
--         button:Hide()
--       elseif(CURRENT_TRADESKILL == enchanting) then
--         local __, __, __, __, service = GetTradeSkillInfo(TradeSkillFrame.selectedSkill)
--         if(service == ENSCRIBE) then
--           button:Show()

--           if(TradeSkillCreateButton:IsEnabled() and GetItemCount(38682) > 0) then
--             button:Enable()
--           else
--             button:Disable()
--           end
--         else
--           button:Hide()
--         end
--       else
--         button:Hide()
--       end
--     end)
--   end
-- end)

-- -- Cooking
-- local button, hat
-- Eavu.RegisterEvent('TRADE_SKILL_SHOW', function()
--   if(not button) then
--     button = CreateFrame('Button', 'FireButton', TradeSkillFrame, 'SecureActionButtonTemplate')
--     button:SetPoint('RIGHT', TradeSkillFrameCloseButton, 'LEFT', -235, 0)
--     button:SetSize(20, 20)

--     local name, __, icon = GetSpellInfo(818)
--     button:SetAttribute('type', 'spell')
--     button:SetAttribute('spell', name)
--     button:SetNormalTexture(icon)
--   end

--   if(IsTradeSkillGuild() or IsTradeSkillLinked()) then
--     button:Hide()
--   elseif(GetTradeSkillLine() == PROFESSIONS_COOKING) then
--     button:Show()

--     if(GetItemCount(46349) and GetItemCount(46349) > 0) then
--       hat = GetInventoryItemLink('player', 1)
--       EquipItemByName(46349)
--     end
--   else
--     button:Hide()
--   end
-- end)

-- Eavu.RegisterEvent('TRADE_SKILL_CLOSE', function()
--   if(hat) then
--     EquipItemByName(hat)
--     hat = nil
--   end
-- end)

-- Eavu.RegisterEvent('TRADE_SKILL_UPDATE', function()
--   if(GetTradeSkillLine() ~= PROFESSIONS_COOKING) then
--     if(hat) then
--       EquipItemByName(hat)
--       hat = nil
--     end

--     if(button) then
--       button:Hide()
--     end
--   end
-- end)