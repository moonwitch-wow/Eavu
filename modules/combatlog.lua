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