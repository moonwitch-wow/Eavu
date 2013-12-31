local handler = {}
local frame = CreateFrame("Frame")

LibStub("LibDataBroker-1.1"):NewDataObject("CombatLogToggle", {
  type = "launcher",
  icon = [[Interface\Icons\INV_Weapon_ShortBlade_01]],
  OnClick = function()
    if not COMBATLOG then
      DEFAULT_CHAT_FRAME:AddMessage("ERROR - COMBATLOG frame does not exist.")
      return
    end
    local tab = _G[COMBATLOG:GetName().."Tab"]
    if COMBATLOG:IsVisible() then
      COMBATLOG:Hide()
      tab:Hide()
    else
      COMBATLOG:Show()
      tab:Show()
    end
  end
})

function handler.PLAYER_REGEN_DISABLED(...)
  COMBATLOG:Hide()
  _G[COMBATLOG:GetName().."Tab"]:Hide()
  -- BottomPanel:Hide()
end

function handler.PLAYER_REGEN_ENABLED(...)
  COMBATLOG:Show()
  _G[COMBATLOG:GetName().."Tab"]:Show()
  -- BottomPanel:Show()
end

for k, v in pairs(handler) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end

frame:SetScript("OnEvent", function(self, event, ...)
 handler[event](self, ...); -- call one of the functions above
end)