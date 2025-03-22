-- 创建全局WINDKIT表
_G["WindKit"] = _G["WindKit"] or {}

-- 创建ElvUI配置表
ElvDB = ElvDB or {}
ElvPrivateDB = ElvPrivateDB or {}
ElvCharacterDB = ElvCharacterDB or {}


-- 创建本地配置表
local addonName, addon = ...
WindKit.addonName = addonName

-- 获取完整的插件信息
local function GetWindKitInfo(addonName)
    local version = C_AddOns.GetAddOnMetadata(addonName, "Version")
    local title = C_AddOns.GetAddOnMetadata(addonName, "Title")
    local notes = C_AddOns.GetAddOnMetadata(addonName, "Notes")
    local interface = C_AddOns.GetAddOnMetadata(addonName, "Interface")
    return version, title, notes, interface
end

-- 添加加载确认
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD") 
frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        WindKit.DebugPrint("单个插件加载完成")
    elseif event == "VARIABLES_LOADED" then
        WindKit.DebugPrint("所有 SavedVariables 加载完毕")
    elseif event == "PLAYER_LOGIN" then
        WindKit.DebugPrint("玩家数据完全就绪（角色进入世界）")
        WindKit.PrintPlayerInfo()
    elseif event == "PLAYER_ENTERING_WORLD" then
        WindKit.DebugPrint("切换地图或副本")
        local version, title, notes, interface = GetWindKitInfo(WindKit.addonName)
        WindKit.version = version
        WindKit.title = title
        WindKit.notes = notes
        WindKit.interface = interface
    end
    if addonName == "WindKit" then
        -- 注册斜杠命令
        SLASH_WINDKIT1 = "/tf"
        SLASH_WINDKIT2 = "/wk"
        SLASH_WINDKIT3 = "/windkit"
        SlashCmdList["WINDKIT"] = function(msg)
            msg = msg:lower()
            if msg == "info" then
                WindKit.Print("听风一键设置插件工具包")
            elseif msg == "version" then
                WindKit.Print("游戏版本 ", WindKit.version)
            elseif msg == "help" then
                WindKit.Print(" 命令用法:")
                WindKit.Print("  /tf info - 显示角色信息")
                WindKit.Print("  /tf version - 显示版本信息")
            elseif msg == "game" then
                WindKit.ShowGameVersion()
            else
                WindKit.showMainPanel()
            end
        end

        -- 添加测试命令
        SLASH_WINDKITTEST1 = "/wktest"
        SlashCmdList["WINDKITTEST"] = function(msg)
            WindKit.Print("测试命令已执行!")
        end
        SLASH_WINDKITTHELP1 = "/thelp"
        SLASH_WINDKITTHELP2 = "/Whelp"
        SlashCmdList["WINDKITTHELP"] = function(msg)
            WindKit.Print(" 命令用法:")
            WindKit.Print("  /tf info - 显示角色信息")
            WindKit.Print("  /tf version - 显示版本信息")
        end
    end
end)

-- 添加全局函数
function WindKit.GetPlayerInfo()
    if WindKitDB and WindKitDB.playerInfo then
        return WindKitDB.playerInfo.name, 
        WindKitDB.playerInfo.realm, 
        WindKitDB.playerInfo.fullName
    end
    return nil, nil, nil
end

function WindKit.PrintPlayerInfo()
    local name, realm = WindKit.GetPlayerInfo()
    if name and realm then
        WindKit.DebugPrint("角色名: ", name)
        WindKit.DebugPrint("服务器: ", realm)
    else
        WindKit.DebugPrint("|cff33ff99WindKit|r: 角色信息未加载")
    end
end

-- 添加一些实用函数
function WindKit.Print(...)
    print("|cff33ff99WindKit|r:",...)
end

function WindKit.DebugPrint(...)
    --print(txt)
    print("|cff33ff99WindKit Debug|r:", ...)
end

function WindKit.ShowVersion()
    print("|cff33ff99WindKit|r 版本:", WindKit.version)
end

-- 添加获取版本信息的函数
function WindKit.GetGameVersion()
    local version, build, date, tocversion = GetBuildInfo()
    return {
        version = version,
        build = build,
        date = date,
        tocversion = tocversion
    }
end

-- 添加显示版本信息的函数
function WindKit.ShowGameVersion()
    local vInfo = WindKit.GetGameVersion()
    WindKit.Print("游戏版本信息:")
    WindKit.Print("版本: " .. vInfo.version)
    WindKit.Print("构建号: " .. vInfo.build)
    WindKit.Print("构建日期: " .. vInfo.date)
    WindKit.Print("TOC版本: " .. vInfo.tocversion)
end

-- 添加测试命令
SLASH_WINDKITTEST1 = "/wktest"
SlashCmdList["WINDKITTEST"] = function(msg)
    print("WindKit插件测试命令已执行!")
end

-- 设置ElvUI配置
function WindKit.SetElvUIConfig(name, realm) 
    local name = name
    local realm = realm
    local fullName = name.." - "..realm

    --输出加载信息
    print("|cff33ff99WindKit|r: ".."配置已加载")
end