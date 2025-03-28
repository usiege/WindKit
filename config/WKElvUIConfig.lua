local ElvUI = ElvUI
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
    ["nameplates"] = {
        ["enable"] = false,
        ["statusbar"] = "Melli",
        ["units"] = {
            ["ENEMY_NPC"] = {
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
            },
            ["TARGET"] = {
                ["classpower"] = {
                    ["enable"] = true,
                    ["yOffset"] = -11,
                    ["width"] = 60,
                },
            },
            ["FRIENDLY_NPC"] = {
                ["debuffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
            },
            ["ENEMY_PLAYER"] = {
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[health:current:shortvalue]  -  [perhp]%",
                    },
                },
            },
            ["FRIENDLY_PLAYER"] = {
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["nameOnly"] = true,
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
            },
        },
        ["clampToScreen"] = true,
    },
}

-- Simple Style
WKElvUIConfig_Name_SimpleStyle = "Simple Style"
WKElvUIConfig_SimpleStyle =  {
    ["databars"] = {
        ["threat"] = {
            ["enable"] = false,
            ["width"] = 472,
            ["height"] = 24,
        },
        ["reputation"] = {
            ["enable"] = true,
            ["width"] = 393,
            ["height"] = 6,
        },
        ["petExperience"] = {
            ["width"] = 65,
        },
        ["experience"] = {
            ["textFormat"] = "PERCENT",
            ["width"] = 393,
            ["height"] = 8,
        },
    },
    ["currentTutorial"] = 3,
    ["general"] = {
        ["autoTrackReputation"] = true,
        ["bordercolor"] = {
            ["a"] = 1,
        },
        ["backdropfadecolor"] = {
            ["a"] = 0.291601300239563,
            ["b"] = 0.05882353335618973,
            ["g"] = 0.05882353335618973,
            ["r"] = 0.05882353335618973,
        },
        ["valuecolor"] = {
            ["a"] = 1,
            ["b"] = 0.8392157554626465,
            ["g"] = 1,
            ["r"] = 0.3254902064800263,
        },
        ["interruptAnnounce"] = "RAID",
        ["loginmessage"] = false,
        ["itemLevel"] = {
            ["itemLevelFontSize"] = 10,
            ["displayCharacterInfo"] = false,
        },
        ["fontSize"] = 14,
        ["altPowerBar"] = {
            ["statusBar"] = "Melli",
        },
        ["afk"] = false,
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
        ["bottomPanel"] = false,
        ["objectiveFrameHeight"] = 550,
        ["backdropcolor"] = {
            ["a"] = 1,
            ["r"] = 0.1882353127002716,
            ["g"] = 0.1882353127002716,
            ["b"] = 0.1882353127002716,
        },
        ["totems"] = {
            ["spacing"] = 8,
            ["growthDirection"] = "HORIZONTAL",
            ["size"] = 30,
        },
        ["bonusObjectivePosition"] = "AUTO",
        ["numberPrefixStyle"] = "CHINESE",
    },
    ["v11NamePlateReset"] = true,
    ["chat"] = {
        ["tabSelectorColor"] = {
            ["b"] = 0.40784224867821,
            ["g"] = 0.95686066150665,
            ["r"] = 0.99999779462814,
        },
        ["tabSelector"] = "NONE",
        ["scrollDownInterval"] = 30,
        ["panelWidth"] = 350,
        ["emotionIcons"] = false,
        ["panelHeight"] = 260,
        ["panelWidthRight"] = 300,
        ["panelBackdrop"] = "LEFT",
        ["panelColor"] = {
            ["a"] = 0.21593046188355,
            ["b"] = 0.058823529411765,
            ["g"] = 0.058823529411765,
            ["r"] = 0.058823529411765,
        },
        ["panelSnapLeftID"] = 1,
        ["editBoxPosition"] = "ABOVE_CHAT",
        ["maxLines"] = 353,
        ["copyChatLines"] = true,
        ["customTimeColor"] = {
            ["r"] = 0.70196078431373,
            ["g"] = 0.70196078431373,
            ["b"] = 0.70196078431373,
        },
    },
    ["dbConverted"] = 13.87,
    ["movers"] = {
        ["ElvUF_FocusCastbarMover"] = "TOPLEFT,ElvUF_Focus,BOTTOMLEFT,0,-1",
        ["ElvUF_FocusTargetMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,361,-92",
        ["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-161,-5",
        ["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-441,346",
        ["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,423,-416",
        ["ZoneAbility"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,422,323",
        ["PowerBarContainerMover"] = "TOP,ElvUIParent,TOP,0,-55",
        ["ElvUF_PetCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,423,121",
        ["VehicleSeatMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-66,-261",
        ["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,191,289",
        ["EuiExecuteMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,634,-367",
        ["LossControlMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-407,101",
        ["WTCombatAlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-276",
        ["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-140",
        ["ElvUF_Raid1Mover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-368,293",
        ["QuestTimerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-171",
        ["PetExperienceBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,423,176",
        ["ReputationBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,0",
        ["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-83,-236",
        ["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0",
        ["ShiftAB"] = "BOTTOM,UIParent,BOTTOM,-152,106",
        ["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-156,-264",
        ["ElvUIBagMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-420,-249",
        ["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
        ["RaidCDAnchorMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,366,-300",
        ["AutoButtonAnchor3Mover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-208,214",
        ["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,123,-43",
        ["WTRaidMarkersBarAnchor"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,310",
        ["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-51",
        ["ThreatBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
        ["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,131",
        ["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,27",
        ["GMMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,315",
        ["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0",
        ["WTChatBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,288",
        ["WTMinimapButtonBarAnchor"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
        ["ElvUF_FocusMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,222,-81",
        ["AutoButtonAnchorMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-66,214",
        ["ClassBarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,475,-31",
        ["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-20,4",
        ["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,253,245",
        ["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,315",
        ["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,46,103",
        ["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,6",
        ["WTSwitchButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-60,-196",
        ["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,253,256",
        ["EUIMinimapButtonMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-138,-75",
        ["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,423,139",
        ["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,0,-107",
        ["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-253,256",
        ["WTCustomEmoteFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,324,56",
        ["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,13",
        ["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,164,436",
        ["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-166",
        ["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-2,144",
        ["WTGameBarAnchor"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
        ["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-196",
        ["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-76,-324",
        ["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,525,10",
        ["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
        ["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,206,131",
        ["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,283,201",
        ["ElvAB_4"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-525,10",
        ["ElvUF_Raid3Mover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-235",
        ["BagsMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,33",
        ["VOICECHAT"] = "TOP,ElvUIParent,TOP,-251,-3",
        ["ExAE_FrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,360,276",
        ["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251",
        ["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,73",
        ["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-78,323",
        ["ElvUF_TankMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-71",
        ["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-262",
        ["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,371,255",
        ["WTParagonReputationToastFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-49",
        ["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,121,-291",
        ["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-3,417",
        ["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-160,-133",
        ["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
    },
    ["convertPages"] = true,
    ["tooltip"] = {
        ["cursorAnchorType"] = "ANCHOR_CURSOR_RIGHT",
        ["modifierID"] = "SHIFT",
        ["healthBar"] = {
            ["fontOutline"] = "NONE",
        },
        ["itemCount"] = {
            ["bags"] = false,
        },
        ["alwaysShowRealm"] = true,
        ["guildRanks"] = false,
        ["showMount"] = false,
    },
    ["unitframe"] = {
        ["font"] = "聊天",
        ["units"] = {
            ["tank"] = {
                ["width"] = 85,
                ["verticalSpacing"] = 2,
            },
            ["raid3"] = {
                ["healPrediction"] = {
                    ["enable"] = true,
                },
                ["height"] = 40,
                ["power"] = {
                    ["enable"] = true,
                },
                ["health"] = {
                    ["text_format"] = "[health:deficit]",
                },
            },
            ["focus"] = {
                ["health"] = {
                    ["xOffset"] = -37,
                    ["text_format"] = " [perhp]%",
                    ["yOffset"] = -18,
                },
                ["enable"] = false,
                ["castbar"] = {
                    ["width"] = 120,
                },
                ["width"] = 120,
            },
            ["target"] = {
                ["debuffs"] = {
                    ["countFontSize"] = 5,
                    ["yOffset"] = 16,
                    ["priority"] = "Blacklist,Personal,nonPersonal",
                    ["numrows"] = 2,
                    ["perrow"] = 7,
                    ["attachTo"] = "FRAME",
                },
                ["CombatIcon"] = {
                    ["xOffset"] = 81,
                    ["yOffset"] = 27,
                },
                ["customTexts"] = {
                    ["精英"] = {
                        ["attachTextTo"] = "Health",
                        ["xOffset"] = -80,
                        ["text_format"] = "[classification:icon][range]",
                        ["yOffset"] = 25,
                        ["font"] = "聊天",
                        ["justifyH"] = "CENTER",
                        ["fontOutline"] = "OUTLINE",
                        ["enable"] = true,
                        ["size"] = 10,
                    },
                },
                ["disableMouseoverGlow"] = true,
                ["name"] = {
                    ["position"] = "TOPRIGHT",
                    ["text_format"] = "[level]   [name]",
                    ["yOffset"] = 16,
                },
                ["height"] = 45,
                ["buffs"] = {
                    ["countFontSize"] = 5,
                    ["growthX"] = "RIGHT",
                    ["yOffset"] = -73,
                    ["anchorPoint"] = "BOTTOMLEFT",
                    ["priority"] = "Blacklist,Dispellable,Personal,nonPersonal,PlayerBuffs,Whitelist",
                    ["numrows"] = 2,
                    ["perrow"] = 7,
                    ["attachTo"] = "DEBUFFS",
                },
                ["aurabar"] = {
                    ["enable"] = false,
                    ["height"] = 18,
                },
                ["castbar"] = {
                    ["insideInfoPanel"] = false,
                    ["width"] = 160,
                    ["height"] = 10,
                },
                ["width"] = 160,
                ["fader"] = {
                    ["range"] = false,
                },
                ["portrait"] = {
                    ["overlay"] = true,
                    ["enable"] = true,
                    ["camDistanceScale"] = 4,
                    ["overlayAlpha"] = 0.8,
                },
                ["orientation"] = "LEFT",
                ["power"] = {
                    ["xOffset"] = -2,
                    ["text_format"] = "[powercolor][  >power:current]",
                    ["attachTextTo"] = "Power",
                    ["position"] = "RIGHT",
                },
                ["health"] = {
                    ["attachTextTo"] = "InfoPanel",
                    ["xOffset"] = 0,
                    ["text_format"] = "[health:current:shortvalue]  -  [perhp]%",
                    ["yOffset"] = 3,
                },
            },
            ["focustarget"] = {
                ["castbar"] = {
                    ["width"] = 80,
                },
                ["width"] = 80,
                ["power"] = {
                    ["enable"] = false,
                },
            },
            ["pet"] = {
                ["debuffs"] = {
                    ["enable"] = true,
                },
                ["name"] = {
                    ["text_format"] = "[happiness:full]",
                    ["yOffset"] = 10,
                },
                ["disableTargetGlow"] = false,
                ["power"] = {
                    ["height"] = 4,
                },
                ["customTexts"] = {
                    ["名字"] = {
                        ["attachTextTo"] = "Health",
                        ["xOffset"] = 0,
                        ["text_format"] = "[namecolor][name:medium]",
                        ["yOffset"] = 0,
                        ["font"] = "聊天",
                        ["justifyH"] = "CENTER",
                        ["fontOutline"] = "OUTLINE",
                        ["enable"] = true,
                        ["size"] = 10,
                    },
                },
                ["width"] = 65,
                ["infoPanel"] = {
                    ["height"] = 14,
                },
                ["castbar"] = {
                    ["iconSize"] = 32,
                    ["width"] = 65,
                },
            },
            ["player"] = {
                ["debuffs"] = {
                    ["countFontSize"] = 10,
                    ["sizeOverride"] = 25,
                    ["yOffset"] = -30,
                    ["anchorPoint"] = "BOTTOMLEFT",
                    ["numrows"] = 2,
                    ["perrow"] = 6,
                },
                ["portrait"] = {
                    ["overlay"] = true,
                    ["enable"] = true,
                    ["camDistanceScale"] = 4,
                    ["overlayAlpha"] = 0.8,
                },
                ["CombatIcon"] = {
                    ["xOffset"] = -81,
                    ["yOffset"] = 28,
                },
                ["disableMouseoverGlow"] = true,
                ["name"] = {
                    ["position"] = "TOPLEFT",
                    ["text_format"] = "[name]   [level]",
                    ["yOffset"] = 16,
                },
                ["height"] = 45,
                ["buffs"] = {
                    ["countFontSize"] = 10,
                    ["yOffset"] = 15,
                    ["durationPosition"] = "BOTTOM",
                    ["numrows"] = 2,
                    ["perrow"] = 6,
                    ["attachTo"] = "FRAME",
                },
                ["castbar"] = {
                    ["insideInfoPanel"] = false,
                    ["height"] = 20,
                    ["width"] = 214,
                },
                ["aurabar"] = {
                    ["enable"] = false,
                    ["height"] = 10,
                },
                ["RestIcon"] = {
                    ["size"] = 20,
                },
                ["power"] = {
                    ["attachTextTo"] = "Power",
                    ["text_format"] = "[powercolor][curpp]",
                },
                ["width"] = 160,
                ["health"] = {
                    ["position"] = "RIGHT",
                    ["xOffset"] = 0,
                    ["text_format"] = "[health:current:shortvalue]                   [perhp]%",
                },
                ["classbar"] = {
                    ["autoHide"] = true,
                    ["detachedWidth"] = 360,
                },
            },
            ["raid1"] = {
                ["healPrediction"] = {
                    ["enable"] = true,
                },
                ["height"] = 45,
                ["buffs"] = {
                    ["enable"] = true,
                    ["anchorPoint"] = "CENTER",
                },
                ["debuffs"] = {
                    ["enable"] = true,
                    ["anchorPoint"] = "CENTER",
                },
            },
            ["assist"] = {
                ["enable"] = false,
            },
            ["arena"] = {
                ["enable"] = false,
            },
            ["targettarget"] = {
                ["debuffs"] = {
                    ["enable"] = false,
                    ["anchorPoint"] = "TOPRIGHT",
                },
                ["threatStyle"] = "GLOW",
                ["power"] = {
                    ["enable"] = false,
                },
                ["disableMouseoverGlow"] = true,
                ["width"] = 100,
                ["height"] = 35,
                ["name"] = {
                    ["text_format"] = "[name:medium]",
                },
                ["raidicon"] = {
                    ["attachTo"] = "LEFT",
                    ["xOffset"] = 2,
                    ["enable"] = false,
                    ["yOffset"] = 0,
                },
            },
            ["party"] = {
                ["verticalSpacing"] = 6,
                ["petsGroup"] = {
                    ["disableTargetGlow"] = false,
                    ["disableFocusGlow"] = false,
                },
                ["targetsGroup"] = {
                    ["disableTargetGlow"] = false,
                    ["disableFocusGlow"] = false,
                },
                ["healPrediction"] = {
                    ["enable"] = true,
                },
                ["name"] = {
                    ["text_format"] = "[namecolor][name:medium] [difficultycolor][level]",
                },
                ["height"] = 44,
                ["buffs"] = {
                    ["countFontSize"] = 8,
                    ["sizeOverride"] = 22,
                    ["enable"] = true,
                    ["yOffset"] = 11,
                    ["priority"] = "",
                    ["numrows"] = 2,
                    ["perrow"] = 5,
                },
                ["visibility"] = "[@raid2,exists][@party1,noexists] hide;show",
                ["rdebuffs"] = {
                    ["yOffset"] = 12,
                    ["size"] = 20,
                },
                ["power"] = {
                    ["text_format"] = "",
                    ["height"] = 4,
                },
                ["width"] = 120,
                ["health"] = {
                    ["text_format"] = "",
                },
                ["debuffs"] = {
                    ["countFontSize"] = 8,
                    ["sizeOverride"] = 22,
                    ["yOffset"] = 11,
                    ["priority"] = "",
                    ["numrows"] = 2,
                },
            },
        },
        ["smoothbars"] = true,
        ["colors"] = {
            ["healthclass"] = true,
            ["castClassColor"] = true,
            ["auraBarBuff"] = {
                ["b"] = 0.039215601980686,
                ["g"] = 0.48627343773842,
                ["r"] = 0.99999779462814,
            },
        },
        ["fontOutline"] = "THICKOUTLINE",
        ["statusbar"] = "ElvUI Blank",
        ["cooldown"] = {
            ["fonts"] = {
                ["enable"] = true,
                ["fontSize"] = 15,
            },
        },
    },
    ["datatexts"] = {
        ["fontSize"] = 10,
        ["fontOutline"] = "OUTLINE",
        ["panels"] = {
            ["MinimapPanel"] = {
                ["backdrop"] = false,
                ["border"] = false,
            },
            ["RightChatDataPanel"] = {
                "Gold",
                "MeetingStone",
                "System",
                ["enable"] = false,
                ["backdrop"] = false,
            },
            ["LeftChatDataPanel"] = {
                "WeakAuras",
                "ElvUI",
                "Durability",
                ["panelTransparency"] = true,
                ["enable"] = false,
                ["backdrop"] = false,
            },
        },
    },
    ["actionbar"] = {
        ["bar3"] = {
            ["buttonsPerRow"] = 4,
            ["visibility"] = "[petbattle] hide; show",
            ["point"] = "TOPLEFT",
            ["buttonSize"] = 31,
            ["macrotext"] = true,
            ["buttons"] = 12,
        },
        ["bar8"] = {
            ["macrotext"] = true,
        },
        ["bar9"] = {
            ["macrotext"] = true,
        },
        ["bar1"] = {
            ["buttonSize"] = 31,
            ["macrotext"] = true,
        },
        ["font"] = "傷害數字",
        ["bar7"] = {
            ["macrotext"] = true,
        },
        ["barPet"] = {
            ["backdrop"] = false,
            ["buttonsPerRow"] = 10,
            ["point"] = "TOPLEFT",
            ["buttonSize"] = 28,
        },
        ["bar6"] = {
            ["enabled"] = true,
            ["point"] = "TOPLEFT",
            ["buttonSize"] = 31,
            ["macrotext"] = true,
        },
        ["bar10"] = {
            ["macrotext"] = true,
        },
        ["microbar"] = {
            ["buttons"] = 11,
            ["buttonSize"] = 23,
        },
        ["bar2"] = {
            ["visibility"] = "[petbattle] hide; show",
            ["buttonSize"] = 31,
            ["macrotext"] = true,
        },
        ["bar5"] = {
            ["buttonsPerRow"] = 12,
            ["visibility"] = "[petbattle] hide; show",
            ["buttonSize"] = 31,
            ["buttons"] = 12,
            ["macrotext"] = true,
        },
        ["stanceBar"] = {
            ["buttonSpacing"] = 1,
            ["buttonSize"] = 25,
            ["style"] = "classic",
        },
        ["cooldown"] = {
            ["override"] = false,
            ["fonts"] = {
                ["enable"] = true,
            },
        },
        ["bar4"] = {
            ["buttonsPerRow"] = 4,
            ["visibility"] = "[petbattle] hide; show",
            ["point"] = "TOPLEFT",
            ["buttonSize"] = 31,
            ["macrotext"] = true,
            ["backdrop"] = false,
        },
    },
    ["nameplates"] = {
        ["enable"] = false,
        ["statusbar"] = "Melli",
        ["units"] = {
            ["ENEMY_NPC"] = {
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
            },
            ["TARGET"] = {
                ["classpower"] = {
                    ["enable"] = true,
                    ["yOffset"] = -11,
                    ["width"] = 60,
                },
            },
            ["FRIENDLY_NPC"] = {
                ["debuffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
            },
            ["ENEMY_PLAYER"] = {
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["buffs"] = {
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[health:current:shortvalue]  -  [perhp]%",
                    },
                },
            },
            ["FRIENDLY_PLAYER"] = {
                ["debuffs"] = {
                    ["yOffset"] = 15,
                    ["size"] = 20,
                },
                ["nameOnly"] = true,
                ["buffs"] = {
                    ["enable"] = false,
                    ["size"] = 20,
                },
                ["health"] = {
                    ["text"] = {
                        ["format"] = "[perhp]%",
                    },
                },
            },
        },
        ["clampToScreen"] = true,
    },
    ["bags"] = {
        ["itemLevelCustomColorEnable"] = true,
        ["bagWidth"] = 550,
        ["bagBar"] = {
            ["growthDirection"] = "HORIZONTAL",
            ["size"] = 25,
        },
        ["bankWidth"] = 550,
        ["bankSize"] = 40,
        ["split"] = {
            ["bagSpacing"] = 7,
            ["bag4"] = true,
            ["bag2"] = true,
            ["bag3"] = true,
            ["bag1"] = true,
        },
        ["scrapIcon"] = true,
        ["vendorGrays"] = {
            ["enable"] = true,
        },
        ["bagSize"] = 40,
    },
    ["cooldown"] = {
        ["hideBlizzard"] = true,
        ["fonts"] = {
            ["enable"] = true,
        },
    },
    ["auras"] = {
        ["debuffs"] = {
            ["size"] = 26,
            ["countFont"] = "傷害數字",
            ["timeFont"] = "傷害數字",
            ["countFontOutline"] = "OUTLINE",
            ["timeFontOutline"] = "OUTLINE",
        },
        ["buffs"] = {
            ["size"] = 26,
            ["countFont"] = "傷害數字",
            ["timeFont"] = "EUI",
            ["countFontOutline"] = "OUTLINE",
            ["timeFontOutline"] = "OUTLINE",
            ["timeFontSize"] = 11,
        },
    },
}

-- FFXIV
WKElvUIConfig_Name_FFXIV = "FFXIV Style"
WKElvUIConfig_FFXIV = {}

------- function




function WKElvUIIfAvailable()
    if ElvUI then
        return true
    else
        return false
    end
end

function WKElvUISetNameplatesEnable(enable)
    if ElvUI and ElvUI[1] and ElvUI[1].db then
        ElvUI[1].db.nameplates.enable = enable
    end
end

function WKElvUIDisabledPlaterNotice()
    if not PlaterDB then return end
    if PlaterDB and PlaterDB.db then
        PlaterDB.db.profile.general.hidePlaterNotice = true
    end
    
    -- 隐藏 ElvUI 提示并禁用 nameplates
    if ElvUI and ElvUI[1] and ElvUI[1].db then
        -- 禁用当前运行的 ElvUI 的 nameplates
        ElvUI[1].db.nameplates.enable = false
        
        -- 禁用全局设置中的 nameplates
        if ElvUI[1].db.global then
            ElvUI[1].db.global.nameplates = ElvUI[1].db.global.nameplates or {}
            ElvUI[1].db.global.nameplates.enable = false
        end
        
        -- 禁用所有配置中的 nameplates
        if ElvUI[1].db.profiles then
            for _, profile in pairs(ElvUI[1].db.profiles) do
                if profile.nameplates then
                    profile.nameplates.enable = false
                end
            end
        end

        -- 强制禁用 nameplates 模块
        if ElvUI[1].NamePlates then
            ElvUI[1].NamePlates:Disable()
        end

        -- 禁用 ElvUI 的 nameplates 模块
        if E and E.private then
            E.private.nameplates = E.private.nameplates or {}
            E.private.nameplates.enable = false
        end

        -- 禁用所有单位的 nameplates
        if ElvUI[1].db.nameplates and ElvUI[1].db.nameplates.units then
            for _, unitData in pairs(ElvUI[1].db.nameplates.units) do
                if unitData then
                    unitData.enable = false
                end
            end
        end

        -- 强制刷新 ElvUI 的 nameplates 设置
        if ElvUI[1].NamePlates and ElvUI[1].NamePlates.UpdateAll then
            ElvUI[1].NamePlates:UpdateAll()
        end
    end
    
    -- 确保 ElvDB 中也禁用了 nameplates
    if ElvDB then
        -- 禁用全局设置
        if not ElvDB.global then ElvDB.global = {} end
        if not ElvDB.global.nameplates then ElvDB.global.nameplates = {} end
        ElvDB.global.nameplates.enable = false
        
        -- 禁用所有配置中的 nameplates
        if ElvDB.profiles then
            for _, profile in pairs(ElvDB.profiles) do
                if profile.nameplates then
                    profile.nameplates.enable = false
                end
            end
        end
    end
    
    -- 确保 ElvPrivateDB 中也禁用了 nameplates
    if ElvPrivateDB then
        if not ElvPrivateDB.global then ElvPrivateDB.global = {} end
        if not ElvPrivateDB.global.nameplates then ElvPrivateDB.global.nameplates = {} end
        ElvPrivateDB.global.nameplates.enable = false
        
        -- 禁用所有配置中的 nameplates
        if ElvPrivateDB.profiles then
            for _, profile in pairs(ElvPrivateDB.profiles) do
                if profile.nameplates then
                    profile.nameplates.enable = false
                end
            end
        end
    end
end

function WKElvUIHideTutorial()
    if not ElvDB then ElvDB = {} end
    if not ElvDB["global"] then ElvDB["global"] = {} end
    if not ElvDB["global"]["general"] then ElvDB["global"]["general"] = {} end
    ElvDB["global"]["general"]["hideTutorial"] = true
    
    if ElvUIInstallFrame then
        ElvUIInstallFrame:Hide()
    end
end

-- 设置当前配置
function WKElvUISetCurrentConfig(fullName, styleName, profile)
    if not fullName then return end
    if not styleName then return end
    if #fullName == 0 or #styleName == 0 then return end

    -- 设置ElvDB默认配置
    if not ElvDB then ElvDB = {}  end
    if not ElvDB["profileKeys"] then  ElvDB["profileKeys"] = {} end 
    -- 对应elv配置设置下拉
    ElvDB["profileKeys"][fullName] = styleName

    -- 设置ElvDB个人配置
    if not ElvPrivateDB then  ElvPrivateDB = {} end
    if not ElvPrivateDB["profileKeys"] then ElvPrivateDB["profileKeys"] = {} end
    -- 对应elv配置个人下拉
    ElvPrivateDB["profileKeys"][fullName] = styleName

    if not profile then return end
    -- 设置ElvDB当前配置
    if not ElvDB["profiles"] then 
        ElvDB["profiles"] = {} 
        ElvDB["profiles"][styleName] = profile
    end
    if not ElvDB["profiles"][styleName] then 
        ElvDB["profiles"][styleName] = profile
    end

    -- 确保禁用nameplates
    if ElvDB["profiles"][styleName] then
        ElvDB["profiles"][styleName].nameplates = ElvDB["profiles"][styleName].nameplates or {}
        ElvDB["profiles"][styleName].nameplates.enable = false
    end

    -- 确保当前运行的ElvUI也禁用nameplates
    if ElvUI and ElvUI[1] and ElvUI[1].db then
        ElvUI[1].db.nameplates.enable = false
    end

    WindKit.currentElvUIProfile = profile
end

-- 设置默认配置
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
        WindKit.currentElvUIProfile = simpleStyleConfig
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
    
    

    -- 确保在配置中也禁用nameplates
    if ElvUI and ElvUI[1] and ElvUI[1].db then
        ElvUI[1].db.nameplates.enable = false
    end

    -- 确保在配置中也禁用nameplates
    if ElvDB and ElvDB.profiles then
        for _, profile in pairs(ElvDB.profiles) do
            if profile.nameplates then
                profile.nameplates.enable = false
            end
        end
    end

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