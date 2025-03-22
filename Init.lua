-- 创建全局配置表
WindKitDB = WindKitDB or {}
WindKitCharDB = WindKitCharDB or {}


-- 创建本地配置表
local addonName, addon = ...

-- 默认配置
local defaults = {
    -- 角色信息
    playerInfo = {
        name = "",
        realm = "",
        fullName = "" -- 角色名-服务器名
    },
    
    -- UI缩放
    scale = 1.0,
    
    -- 界面位置
    position = {
        x = 0,
        y = 0
    },
    
    -- 界面颜色主题
    colors = {
        primary = {r = 0.6, g = 0.6, b = 1.0},
        secondary = {r = 0.3, g = 0.3, b = 0.8},
        background = {r = 0.1, g = 0.1, b = 0.1, a = 0.9}
    },
    
    -- 功能开关
    features = {
        showJobIcons = true,
        useFFXIVStyle = true,
        showLimitBreak = true
    }
}


-- 获取角色信息
local function GetPlayerInfo()
    local name = UnitName("player")
    local realm = GetRealmName()
    
    -- 如果realm为空，使用当前服务器
    if realm == "" then
        realm = GetNormalizedRealmName() or realm
    end
    
    return name, realm, name.."-"..realm
end

-- 初始化函数
local function InitializeConfig()
    -- 合并默认配置
    for k, v in pairs(defaults) do
        if WindKitDB[k] == nil then
            WindKitDB[k] = v
        end
    end

    -- 获取并保存角色信息
    local name, realm, fullName = GetPlayerInfo()
    WindKitDB.playerInfo.name = name
    WindKitDB.playerInfo.realm = realm
    WindKitDB.playerInfo.fullName = fullName
end

-- 初始化框架
local frame = CreateFrame("Frame")
-- 注册事件
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == "WindKit" then
        InitializeConfig()
    elseif event == "PLAYER_ENTERING_WORLD" then
        local name = WindKitDB.playerInfo.name
        local realm = WindKitDB.playerInfo.realm

        -- 打印欢迎信息，包含角色名和服务器名
        print(string.format("|cff33ff99WindKit|r: 欢迎, %s!", name))
        print(string.format("|cff33ff99WindKit|r: 当前服务器: %s", realm))
    end
end)

-- 导出配置接口
addon.config = {
    -- 添加获取角色信息的接口
    GetPlayerInfo = function()
        return WindKitDB.playerInfo.name,
               WindKitDB.playerInfo.realm,
               WindKitDB.playerInfo.fullName
    end,
    
    GetScale = function()
        return WindKitDB.scale
    end,
    
    SetScale = function(value)
        WindKitDB.scale = value
    end,
    
    GetPosition = function()
        return WindKitDB.position.x, WindKitDB.position.y
    end,
    
    SetPosition = function(x, y)
        WindKitDB.position.x = x
        WindKitDB.position.y = y
    end,
    
    GetFeature = function(featureName)
        return WindKitDB.features[featureName]
    end,
    
    SetFeature = function(featureName, value)
        WindKitDB.features[featureName] = value
    end
} 

