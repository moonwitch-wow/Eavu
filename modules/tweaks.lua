local _, Eavu = ...
local soundFile = "Sound\\Interface\\ReadyCheck.wav"
local MATCH_STRING = ERR_FRIEND_ONLINE_SS:format(".+", "(.+)")

-- One day I hoped to kill my FCT
Eavu.RegisterEvent('PLAYER_REGEN_ENABLED', function()
  UIErrorsFrame:AddMessage('-- Combat', 1, 1, 1)
end)

Eavu.RegisterEvent('PLAYER_REGEN_DISABLED', function()
  UIErrorsFrame:AddMessage('++ Combat', 1, 1, 1)
end)

-- Because I don't focus on other chat tabs (namely general)
local function notifyMePlz(msg)
  local name = msg:match(MATCH_STRING)
  UIErrorsFrame:AddMessage("|Hplayer:%s|h[%s]|h has come online.")
end
Eavu.RegisterEvent('CHAT_MSG_SYSTEM', notifyMePlz)
Eavu.RegisterEvent('GUILD_ROSTER_UPDATE', notifyMePlz)

Eavu.RegisterEvent('LFG_PROPOSAL_SHOW', function()
        PlaySoundFile(soundFile, 'Master')
end)

ReadyCheckListenerFrame:SetScript('OnShow', function()
        PlaySoundFile(soundFile, 'Master')
end)

Eavu.RegisterEvent('PARTY_INVITE_REQUEST', function()
        PlaySoundFile(soundFile, 'Master')
end)

Eavu.RegisterEvent('CHAT_MSG_RAID_BOSS_WHISPER', function(msg, name)
  if(name == UnitName('player') and msg == 'You are next in line!') then
          PlaySoundFile(soundFile, 'Master')
  end
end)