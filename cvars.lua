local __, Eavu = ...

function Eavu.CreateLayout()  -- Cvars and Chatsettings :P
  -- UIScale
  SetCVar('useUiScale', math.floor(768/UIParent:GetHeight()))

  -- Chat CVARS
  SetCVar('autoCompleteResortNamesOnRecency',1)
  SetCVar('chatBubbles',0)
  SetCVar('chatBubblesParty',0)
  SetCVar('chatMouseScroll',1)
  SetCVar('chatStyle','im')
  SetCVar('conversationMode','popout')
  SetCVar('CombatDamage',1)
  SetCVar('CombatHealing',1)
  SetCVar('combatLogOn',1) -- Whether or not the combat log is shown
  SetCVar('CombatLogPeriodicSpells',0) -- Enables periodic spells in combat log (?)
  SetCVar('guildMemberNotify',1)
  SetCVar('profanityFilter',0)
  SetCVar('showToastBroadcast',1)
  SetCVar('showToastConversation',1)
  SetCVar('showToastFriendRequest',1)
  SetCVar('showToastOffline',1)
  SetCVar('showToastOnline',1)
  SetCVar('spamFilter',1)

  -- Controls CVARS
  SetCVar('assistAttack',0)
  SetCVar('autoClearAFK',1)
  SetCVar('autoDismount',1)
  SetCVar('autoDismountFlying',1)
  SetCVar('AutoInteract',0) -- Enables Right-click to move
  SetCVar('autoLootDefault',1) -- Enables auto-looting of corpses
  SetCVar('autoSelfCast',1)
  SetCVar('autoStand',1)
  SetCVar('autoUnshift',1)
  SetCVar('BlockTrades',1) -- Block trade requests
  SetCVar('deselectOnClick',1) -- Sticky targetting
  SetCVar('lootUnderMouse',1)
  SetCVar('maxSpellStartRecoveryoffset',1)
  SetCVar('secureAbilityToggle',1)
  SetCVar('stopAutoAttackOnTargetChange',1)

  -- Graphics CVARS
  SetCVar('emphasizeMySpellEffects',1)
  SetCVar('environmentDetail',1)
  SetCVar('farclip',450)
  SetCVar('ffxDeath',1)
  SetCVar('ffxGlow',1)
  SetCVar('ffxNetherWorld',1)
  SetCVar('ffxSpecial',0)
  SetCVar('ffx',1)
  SetCVar('groundEffectDensity',16)
  SetCVar('groundEffectDist',32)
  SetCVar('gxApi','d3d11')
  SetCVar('gxCursor',1)
  SetCVar('gxFixLag',1)
  SetCVar('gxMultisample',1)
  SetCVar('gxMultisampleQuality',2)
  SetCVar('particleDensity',75)
  SetCVar('pathSmoothing',1) -- Whether NPCs will round corners on ground paths
  SetCVar('shadowMode',1)
  SetCVar('SkyCloudLOD',1)
  SetCVar('sunshafts',1)
  SetCVar('violenceLevel',5)
  SetCVar('waterDetail',1) -- Enables water reflection (0 = old water, 1 = screen space reflection, 2 = dynamic reflection)

  -- Interface options
  SetCVar('addFriendInfoShown',1)
  SetCVar('advancedWatchFrame',1)
  SetCVar('alwaysCompareItems',0)
  SetCVar('alwaysShowActionBars',0)
  SetCVar('buffDurations',1)
  SetCVar('characterFrameCollapsed',1)
  SetCVar('colorChatNamesByClass',1)
  SetCVar('consolidateBuffs',0)
  SetCVar('colorblindMode', 1)
  SetCVar('digSites',1)
  SetCVar('displaySpellActivationOverlays',1)
  SetCVar('displayWorldPVPObjectives',1)
  SetCVar('dontShowEquipmentSetsOnItems',0)
  SetCVar('enableCombatText',1)
  SetCVar('enablePVPNotifyAFK',1)
  SetCVar('friendsSmallView',1)
  SetCVar('friendsViewButtons',1)
  SetCVar('guildRosterView',1)
  SetCVar('guildShowOffline',1)
  SetCVar('lfgAutoFill',0)
  SetCVar('lfgAutoJoin',0)
  SetCVar('lockedWorldMap',0)
  SetCVar('mapQuestDifficulty',1)
  SetCVar('minimapZoom',0)
  SetCVar('minimapInsideZoom',0)
  SetCVar('minimapShapeshiftTracking',1)
  SetCVar('pendingInviteInfoShown',1)
  SetCVar('PetMeleeDamage',1)
  SetCVar('PetSpellDamage',1)
  SetCVar('predictedHealth',1)
  SetCVar('predictedPower',1)
  SetCVar('rotateMinimap',0)
  SetCVar('screenEdgeFlash',0)
  SetCVar('screenshotFormat','jpeg')
  SetCVar('screenshotQuality',10)
  SetCVar('scriptErrors',1)
  SetCVar('scriptProfile',0)
  SetCVar('showGameTips',0)
  SetCVar('showToastWindow',1)
  SetCVar('synchronizeBindings',0)
  SetCVar('synchronizeConfig',0)
  SetCVar('synchronizeMacros',1)
  SetCVar('synchronizeSettings',0)
  SetCVar('taintLog',1)
  SetCVar('UberTooltips',0)
  SetCVar('uiScale',1)
  SetCVar('UnitNameEnemyGuardianName',1)
  SetCVar('UnitNameEnemyPetName',1)
  SetCVar('UnitNameEnemyPlayerName',1)
  SetCVar('UnitNameEnemyTotemName',1)
  SetCVar('UnitNameFriendlyGuardianName',1)
  SetCVar('UnitNameFriendlyPetName',1)
  SetCVar('UnitNameFriendlyPlayerName',1)
  SetCVar('UnitNameFriendlySpecialNPCName',1)
  SetCVar('UnitNameFriendlyTotemName',1)
  SetCVar('UnitNameGuildTitle',0)
  SetCVar('UnitNameNonCombatCreatureName',1)
  SetCVar('UnitNameNPC',1)
  SetCVar('UnitNameOwn',1)
  SetCVar('UnitNamePlayerGuild',0)
  SetCVar('UnitNamePlayerPVPTitle',0)

  -- Nameplates
  SetCVar('bloatnameplates',1)
  SetCVar('bloattest',0)
  SetCVar('bloatthreat',1)
  SetCVar('nameplateShowEnemies',1)
  SetCVar('nameplateShowEnemyGuardians',1)
  SetCVar('nameplateShowEnemyPets',1)
  SetCVar('nameplateShowEnemyTotems',1)
  SetCVar('nameplateShowFriends',0)
  SetCVar('nameplateShowFriendlyGuardians',0)
  SetCVar('nameplateShowFriendlyPets',0)
  SetCVar('nameplateShowFriendlyTotems',0)
  SetCVar('ShowVKeyCastbar',1)
  SetCVar('ShowClassColorInNameplate',1)

  -- Sound Options
  SetCVar('ChatSoundVolume',1)
  SetCVar('EnableMicrophone',0)
  SetCVar('EnableVoiceChat',0)
  SetCVar('FootstepSounds',1)
  SetCVar('Sound_EnableAllSound',1)
  SetCVar('Sound_EnableArmorFoleySoundForOthers',0)
  SetCVar('Sound_EnableArmorFoleySoundForSelf',1)
  SetCVar('Sound_EnableEmoteSounds',1)
  SetCVar('Sound_EnableErrorSpeech',1)
  SetCVar('Sound_EnableMusic',1)
  SetCVar('Sound_EnableSFX',1)
  SetCVar('Sound_EnableSoundWhenGameIsInBG',1)
  SetCVar('Sound_ListenerAtCharacter',1)
  --SetCVar('Sound_OutputQuality',)
  SetCVar('useEnglishAudio',0)

  -- Unit Frames
  SetCVar('raidOptionIsShown',0)
  SetCVar('useCompactPartyFrames',1)
  SetCVar('xpBarText',1)
end