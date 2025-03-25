WKElvUIConfig_Default = {
    ["dbConverted"] = 13.87,
    ["convertPages"] = true,
    ["actionbar"] = {
        ["microbar"] = {
            ["buttons"] = 11,
        },
        ["bar6"] = {
            ["enabled"] = true,
            ["buttonsPerRow"] = 6,
            ["buttons"] = 6,
        },
        ["bar5"] = {
            ["enabled"] = false,
            ["buttonsPerRow"] = 12,
            ["buttons"] = 12,
        },
    },
    ["chat"] = {
        ["panelSnapLeftID"] = 1,
    },
}

-- Simple Style
WKElvUIConfig_Name_SimpleStyle = "Simple Style"
WKElvUIConfig_SimpleStyle = {
    ["datatexts"] = {
        ["fontSize"] = 10,
        ["fontOutline"] = "OUTLINE",
        ["panels"] = {
            ["MinimapPanel"] = {
                ["backdrop"] = false,
                ["border"] = false,
            },
            ["LeftChatDataPanel"] = {
                [1] = "WeakAuras",
                [2] = "ElvUI",
                [3] = "Durability",
                ["backdrop"] = false,
                ["enable"] = false,
                ["panelTransparency"] = true,
            },
            ["RightChatDataPanel"] = {
                [1] = "Gold",
                [2] = "MeetingStone",
                [3] = "System",
                ["enable"] = false,
                ["backdrop"] = false,
            },
        },
    },
    ["auras"] = {
        ["debuffs"] = {
            ["countFontOutline"] = "OUTLINE",
            ["timeFontOutline"] = "OUTLINE",
            ["countFont"] = "傷害數字",
            ["size"] = 26,
            ["timeFont"] = "傷害數字",
        },
        ["buffs"] = {
            ["countFontOutline"] = "OUTLINE",
            ["timeFontOutline"] = "OUTLINE",
            ["timeFontSize"] = 11,
            ["countFont"] = "傷害數字",
            ["size"] = 26,
            ["timeFont"] = "EUI",
        },
    },
    ["tooltip"] = {
        ["healthBar"] = {
            ["fontOutline"] = "NONE",
        },
        ["cursorAnchorType"] = "ANCHOR_CURSOR_RIGHT",
        ["guildRanks"] = false,
        ["modifierID"] = "SHIFT",
        ["alwaysShowRealm"] = true,
        ["showMount"] = false,
        ["itemCount"] = "NONE",
    },
    ["bags"] = {
        ["bankSize"] = 40,
        ["split"] = {
            ["bag3"] = true,
            ["bag2"] = true,
            ["bag1"] = true,
            ["bag4"] = true,
            ["bagSpacing"] = 7,
        },
        ["bagWidth"] = 550,
        ["bankWidth"] = 550,
        ["bagBar"] = {
            ["growthDirection"] = "HORIZONTAL",
            ["size"] = 25,
        },
        ["itemLevelCustomColorEnable"] = true,
        ["scrapIcon"] = true,
        ["vendorGrays"] = {
            ["enable"] = true,
        },
        ["bagSize"] = 40,
    },
    ["nameplates"] = {
        ["units"] = {
            ["ENEMY_PLAYER"] = {
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[health:current:shortvalue]  -  [perhp]%",
                    },
                },
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["size"] = 20,
                },
            },
            ["TARGET"] = {
                ["classpower"] = {
                    ["width"] = 60,
                    ["enable"] = true,
                    ["yOffset"] = -11,
                },
            },
            ["ENEMY_NPC"] = {
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
            },
            ["FRIENDLY_PLAYER"] = {
                ["nameOnly"] = true,
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
            },
            ["FRIENDLY_NPC"] = {
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
                ["debuffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
            },
        },
        ["clampToScreen"] = true,
        ["statusbar"] = "Melli",
    },
    ["actionbar"] = {
        ["bar4"] = {
            ["buttonsPerRow"] = 4,
            ["buttonSize"] = 31,
            ["backdrop"] = false,
            ["visibility"] = "[petbattle] hide; show",
            ["macrotext"] = true,
            ["point"] = "TOPLEFT",
        },
        ["bar1"] = {
            ["macrotext"] = true,
            ["buttonSize"] = 31,
        },
        ["cooldown"] = {
            ["override"] = false,
            ["fonts"] = {
                ["enable"] = true,
            },
        },
        ["stanceBar"] = {
            ["buttonSpacing"] = 1,
            ["style"] = "classic",
            ["buttonSize"] = 25,
        },
        ["bar5"] = {
            ["buttonsPerRow"] = 12,
            ["buttonSize"] = 31,
            ["visibility"] = "[petbattle] hide; show",
            ["macrotext"] = true,
            ["buttons"] = 12,
        },
        ["bar9"] = {
            ["macrotext"] = true,
        },
        ["bar6"] = {
            ["macrotext"] = true,
            ["buttonSize"] = 31,
            ["enabled"] = true,
            ["point"] = "TOPLEFT",
        },
        ["bar7"] = {
            ["macrotext"] = true,
        },
        ["microbar"] = {
            ["buttonSize"] = 23,
            ["buttons"] = 10,
        },
        ["font"] = "傷害數字",
        ["bar3"] = {
            ["buttonsPerRow"] = 4,
            ["macrotext"] = true,
            ["buttonSize"] = 31,
            ["visibility"] = "[petbattle] hide; show",
            ["buttons"] = 12,
            ["point"] = "TOPLEFT",
        },
        ["bar10"] = {
            ["macrotext"] = true,
        },
        ["bar2"] = {
            ["visibility"] = "[petbattle] hide; show",
            ["macrotext"] = true,
            ["buttonSize"] = 31,
        },
        ["barPet"] = {
            ["buttonsPerRow"] = 10,
            ["buttonSize"] = 28,
            ["backdrop"] = false,
            ["point"] = "TOPLEFT",
        },
        ["bar8"] = {
            ["macrotext"] = true,
        },
    },
    ["general"] = {
        ["bonusObjectivePosition"] = "AUTO",
        ["numberPrefixStyle"] = "CHINESE",
        ["objectiveFrameHeight"] = 550,
        ["bottomPanel"] = false,
        ["loginmessage"] = false,
        ["itemLevel"] = {
            ["itemLevelFontSize"] = 10,
            ["displayCharacterInfo"] = false,
        },
        ["autoTrackReputation"] = true,
        ["fontSize"] = 14,
        ["minimap"] = {
            ["icons"] = {
                ["tracking"] = {
                    ["xOffset"] = -12,
                    ["scale"] = 0.6,
                    ["position"] = "TOPLEFT",
                },
            },
            ["locationText"] = "SHOW",
            ["size"] = 140,
        },
        ["afk"] = false,
        ["valuecolor"] = {
            ["r"] = 0.99999779462814,
            ["g"] = 0.95686066150665,
            ["b"] = 0.40784224867821,
        },
        ["backdropfadecolor"] = {
            ["a"] = 0.85700567066669,
            ["r"] = 0.058823529411765,
            ["g"] = 0.058823529411765,
            ["b"] = 0.058823529411765,
        },
        ["interruptAnnounce"] = "RAID",
        ["totems"] = {
            ["spacing"] = 8,
            ["size"] = 30,
            ["growthDirection"] = "HORIZONTAL",
        },
        ["altPowerBar"] = {
            ["statusBar"] = "Melli",
        },
    },
    ["currentTutorial"] = 3,
    ["cooldown"] = {
        ["fonts"] = {
            ["enable"] = true,
        },
        ["hideBlizzard"] = true,
    },
    ["convertPages"] = true,
    ["databars"] = {
        ["threat"] = {
            ["width"] = 472,
            ["enable"] = false,
            ["height"] = 24,
        },
        ["petExperience"] = {
            ["width"] = 65,
        },
        ["reputation"] = {
            ["width"] = 393,
            ["enable"] = true,
            ["height"] = 6,
        },
        ["experience"] = {
            ["textFormat"] = "PERCENT",
            ["height"] = 8,
            ["width"] = 393,
        },
    },
    ["dbConverted"] = 13.61,
    ["unitframe"] = {
        ["cooldown"] = {
            ["fonts"] = {
                ["enable"] = true,
                ["fontSize"] = 15,
            },
        },
        ["statusbar"] = "ElvUI Blank",
        ["font"] = "聊天",
        ["units"] = {
            ["target"] = {
                ["name"] = {
                    ["text_format"] = "[level]   [name]",
                    ["yOffset"] = 16,
                    ["position"] = "TOPRIGHT",
                },
                ["portrait"] = {
                    ["overlayAlpha"] = 0.8,
                    ["camDistanceScale"] = 4,
                    ["enable"] = true,
                    ["overlay"] = true,
                },
                ["castbar"] = {
                    ["insideInfoPanel"] = false,
                    ["height"] = 10,
                    ["width"] = 160,
                },
                ["CombatIcon"] = {
                    ["yOffset"] = 27,
                    ["xOffset"] = 81,
                },
                ["orientation"] = "LEFT",
                ["disableMouseoverGlow"] = true,
                ["fader"] = {
                    ["range"] = false,
                },
                ["health"] = {
                    ["xOffset"] = 0,
                    ["attachTextTo"] = "InfoPanel",
                    ["yOffset"] = 3,
                    ["text_format"] = "[health:current:shortvalue]  -  [perhp]%",
                },
                ["width"] = 160,
                ["debuffs"] = {
                    ["attachTo"] = "FRAME",
                    ["priority"] = "Blacklist,Personal,nonPersonal",
                    ["numrows"] = 2,
                    ["perrow"] = 7,
                    ["countFontSize"] = 5,
                    ["yOffset"] = 16,
                },
                ["customTexts"] = {
                    ["精英"] = {
                        ["xOffset"] = -80,
                        ["text_format"] = "[classification:icon][range]",
                        ["attachTextTo"] = "Health",
                        ["justifyH"] = "CENTER",
                        ["font"] = "聊天",
                        ["size"] = 10,
                        ["enable"] = true,
                        ["yOffset"] = 25,
                        ["fontOutline"] = "OUTLINE",
                    },
                },
                ["power"] = {
                    ["xOffset"] = -2,
                    ["attachTextTo"] = "Power",
                    ["position"] = "RIGHT",
                    ["text_format"] = "[powercolor][  >power:current]",
                },
                ["height"] = 45,
                ["aurabar"] = {
                    ["enable"] = false,
                    ["height"] = 18,
                },
                ["buffs"] = {
                    ["growthX"] = "RIGHT",
                    ["attachTo"] = "DEBUFFS",
                    ["perrow"] = 7,
                    ["priority"] = "Blacklist,Dispellable,Personal,nonPersonal,PlayerBuffs,Whitelist",
                    ["numrows"] = 2,
                    ["anchorPoint"] = "BOTTOMLEFT",
                    ["countFontSize"] = 5,
                    ["yOffset"] = -73,
                },
            },
            ["assist"] = {
                ["enable"] = false,
            },
            ["focustarget"] = {
                ["width"] = 80,
                ["power"] = {
                    ["enable"] = false,
                },
                ["castbar"] = {
                    ["width"] = 80,
                },
            },
            ["pet"] = {
                ["name"] = {
                    ["yOffset"] = 10,
                    ["text_format"] = "[happiness:full]",
                },
                ["width"] = 65,
                ["debuffs"] = {
                    ["enable"] = true,
                },
                ["customTexts"] = {
                    ["名字"] = {
                        ["xOffset"] = 0,
                        ["text_format"] = "[namecolor][name:medium]",
                        ["attachTextTo"] = "Health",
                        ["justifyH"] = "CENTER",
                        ["enable"] = true,
                        ["size"] = 10,
                        ["fontOutline"] = "OUTLINE",
                        ["yOffset"] = 0,
                        ["font"] = "聊天",
                    },
                },
                ["infoPanel"] = {
                    ["height"] = 14,
                },
                ["power"] = {
                    ["height"] = 4,
                },
                ["disableTargetGlow"] = false,
                ["castbar"] = {
                    ["width"] = 65,
                    ["iconSize"] = 32,
                },
            },
            ["raid3"] = {
                ["health"] = {
                    ["text_format"] = "[health:deficit]",
                },
                ["height"] = 40,
                ["power"] = {
                    ["enable"] = true,
                },
                ["healPrediction"] = {
                    ["enable"] = true,
                },
            },
            ["tank"] = {
                ["verticalSpacing"] = 2,
                ["width"] = 85,
            },
            ["party"] = {
                ["name"] = {
                    ["text_format"] = "[namecolor][name:medium] [difficultycolor][level]",
                },
                ["petsGroup"] = {
                    ["disableMouseoverGlow"] = false,
                    ["disableTargetGlow"] = false,
                    ["disableFocusGlow"] = false,
                },
                ["verticalSpacing"] = 6,
                ["health"] = {
                    ["text_format"] = "",
                },
                ["power"] = {
                    ["height"] = 4,
                    ["text_format"] = "",
                },
                ["debuffs"] = {
                    ["priority"] = "",
                    ["sizeOverride"] = 22,
                    ["numrows"] = 2,
                    ["countFontSize"] = 8,
                    ["yOffset"] = 11,
                },
                ["width"] = 120,
                ["targetsGroup"] = {
                    ["disableTargetGlow"] = false,
                    ["disableMouseoverGlow"] = false,
                    ["disableFocusGlow"] = false,
                },
                ["healPrediction"] = {
                    ["enable"] = true,
                },
                ["rdebuffs"] = {
                    ["yOffset"] = 12,
                    ["size"] = 20,
                },
                ["height"] = 44,
                ["visibility"] = "[@raid2,exists][@party1,noexists] hide;show",
                ["buffs"] = {
                    ["perrow"] = 5,
                    ["enable"] = true,
                    ["priority"] = "",
                    ["sizeOverride"] = 22,
                    ["numrows"] = 2,
                    ["countFontSize"] = 8,
                    ["yOffset"] = 11,
                },
            },
            ["arena"] = {
                ["enable"] = false,
            },
            ["raid1"] = {
                ["buffs"] = {
                    ["enable"] = true,
                    ["anchorPoint"] = "CENTER",
                },
                ["height"] = 45,
                ["debuffs"] = {
                    ["enable"] = true,
                    ["anchorPoint"] = "CENTER",
                },
                ["healPrediction"] = {
                    ["enable"] = true,
                },
            },
            ["focus"] = {
                ["health"] = {
                    ["xOffset"] = -37,
                    ["yOffset"] = -18,
                    ["text_format"] = " [perhp]%",
                },
                ["width"] = 120,
                ["enable"] = false,
                ["castbar"] = {
                    ["width"] = 120,
                },
            },
            ["targettarget"] = {
                ["name"] = {
                    ["text_format"] = "[name:medium]",
                },
                ["width"] = 100,
                ["debuffs"] = {
                    ["enable"] = false,
                    ["anchorPoint"] = "TOPRIGHT",
                },
                ["power"] = {
                    ["enable"] = false,
                },
                ["height"] = 35,
                ["threatStyle"] = "GLOW",
                ["disableMouseoverGlow"] = true,
                ["raidicon"] = {
                    ["attachTo"] = "LEFT",
                    ["xOffset"] = 2,
                    ["enable"] = false,
                    ["yOffset"] = 0,
                },
            },
            ["player"] = {
                ["name"] = {
                    ["text_format"] = "[name]   [level]",
                    ["yOffset"] = 16,
                    ["position"] = "TOPLEFT",
                },
                ["portrait"] = {
                    ["overlayAlpha"] = 0.8,
                    ["camDistanceScale"] = 4,
                    ["enable"] = true,
                    ["overlay"] = true,
                },
                ["CombatIcon"] = {
                    ["yOffset"] = 28,
                    ["xOffset"] = -81,
                },
                ["RestIcon"] = {
                    ["size"] = 20,
                },
                ["disableMouseoverGlow"] = true,
                ["castbar"] = {
                    ["insideInfoPanel"] = false,
                    ["height"] = 20,
                    ["width"] = 214,
                },
                ["health"] = {
                    ["xOffset"] = 0,
                    ["text_format"] = "[health:current:shortvalue]                   [perhp]%",
                    ["position"] = "RIGHT",
                },
                ["width"] = 160,
                ["debuffs"] = {
                    ["numrows"] = 2,
                    ["perrow"] = 6,
                    ["sizeOverride"] = 25,
                    ["anchorPoint"] = "BOTTOMLEFT",
                    ["countFontSize"] = 10,
                    ["yOffset"] = -30,
                },
                ["classbar"] = {
                    ["autoHide"] = true,
                    ["detachedWidth"] = 360,
                },
                ["power"] = {
                    ["text_format"] = "[powercolor][curpp]",
                    ["attachTextTo"] = "Power",
                },
                ["height"] = 45,
                ["aurabar"] = {
                    ["enable"] = false,
                    ["height"] = 10,
                },
                ["buffs"] = {
                    ["attachTo"] = "FRAME",
                    ["perrow"] = 6,
                    ["durationPosition"] = "BOTTOM",
                    ["numrows"] = 2,
                    ["countFontSize"] = 10,
                    ["yOffset"] = 15,
                },
            },
        },
        ["colors"] = {
            ["castClassColor"] = true,
            ["auraBarBuff"] = {
                ["r"] = 0.99999779462814,
                ["g"] = 0.48627343773842,
                ["b"] = 0.039215601980686,
            },
            ["healthclass"] = true,
        },
        ["fontOutline"] = "THICKOUTLINE",
        ["smoothbars"] = true,
    },
    ["chat"] = {
        ["panelSnapLeftID"] = 1,
        ["copyChatLines"] = true,
        ["panelWidth"] = 350,
        ["panelColor"] = {
            ["a"] = 0.21593046188355,
            ["r"] = 0.058823529411765,
            ["g"] = 0.058823529411765,
            ["b"] = 0.058823529411765,
        },
        ["customTimeColor"] = {
            ["b"] = 0.70196078431373,
            ["g"] = 0.70196078431373,
            ["r"] = 0.70196078431373,
        },
        ["tabSelectorColor"] = {
            ["r"] = 0.99999779462814,
            ["g"] = 0.95686066150665,
            ["b"] = 0.40784224867821,
        },
        ["tabSelector"] = "NONE",
        ["maxLines"] = 353,
        ["panelBackdrop"] = "LEFT",
        ["scrollDownInterval"] = 30,
        ["editBoxPosition"] = "ABOVE_CHAT",
        ["panelHeight"] = 260,
        ["panelWidthRight"] = 300,
        ["emotionIcons"] = false,
    },
    ["v11NamePlateReset"] = true,
    ["movers"] = {
        ["ElvUIBagMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-420,-249",
        ["PetExperienceBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,423,176",
        ["PowerBarContainerMover"] = "TOP,ElvUIParent,TOP,0,-55",
        ["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0",
        ["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-196",
        ["ElvUF_Raid1Mover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-368,293",
        ["QuestTimerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-171",
        ["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,0,-107",
        ["ClassBarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,475,-31",
        ["BagsMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,33",
        ["AutoButtonAnchor3Mover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-208,214",
        ["LossControlMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-407,101",
        ["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,206,131",
        ["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,423,-416",
        ["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-161,-5",
        ["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,27",
        ["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-140",
        ["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-262",
        ["ElvUF_Raid3Mover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-235",
        ["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,191,289",
        ["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-253,256",
        ["VehicleSeatMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-66,-261",
        ["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,73",
        ["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,525,10",
        ["WTParagonReputationToastFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-49",
        ["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
        ["EuiExecuteMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,634,-367",
        ["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,13",
        ["WTChatBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,288",
        ["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,283,201",
        ["ElvUF_TankMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-71",
        ["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,123,-43",
        ["ElvUF_FocusCastbarMover"] = "TOPLEFT,ElvUF_Focus,BOTTOMLEFT,0,-1",
        ["GMMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,315",
        ["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-2,144",
        ["WTCombatAlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-276",
        ["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-76,-324",
        ["ThreatBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
        ["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,253,256",
        ["ExAE_FrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,360,276",
        ["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
        ["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-160,-133",
        ["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-3,417",
        ["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,131",
        ["ElvUF_PetCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,423,121",
        ["ElvAB_4"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-525,10",
        ["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,371,255",
        ["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-83,-236",
        ["AutoButtonAnchorMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-66,214",
        ["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,164,436",
        ["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-78,323",
        ["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251",
        ["WTGameBarAnchor"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
        ["VOICECHAT"] = "TOP,ElvUIParent,TOP,-251,-3",
        ["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,6",
        ["ElvUF_FocusTargetMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,361,-92",
        ["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
        ["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,423,139",
        ["ReputationBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,0",
        ["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-156,-264",
        ["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-166",
        ["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-51",
        ["ElvUF_FocusMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,222,-81",
        ["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,121,-291",
        ["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0",
        ["WTCustomEmoteFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,324,56",
        ["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-20,4",
        ["EUIMinimapButtonMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-138,-75",
        ["RaidCDAnchorMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,366,-300",
        ["ZoneAbility"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,422,323",
        ["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-441,346",
        ["WTSwitchButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-60,-196",
        ["WTMinimapButtonBarAnchor"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
        ["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,46,103",
        ["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,315",
        ["WTRaidMarkersBarAnchor"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,310",
        ["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,253,245",
        ["ShiftAB"] = "BOTTOM,ElvUIParent,BOTTOM,-175,104",
    },
}

-- FFXIV
WKElvUIConfig_Name_FFXIV = "FFXIV Style"
WKElvUIConfig_FFXIV = {
    
}

function WKElvUIHideTutorial()
    if not ElvDB then ElvDB = {} end
    if not ElvDB["global"] then ElvDB["global"] = {} end
    if not ElvDB["global"]["general"] then ElvDB["global"]["general"] = {} end
    ElvDB["global"]["general"]["hideTutorial"] = true
    
    if ElvUIInstallFrame then
        ElvUIInstallFrame:Hide()
    end
end

function WKElvUISetDefaultConfig(name, realm)
    local name = name
    local realm = realm
    local fullName = name.." - "..realm

    local defaultConfig = WKElvUIConfig_Default
    local simpleStyleConfig = WKElvUIConfig_SimpleStyle

    -- 设置ElvDB默认配置
    if not ElvDB then ElvDB = {}  end
    if not ElvDB["profileKeys"] then  ElvDB["profileKeys"] = {} end 
    -- 对应elv配置设置下拉
    ElvDB["profileKeys"][fullName] = WKElvUIConfig_Name_SimpleStyle

    if not ElvDB["profiles"] then 
        ElvDB["profiles"] = {} 
        ElvDB["profiles"].Default = defaultConfig  
    end
    if not ElvDB["profiles"][WKElvUIConfig_Name_SimpleStyle] then 
        ElvDB["profiles"][WKElvUIConfig_Name_SimpleStyle] = simpleStyleConfig   
    end

    if not ElvPrivateDB then  ElvPrivateDB = {} end
    if not ElvPrivateDB["profileKeys"] then ElvPrivateDB["profileKeys"] = {} end
    -- 对应elv配置个人下拉
    ElvPrivateDB["profileKeys"][fullName] = WKElvUIConfig_Name_SimpleStyle
    
    -- 设置默认配置
    if not ElvPrivateDB["profiles"] then ElvPrivateDB["profiles"] = {} end
    if not ElvPrivateDB["profiles"].Default then 
        ElvPrivateDB["profiles"].Default = {}
        ElvPrivateDB["profiles"].Default.install_complete = 0
    end
    if not ElvPrivateDB["profiles"][WKElvUIConfig_Name_SimpleStyle] then
         ElvPrivateDB["profiles"][WKElvUIConfig_Name_SimpleStyle] = {}
    end
    ElvPrivateDB["profiles"][WKElvUIConfig_Name_SimpleStyle].install_complete = 0
    
    
    -- ElvDB = {
    --     ["profileKeys"] = {
    --         [fullName] = simpleStyleName,
    --     },
    --     ["DisabledAddOns"] = {
    --     },
    --     ["serverID"] = {
    --         [4784] = {
    --             [realm] = true,
    --         },
    --     },
    --     ["class"] = {
    --     },
    --     ["profiles"] = {
    --         ["Default"] = defaultConfig,
    --         [simpleStyleName] = simpleStyleConfig,
    --     },
    --     ["gold"] = {
    --     },
    --     ["global"] = {
    --         ["datatexts"] = {
    --             ["settings"] = {
    --                 ["Currencies"] = {
    --                     ["tooltipData"] = {
    --                         {
    --                             nil,
    --                             nil,
    --                             nil,
    --                             true,
    --                         },
    --                         [4] = {
    --                             nil,
    --                             nil,
    --                             nil,
    --                             true,
    --                         },
    --                         [6] = {
    --                             nil,
    --                             nil,
    --                             nil,
    --                             true,
    --                         },
    --                     },
    --                 },
    --             },
    --         },
    --         ["nameplates"] = {
    --             ["filters"] = {
    --                 ["ElvUI_NonTarget"] = {
    --                 },
    --                 ["ElvUI_Target"] = {
    --                 },
    --                 ["ElvUI_Boss"] = {
    --                 },
    --             },
    --         },
    --     },
    --     ["faction"] = {
    --     },
    --     ["namespaces"] = {
    --         ["LibDualSpec-1.0"] = {
    --         },
    --     },
    -- }
    -- ElvPrivateDB = {
    --     ["profileKeys"] = {
    --         [fullName] = simpleStyleName,
    --     },
    --     ["profiles"] = {
    --         ["Default"] = {
    --             ["install_complete"] = 12, -- 0 1
    --         },
    --         ["Simple Style"] = {
    --             ["install_complete"] = 12, -- 0 1
    --         },
    --     },
    -- }

end