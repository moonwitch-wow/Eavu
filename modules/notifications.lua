local _, Eavu = ...
local soundFile = [=[Sound\Interface\ReadyCheck.wav]=]

-- -- Because I don't focus on other chat tabs (namely general)
-- local function notifyMePlz(msg)
--   local MATCH_STRING = ERR_FRIEND_ONLINE_SS:format(".+", "(.+)")
--   local name = msg:match(MATCH_STRING)
--   if name then
--     UIErrorsFrame:AddMessage("|Hplayer:%s|h[%s]|h has come online.")
--   end
-- end
-- Eavu.RegisterEvent('CHAT_MSG_SYSTEM', notifyMePlz)
-- Eavu.RegisterEvent('GUILD_ROSTER_UPDATE', notifyMePlz)

function Eavu.LFG_PROPOSAL_SHOW()
  PlaySoundFile(soundFile, 'Master')
end

ReadyCheckListenerFrame:SetScript('OnShow', function()
  PlaySoundFile(soundFile, 'Master')
end)

function Eavu.PARTY_INVITE_REQUEST()
  PlaySoundFile(soundFile, 'Master')
end

-- Alt tabbing bad in raids
function Eavu.CHAT_MSG_RAID_BOSS_WHISPER(msg, name)
  if(name == UnitName('player') and msg == 'You are next in line!') then
    PlaySoundFile(soundFile, 'Master')
  end
end
