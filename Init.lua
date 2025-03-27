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
    
    return name, realm, name.." - "..realm
end

-- 初始化函数
local function InitializeConfig()
    -- 获取角色名和服务器名
    local name,realm,fullname = GetPlayerInfo()
    -- 设置默认配置
    WKElvUISetDefaultConfig(name, realm)
    WindKit.DebugPrint("ElvUI默认配置已加载")

    WKPlaterSetDefaultConfig(name, realm)
    WindKit.DebugPrint("Plater默认配置已加载")

    -- 合并默认配置
    for k, v in pairs(defaults) do
        if WindKitDB[k] == nil then
            WindKitDB[k] = v
        end
    end

    -- 获取并保存角色信息
    WindKitDB.playerInfo.name = name
    WindKitDB.playerInfo.realm = realm
    WindKitDB.playerInfo.fullName = fullname
    WindKit.Print("欢迎, "..name.."!")
    WindKit.Print("当前服务器: "..realm)
    WindKit.DebugPrint("全称: "..WindKitDB.playerInfo.fullName)
end

-- 初始化总览标签内容面板
local function initTotalTabElvUIContentPanel(contentPanel, labels)
    
    -- 添加一键设置界面按钮
    local setupButton = CreateFrame("Button", nil, contentPanel, "UIPanelButtonTemplate")
    setupButton:SetSize(120, 30)  -- 调整按钮宽度
    setupButton:SetPoint("TOPLEFT", 20, -40)
    setupButton:SetText("一键设置ElvUI")
    
    -- 按钮点击事件
    setupButton:SetScript("OnClick", function()
        WindKit.DebugPrint("打开一键设置界面")
        WKMainPanelFrame:Hide()
        WindKitCharDB.elvuiConfigIfSetted = true
        -- 设置ElvUI配置
        if ElvDB.profileKeys then
            local fullName = WindKitDB.playerInfo.fullName
            local styleName = WindKitCharDB.SelectElvUIStyleName
            local currentProfile = ElvDB.profiles[styleName]
            WindKit.DebugPrint("current elvui Profile: ", fullName, styleName, currentProfile~=nil)
            WKElvUISetCurrentConfig(fullName, styleName, currentProfile)
        end

        WindKit.reloadUI()
    end)

    -- 在总览面板添加下拉菜单
    local dropdown = CreateFrame("Frame", "MyAddonDropDown", contentPanel, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPRIGHT", setupButton, "BOTTOMRIGHT", 15, -10)  -- 改为相对于按钮定位
    dropdown:SetFrameStrata("DIALOG")
    dropdown:SetFrameLevel(101)
    
    -- 获取所有配置名称
    local profiles = labels
    -- 初始化下拉菜单
    local function initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        -- 初始化选中的配置风格名称
        WindKitCharDB.SelectElvUIStyleName = (WindKitCharDB.SelectElvUIStyleName == "Default" or not WindKitCharDB.SelectElvUIStyleName) 
        and "Default" or WindKitCharDB.SelectElvUIStyleName
        -- 初始化选中的配置风格索引
        WindKitCharDB.SelectStyleIndex = (WindKitCharDB.SelectStyleIndex == 1 or not WindKitCharDB.SelectStyleIndex) 
        and 1 or WindKitCharDB.SelectStyleIndex

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
            WindKitCharDB.SelectElvUIStyleName = "Default"
            return
        end
        
        -- 添加所有配置选项
        for index, profileName in ipairs(profiles) do
            info.text = profileName
            info.value = index
            info.checked = (dropdown.selectedID == index)
            info.func = function()
                dropdown.selectedID = index
                dropdown.selectedText = profileName
                UIDropDownMenu_SetSelectedID(dropdown, index)
                UIDropDownMenu_SetText(dropdown, profileName)
                CloseDropDownMenus()

                -- 保存选中的配置风格名称
                WindKitCharDB.SelectStyleIndex = index
                WindKitCharDB.SelectElvUIStyleName = profileName
            end
            UIDropDownMenu_AddButton(info, level)
        end
        dropdown.selectedID = WindKitCharDB.SelectStyleIndex
        dropdown.selectedText = WindKitCharDB.SelectElvUIStyleName
    end
    -- 设置下拉菜单的初始化函数
    UIDropDownMenu_Initialize(dropdown, initialize)
            
    -- 设置下拉菜单的默认文本和宽度
    UIDropDownMenu_SetWidth(dropdown, 100)  -- 调整下拉菜单宽度
    UIDropDownMenu_SetButtonWidth(dropdown, 80)  -- 调整按钮宽度
    local text = dropdown.selectedText
    UIDropDownMenu_SetText(dropdown, text)
    local selectedID = dropdown.selectedID
    UIDropDownMenu_SetSelectedID(dropdown, selectedID) 

    return dropdown, setupButton
end

-- 初始化总览标签内容面板Plater
local function initTotalTabPlaterContentPanel(contentPanel, labels)
    
    -- 添加一键设置界面按钮
    local setupButton = CreateFrame("Button", nil, contentPanel, "UIPanelButtonTemplate")
    setupButton:SetSize(120, 30)  -- 调整按钮宽度
    setupButton:SetPoint("TOPLEFT", 180, -40)
    setupButton:SetText("一键设置Plater")
    
    -- 按钮点击事件
    setupButton:SetScript("OnClick", function()
        WindKit.DebugPrint("打开一键设置界面")
        WKMainPanelFrame:Hide()
        WindKitCharDB.platerConfigIfSetted = true
        -- 设置Plater配置
        if PlaterDB.profileKeys then
            local fullName = WindKitDB.playerInfo.fullName
            local styleName = WindKitCharDB.SelectPlaterStyleName
            local currentProfile = PlaterDB.profiles[styleName]
            WindKit.DebugPrint("current plater Profile: ", fullName, styleName, currentProfile~=nil)
            WKPlaterSetCurrentConfig(fullName, styleName, currentProfile)
        end

        WindKit.reloadUI()
    end)

    -- 在总览面板添加下拉菜单
    local dropdown = CreateFrame("Frame", "PlaterAddonDropDown", contentPanel, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPRIGHT", setupButton, "BOTTOMRIGHT", 15, -10)  -- 改为相对于按钮定位
    dropdown:SetFrameStrata("DIALOG")
    dropdown:SetFrameLevel(101)
    
    -- 获取所有配置名称
    local profiles = labels
    -- 初始化下拉菜单
    local function initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        -- 初始化选中的配置风格名称
        WindKitCharDB.SelectPlaterStyleName = (WindKitCharDB.SelectPlaterStyleName == "Default" or not WindKitCharDB.SelectPlaterStyleName) 
        and "Default" or WindKitCharDB.SelectPlaterStyleName
        -- 初始化选中的配置风格索引
        WindKitCharDB.SelectPlaterIndex = (WindKitCharDB.SelectPlaterIndex == 1 or not WindKitCharDB.SelectPlaterIndex) 
        and 1 or WindKitCharDB.SelectPlaterIndex

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
            WindKitCharDB.SelectPlaterStyleName = "Default"
            return
        end
        
        -- 添加所有配置选项
        for index, profileName in ipairs(profiles) do
            info.text = profileName
            info.value = index
            info.checked = (dropdown.selectedID == index)
            info.func = function()
                dropdown.selectedID = index
                dropdown.selectedText = profileName
                UIDropDownMenu_SetSelectedID(dropdown, index)
                UIDropDownMenu_SetText(dropdown, profileName)
                CloseDropDownMenus()

                -- 保存选中的配置风格名称
                WindKitCharDB.SelectPlaterIndex = index
                WindKitCharDB.SelectPlaterStyleName = profileName
            end
            UIDropDownMenu_AddButton(info, level)
        end
        dropdown.selectedID = WindKitCharDB.SelectPlaterIndex
        dropdown.selectedText = WindKitCharDB.SelectPlaterStyleName
    end
    -- 设置下拉菜单的初始化函数
    UIDropDownMenu_Initialize(dropdown, initialize)
            
    -- 设置下拉菜单的默认文本和宽度
    UIDropDownMenu_SetWidth(dropdown, 100)  -- 调整下拉菜单宽度
    UIDropDownMenu_SetButtonWidth(dropdown, 80)  -- 调整按钮宽度
    local text = dropdown.selectedText
    UIDropDownMenu_SetText(dropdown, text)
    local selectedID = dropdown.selectedID
    UIDropDownMenu_SetSelectedID(dropdown, selectedID) 

    return dropdown, setupButton
end

-- 添加ESC键处理
local function OnEscapePressed()
    if WKMainPanelFrame and WKMainPanelFrame:IsVisible() then
        WKMainPanelFrame:Hide()
    end
end

-- 初始化框架
local frame = CreateFrame("Frame")
local savedVariablesLoaded = false
local playerEnteringWorld = false
local elvUILoaded = false

frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        -- 检查 ElvUI 是否已加载
        if WKElvUIIfAvailable() and addonName == "WindKit" then
            elvUILoaded = true
            WindKit.DebugPrint("Init-> ElvUI加载完成！")
            InitializeConfig()
        end
    elseif event == "VARIABLES_LOADED" then
            WindKit.DebugPrint("Init-> 玩家数据完全就绪（角色进入世界）")
            savedVariablesLoaded = true
    elseif event == "PLAYER_ENTERING_WORLD" then
        WindKit.DebugPrint("Init-> 切换地图或副本")
        playerEnteringWorld = true

        -- 只有当所有条件都满足时才初始化
        if not (savedVariablesLoaded and playerEnteringWorld) then
            return
        end
        -- 设置总览面板内容
        WindKit.SetPanelTotalContent() 

    elseif event == "PLAYER_LOGIN" then
        -- 角色名，服务器名
        WindKit.PrintPlayerInfo() -- 打印角色信息
        WKElvUIHideTutorial() -- 隐藏ElvUI教程
    end
end)

function WindKit.SetPanelTotalContent() 

    -- 检查 ElvUI 是否已加载
    if not elvUILoaded and WKElvUIIfAvailable() then
        elvUILoaded = true
        WindKit.DebugPrint("Init-> ElvUI加载完成！")
        InitializeConfig()
    end

    if not elvUILoaded then
        WindKit.DebugPrint("Init-> 等待 ElvUI 加载...")
        return
    end

    WindKit.DebugPrint("Init-> 初始化总览面板")
    
    if WindKitCharDB.elvuiConfigIfSetted then 
        WindKit.hideMainPanel()
    else
        WindKit.showMainPanel()
    end

    -- 初始化总览面板ElvUI  
    local elvProfileNames =  {}
    local elvuiProfiles = ElvDB.profiles
    if ElvDB and ElvDB.profiles then
        for profileName, _ in pairs(elvuiProfiles) do
            table.insert(elvProfileNames, profileName)
        end
        -- 对配置名称进行排序
        table.sort(elvProfileNames)
        -- 保存现有配置
        WindKit.ElvUIProfiles = elvuiProfiles
    end
    local elvuiNames = WindKit.GetTableValues(elvProfileNames)
    if WKMainPanelFrame.contentPanels[1].dropdownElvUI then return end
    local dropdownElvUI, setupButtonElvUI = 
    initTotalTabElvUIContentPanel(WKMainPanelFrame.contentPanels[1], elvuiNames)
    WKMainPanelFrame.contentPanels[1].dropdownElvUI = dropdownElvUI
    WKMainPanelFrame.contentPanels[1].setupButtonElvUI = setupButtonElvUI

    -- 初始化总览面板Plater
    local platerProfileNames =  {}
    local platerProfiles = PlaterDB.profiles
    if PlaterDB and PlaterDB.profiles then
        for profileName, _ in pairs(platerProfiles) do
            table.insert(platerProfileNames, profileName)
        end
        -- 对配置名称进行排序
        table.sort(platerProfileNames)
        -- 保存现有配置
        WindKit.PlaterProfiles = platerProfiles
    end
    local platerNames = WindKit.GetTableValues(platerProfileNames)
    if WKMainPanelFrame.contentPanels[1].dropdownPlater then return end
    local dropdownPlater, setupButtonPlater = 
    initTotalTabPlaterContentPanel(WKMainPanelFrame.contentPanels[1], platerNames)
    WKMainPanelFrame.contentPanels[1].dropdownPlater = dropdownPlater
    WKMainPanelFrame.contentPanels[1].setupButtonPlater = setupButtonPlater

    -- 如果plater设置了，那么禁用ElvUI的nameplates
    if WindKitCharDB.platerConfigIfSetted then
        WKElvUISetNameplatesEnable(false)
    end
end


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

