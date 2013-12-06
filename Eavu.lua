--------------------------------------------
-- Config
--------------------------------------------
local __, Eavu = ...
local frame = CreateFrame("Frame")-- sets frame to be used for the hooks, and Eavu to a usable table

EavuDB = { }

EavuDB["media"] = {
  ["font"] = STANDARD_TEXT_FONT,
  ["fontSize"] = 12,
  ["bordercolor"] = { .6,.6,.6,1 }, -- border color of Eavu panels
  ["backdropcolor"] = { .1,.1,.1,1 }, -- background color of Eavu panels
}

EavuDB["panels"] = {
  --["width"] = 401, -- desktop
  --["height"] = 25, -- desktop
  ["width"] = 300, -- Macbook
  ["height"] = 20, -- Macbook
}

--------------------------------------------
-- Utilities
--------------------------------------------
function Eavu.dummy() end -- empty func

local Eavu.UiScale = GetCVar('uiScale')
local res = GetCVar('gxResolution')

local mult = 768/string.match(GetCVar('gxResolution'), '%d+x(%d+)')/(Eavu.UiScale or 1)

function Eavu.Scale(x)
  return mult*math.floor(x/mult+.5)
end

function Eavu.CreatePanel(frameName, width, height, anchor1, parent, anchor2, x, y)
  frameName:SetFrameLevel(1)
  frameName:SetHeight(Eavu.Scale(height))
  frameName:SetWidth(Eavu.Scale(width))
  frameName:SetFrameStrata('BACKGROUND')
  frameName:SetPoint(anchor1, parent, anchor2, x, y)
  frameName:SetBackdrop(unpack(EavuDB['media'].texture))
  frameName:SetBackdropColor(unpack(EavuDB['media'].backdropcolor))
  frameName:SetBackdropBorderColor(unpack(EavuDB['media'].bordercolor))
end

function Eavu.Print(...) -- for debugging if needed
  print('|cffff8080 Eavu.|r', ...)
end

--------------------------------------------
-- Event Handling
--------------------------------------------
function Eavu:ADDON_LOADED(...)
  self:UnregisterEvent("ADDON_LOADED")
  self.ADDON_LOADED = nil

  if IsLoggedIn() then self:PLAYER_LOGIN() else self:RegisterEvent("PLAYER_LOGIN") end
end

function Eavu:PLAYER_LOGIN(...)
  self:RegisterEvent("PLAYER_LOGOUT")

  HidePartyFrame()
  Eavu.CreateLayout()

  self:UnregisterEvent("PLAYER_LOGIN")
  self.PLAYER_LOGIN = nil
end

frame:SetScript("OnEvent", function(self, event, ...)
 Eavu[event](self, ...); -- call one of the functions above
end)

for k, v in pairs(Eavu) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end