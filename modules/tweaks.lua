-- local _, Eavu = ...
-- local soundFile = [=[Sound\Interface\ReadyCheck.wav]=]

-- -- One day I hoped to kill my FCT
-- Eavu.RegisterEvent('PLAYER_REGEN_ENABLED', function()
--   UIErrorsFrame:AddMessage('-- Combat', 1, 1, 1)
-- end)

-- Eavu.RegisterEvent('PLAYER_REGEN_DISABLED', function()
--   UIErrorsFrame:AddMessage('++ Combat', 1, 1, 1)
-- end)

-- -- Autoaccept guildies' PARTY_INVITE_REQUEST
-- Eavu.RegisterEvent('PARTY_INVITE_REQUEST', function(name, l, f, g)
--   if(l or f or g) then return end

--   for index = 1, select(2, GetNumGuildMembers()) do
--     if(GetGuildRosterInfo(index) == name) then
--       return AcceptGroup()
--     end
--   end

--   for index = 1, select(2, BNGetNumFriends()) do
--     if(string.match(select(5, BNGetFriendInfo(index)), name)) then
--       return AcceptGroup()
--     end
--   end

--   for index = 1, GetNumFriends() do
--     if(GetFriendInfo(index) == name) then
--       return AcceptGroup()
--     end
--   end
-- end)