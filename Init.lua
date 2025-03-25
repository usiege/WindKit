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
-- 初始化总览标签内容面板
local function initTotalTabContentPanel(contentPanel, labels)
    
    -- 在总览面板添加下拉菜单
    local dropdown = CreateFrame("Frame", "MyAddonDropDown", contentPanel, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", 20, -40)
    dropdown:SetFrameStrata("DIALOG")
    dropdown:SetFrameLevel(101)
    dropdown.selectedID = 1

    
    -- 获取所有配置名称
    local profiles = labels
    -- 初始化下拉菜单
    local function initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        
        -- 如果没有配置，显示默认选项
        if #profiles == 0 then
            info.text = "默认[听风]"
            info.value = 1
            info.checked = (dropdown.selectedID == 1)
            info.func = function()
                dropdown.selectedID = 1
                UIDropDownMenu_SetSelectedID(dropdown, dropdown.selectedID)
                UIDropDownMenu_SetText(dropdown, "默认[听风]")
                CloseDropDownMenus()
            end
            UIDropDownMenu_AddButton(info, level)
            return
        end
        
        -- 添加所有配置选项
        for index, profileName in ipairs(profiles) do
            info.text = profileName
            info.value = index
            info.checked = (dropdown.selectedID == index)
            info.func = function()
                dropdown.selectedID = index
                UIDropDownMenu_SetSelectedID(dropdown, index)
                UIDropDownMenu_SetText(dropdown, profileName)
                CloseDropDownMenus()
            end
            UIDropDownMenu_AddButton(info, level)
        end
        dropdown.selectedID = 1
    end
    -- 设置下拉菜单的初始化函数
    UIDropDownMenu_Initialize(dropdown, initialize)
            
    -- 设置下拉菜单的默认文本和宽度
    UIDropDownMenu_SetWidth(dropdown, 100)
    UIDropDownMenu_SetButtonWidth(dropdown, 80)
    UIDropDownMenu_SetText(dropdown, "默认[听风]")

    -- 添加一键设置界面按钮
    local setupButton = CreateFrame("Button", nil, contentPanel, "UIPanelButtonTemplate")
    setupButton:SetSize(120, 30)
    setupButton:SetPoint("TOPLEFT", 180, -40)
    setupButton:SetText("一键设置ElvUI")
    
    -- 按钮点击事件
    setupButton:SetScript("OnClick", function()
        WindKit.DebugPrint("打开一键设置界面")
        WKMainPanelFrame:Hide()
        WindKitCharDB.elvuiConfigIfSetted = true
        WindKit.reloadUI()
    end)
   
    return dropdown, setupButton
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

        if WindKitCharDB.elvuiConfigIfSetted then 
            WindKit.hideMainPanel()
        else
            WindKit.showMainPanel()
        end

        -- 初始化总览面板  
        local profiles =  {}
        if ElvDB and ElvDB.profiles then
            for profileName, _ in pairs(ElvDB.profiles) do
                table.insert(profiles, profileName)
            end
            -- 对配置名称进行排序
            table.sort(profiles)
        end
        WindKit.DebugPrint("profiles: ", profiles)
        -- if WKMainPanelFrame.contentPanels[1].dropdown then return end
        local names = WindKit.GetTableValues(profiles)
        local dropdown, setupButton = 
        initTotalTabContentPanel(WKMainPanelFrame.contentPanels[1], names)
        WKMainPanelFrame.contentPanels[1].dropdown = dropdown
        WKMainPanelFrame.contentPanels[1].setupButton = setupButton
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

