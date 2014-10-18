local _, Eavu = ...

local cvars = {
  -- Mac
  MacUseCommandAsControl = 1,

  -- Controls
  deselectOnClick = 1,
  autoDismountFlying = 0,
  autoClearAFK = 1,
  blockTrades = 0,
  blockChannelInvites = 1,
  lootUnderMouse = 1,
  autoLootDefault = 1,
  --autoLootKey = "SHIFT",
  autoOpenLootHistory = 0,
  interactOnLeftClick = 0,

  -- Combat
  assistAttack = 1,
  autoSelfCast = 1,
  stopAutoAttackOnTargetChange = 1,
  showTargetOfTarget = 1,
  showTargetCastbar = 1,
  showVKeyCastbar = 1,
  showVKeyCastbarOnlyOnTarget = 1,
  showVKeyCastbarSpellName = 1,
  displaySpellActivationOverlays = 1,
  spellActivationOverlayOpacity = 0.5,
  ActionButtonUseKeyDown = 1,
  -- LOC_OPTION_FULL = 2 - LOC_OPTION_ALERT = 1 - LOC_OPTION_OFF = 0
  lossOfControl = 1,
  lossOfControlFull = 2,
  lossOfControlSilence = 2,
  lossOfControlInterrupt = 1,
  lossOfControlDisarm = 1,
  lossOfControlRoot = 1,

  -- Interface options
  addFriendInfoShown = 1,
  characterFrameCollapsed = 0,
  consolidateBuffs = 0,
  lfgAutoFill = 1,
  lfgAutoJoin = 0,

  -- Display
  rotateMinimap = 0,
  screenEdgeFlash = 1,
  displayFreeBagSlots = 1,
  movieSubtitle = 0,
  threatShowNumeric = 1,
  threatPlaySounds = 1,
  SpellTooltip_DisplayAvgValues = 1,
  emphasizeMySpellEffects = 1,
  spellActivationOverlayOpacity = 1,
  displaySpellActivationOverlays = 1,
  digSites = 1,
  predictedHealth = 1,
  predictedPower = 1,

  -- Objectives
  autoQuestWatch = 1,
  autoQuestProgress = 1,
  mapFade = 1,
  trackQuestSorting = 'proximity',

  -- Social
  -- Chatstyle - 'im','classic'
  -- conversationMode - 'popout' 'inline' 'popout_and_inline'
  -- whisperMode
  profanityFilter = 0,
  chatBubbles = 0,
  chatBubblesParty = 0,
  spamFilter = 1,
  removeChatDelay = 1,
  guildMemberNotify = 1,
  wholeChatWindowClickable = 1,
  chatMouseScroll = 1,
  chatStyle = "im",
  conversationMode = 'inline',
  whisperMode = 'inline',
  bnWhisperMode = 'inline',
  showTimestamps = 1,
  colorChatNamesByClass = 1,

  -- ActionBars
  lockActionBars = 1,
  alwaysShowActionBars = 0,
  secureAbilityToggle = 1,

  -- Names
  UnitNameOwn = 0,
  UnitNameNPC = 1,
  UnitNameNonCombatCreatureName = 0,
  UnitNamePlayerGuild = 1,
  UnitNameGuildTitle = 0,
  UnitNamePlayerPVPTitle = 0,

  UnitNameFriendlyPlayerName = 1,
  UnitNameFriendlyPetName = 0,
  UnitNameFriendlyGuardianName = 0,
  UnitNameFriendlyTotemName = 0,

  UnitNameEnemyPlayerName = 1,
  UnitNameEnemyPetName = 1,
  UnitNameEnemyGuardianName = 0,
  UnitNameEnemyTotemName = 0,

  nameplateShowFriends = 0,
  nameplateShowFriendlyPets = 0,
  nameplateShowFriendlyGuardians = 0,
  nameplateShowFriendlyTotems = 0,
  nameplateShowEnemies = 1,
  nameplateShowEnemyPets = 1,
  nameplateShowEnemyGuardians = 0,
  nameplateShowEnemyTotems = 1,
  ShowClassColorInNameplate = 1,
  --nameplateMotion

  -- Combat Text
  enableCombatText = 1,
  fctCombatState = 1,
  fctDodgeParryMiss = 1,
  fctDamageReduction = 0,
  fctRepChanges = 0,
  fctReactives = 1,
  fctFriendlyHealers = 0,
  fctComboPoints = 1,
  fctLowManaHealth = 1,
  fctEnergyGains = 0,
  fctPeriodicEnergyGains = 0,
  fctHonorGains = 0,
  fctAuras = 1,
  CombatDamage = 1,
  CombatLogPeriodicSpells = 0,
  PetMeleeDamage = 1,
  CombatHealing = 1,
  CombatHealingAbsorbTarget = 0,
  CombatHealingAbsorbSelf = 1,
  fctSpellMechanics = 1, --SHOW_TARGET_EFFECTS
  fctSpellMechanicsOther = 0, --SHOW_OTHER_TARGET_EFFECTS
  combatTextFloatMode = 3, --up = 1' 'down = 2' 'arc = 3'

  -- Status Text
  xpBarText = 1,
  playerStatusText = 1,
  petStatusText = 1,
  partyStatusText = 1,
  targetStatusText = 1,
  alternateResourceText = 1,
  statusTextDisplay = 'PERCENT', -- NUMERIC PERCENT BOTH

  -- UnitFrame
  showPartyBackground = 0,
  showPartyPets = 1,
  fullSizeFocusFrame = 1,

  -- Camera
  cameraTerrainTilt = 1,
  cameraBobbing = 0,
  cameraWaterCollision = { text = "WATER_COLLISION" },
  cameraDistanceMaxFactor = 1.2,
  --cameraSmoothStyle -- CameraPanelFollowTerrain

  -- Buffs
  buffDurations = 1,
  showDispelDebuffs = 1,
  showCastableBuffs = 1,
  consolidateBuffs = 0,
  -- showAllEnemyDebuffs = ,

  -- Battle.net
  showToastOnline = 1,
  showToastOffline = 0,
  showToastBroadcast = 0,
  showToastFriendRequest = 1,
  showToastConversation = 1,
  showToastWindow = 1,

  -- Mouse
  enableMouseSpeed = 1,
  mouseInvertPitch = 0,
  enableWoWMouse = 0,
  autointeract = 0,

  -- Help
  showTutorials = 0,
  showGameTips = 0, -- tip of the day
  UberTooltips = 1,
  scriptErrors = 1,
  colorblindMode = 0,
  enableMovePad = 0,

  -- Sound Options
  ChatMusicVolume = 0.3,
  ChatSoundVolume = 0.4,
  ChatAmbienceVolume = 0.3,
  Sound_MasterVolume = 0.3,
  Sound_MusicVolume = 0.1,
  Sound_AmbienceVolume = 0.1,
  Sound_SFXVolume = 0.1,
  Sound_DialogVolume = 0.1,
  EnableMicrophone = 0,
  EnableVoiceChat = 0,
  Sound_EnableSFX = 0,
  Sound_EnableSoundWhenGameIsInBG = 1,
  Sound_ListenerAtCharacter = 1,
  Sound_EnableReverb = 0,
  Sound_EnableDSPEffects = 0,

  -- Misc
  taintLog = 1,
  screenshotQuality = 10,
  screenshotFormat = 'png',
  synchronizeBindings = 1, -- because blizzard seems to fuck me over
  synchronizeConfig = 1, -- because blizzard seems to fuck me over
  synchronizeMacros = 1, -- because blizzard seems to fuck me over
  synchronizeSettings = 1, -- because blizzard seems to fuck me over
  checkAddonVersion = 0,
  scriptErrors = 1,
  scriptProfile = 0,

  -- Normal settings
  -- graphicsQuality = 3,
  -- farclip = 700,
  -- particleDensity = 50,
  -- waterDetail = 1,
  -- rippleDetail = 1,
  -- reflectionMode = 0,
  -- sunShafts = 0,
  -- refraction = 1,
  -- groundEffectDensity = 35,
  -- groundEffectDist = 90,
  -- projectedTextures = 0,
  -- shadowMode = 1,
  -- shadowTextureSize = 1024,
  -- SSAOBlur = 0,
  -- textureFilteringMode = 3,

  -- -- RAID settings
  -- RAIDgraphicsQuality = 3,
  -- RAIDsettingsInit = 1,
  -- RAIDfarclip = 450,
  -- RAIDWaterDetail = 1,
  -- RAIDSSAO = 0,
  -- RAIDSSAOBlur = 0,
  -- RAIDgroundEffectDensity = 32,
  -- RAIDgroundEffectDist = 80,
  -- RAIDshadowMode = 0,
  -- RAIDwmoLodDist = 300,
  -- RAIDprojectedTextures = 0,
  -- RAIDshadowTextureSize = 1024,
  -- RAIDreflectionMode = 0,
  -- RAIDsunShafts = 0,
  -- RAIDparticleDensity = 30,
  -- RAIDrefraction = 1,
}

function Eavu.CreateLayout()
  for key, value in next, cvars do
    SetCVar(key, value)
  end
  print("Eavu : Initialized")
end