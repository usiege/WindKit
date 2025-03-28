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

    -- 延迟加载Details配置，确保Details插件已完全加载
    local function TryLoadDetailsConfig(attempts)
        attempts = attempts or 0
        
        -- 最多尝试5次
        if attempts >= 5 then
            WindKit.DebugPrint("Details配置加载失败，请重载UI")
            return
        end
        
        -- 检查Details是否完全加载
        if Details and _detalhes and _detalhes.tabela_instancias then
            WKDetailsSetDefaultConfig()
            WindKit.DebugPrint("Details默认配置已加载")
            
            -- 延迟一点时间再刷新界面
            C_Timer.After(1, function()
                if WKDetailsIsAvailable() then
                    WKDetailsForceReloadConfig()
                    WindKit.DebugPrint("Details界面已刷新")
                end
            end)
        else
            -- 如果Details还没加载完成，0.5秒后再尝试
            WindKit.DebugPrint("Details未完全加载，稍后再试...")
            C_Timer.After(0.5, function()
                TryLoadDetailsConfig(attempts + 1)
            end)
        end
    end
    
    -- 启动Details配置加载过程
    TryLoadDetailsConfig()

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
    
    -- 确保WindKitCharDB存在
    if not WindKitCharDB then
        WindKitCharDB = {}
    end
    
    -- 确保缩放值存在
    if not WindKitCharDB.scale then
        WindKitCharDB.scale = 1.0
    end
    
    WindKit.DebugPrint("角色缩放设置: " .. (WindKitCharDB.scale or "未设置"))
end

-- 初始化总览标签内容面板
local function initTotalTabElvUIContentPanel(contentPanel, labels)
    -- 确保 WindKitCharDB 存在
    if not WindKitCharDB then
        WindKitCharDB = {}
    end
    
    -- 添加一键设置界面按钮
    local setupButton = CreateFrame("Button", nil, contentPanel)
    setupButton:SetSize(120, 30)  -- 调整按钮宽度
    setupButton:SetPoint("TOPLEFT", 20, -40)
    
    -- 设置按钮使用图片背景
    local bgTexture = setupButton:CreateTexture(nil, "BACKGROUND")
    bgTexture:SetAllPoints(true)
    bgTexture:SetTexture("Interface\\AddOns\\WindKit\\media\\elvui.png")
    
    -- 设置高亮效果
    local highlightTexture = setupButton:CreateTexture(nil, "HIGHLIGHT")
    highlightTexture:SetAllPoints(true)
    highlightTexture:SetTexture("Interface\\AddOns\\WindKit\\media\\highlight.png")
    setupButton:SetHighlightTexture(highlightTexture)
    
    -- 按钮点击事件
    setupButton:SetScript("OnClick", function()
        WindKit.DebugPrint("打开一键设置界面")
        WKMainPanelFrame:Hide()
        WindKitCharDB.elvuiConfigIfSetted = true
        -- 设置ElvUI配置
        if ElvDB and ElvDB.profileKeys then
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
    dropdown:SetPoint("TOPLEFT", setupButton, "BOTTOMLEFT", -5, -10)  -- 将下拉菜单放在按钮正下方
    dropdown:SetFrameStrata("DIALOG")
    dropdown:SetFrameLevel(101)
    
    -- 修改下拉菜单背景为透明
    local dropdownButton = _G[dropdown:GetName().."Button"]
    if dropdownButton then
        dropdownButton:SetNormalTexture("")
        dropdownButton:SetHighlightTexture("")
        dropdownButton:SetPushedTexture("")
        dropdownButton:SetDisabledTexture("")
        
        local bgTexture = dropdownButton:CreateTexture(nil, "BACKGROUND")
        bgTexture:SetAllPoints(true)
        bgTexture:SetColorTexture(0, 0, 0, 0) -- 完全透明
        
        local hlTexture = dropdownButton:CreateTexture(nil, "HIGHLIGHT")
        hlTexture:SetAllPoints(true)
        hlTexture:SetTexture("Interface\\AddOns\\WindKit\\media\\highlight.png")
        dropdownButton:SetHighlightTexture(hlTexture)
    end
    
    local dropdownLeft = _G[dropdown:GetName().."Left"]
    local dropdownMiddle = _G[dropdown:GetName().."Middle"]
    local dropdownRight = _G[dropdown:GetName().."Right"]
    
    if dropdownLeft then dropdownLeft:SetVertexColor(0.6, 0.6, 0.6, 0) end
    if dropdownMiddle then dropdownMiddle:SetVertexColor(0.6, 0.6, 0.6, 0) end
    if dropdownRight then dropdownRight:SetVertexColor(0.6, 0.6, 0.6, 0) end
    
    -- 调整菜单细节位置
    hooksecurefunc("UIDropDownMenu_CreateFrames", function()
        local listFrame = _G["DropDownList1"]
        if listFrame and dropdown:IsVisible() and listFrame:IsVisible() then
            listFrame:ClearAllPoints()
            listFrame:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 10, 0)
        end
    end)
    
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
    UIDropDownMenu_SetButtonWidth(dropdown, 130)  -- 调整按钮宽度
    local text = dropdown.selectedText or "默认[听风]"
    UIDropDownMenu_SetText(dropdown, text)
    local selectedID = dropdown.selectedID or 1
    UIDropDownMenu_SetSelectedID(dropdown, selectedID) 

    return dropdown, setupButton
end

-- 初始化总览标签内容面板Plater
local function initTotalTabPlaterContentPanel(contentPanel, labels)
    -- 确保 WindKitCharDB 存在
    if not WindKitCharDB then
        WindKitCharDB = {}
    end
    
    -- 添加一键设置界面按钮
    local setupButton = CreateFrame("Button", nil, contentPanel)
    setupButton:SetSize(120, 30)  -- 调整按钮宽度
    setupButton:SetPoint("TOPLEFT", 180, -40)
    
    -- 设置按钮使用图片背景
    local bgTexture = setupButton:CreateTexture(nil, "BACKGROUND")
    bgTexture:SetAllPoints(true)
    bgTexture:SetTexture("Interface\\AddOns\\WindKit\\media\\plater.png")
    
    -- 设置高亮效果
    local highlightTexture = setupButton:CreateTexture(nil, "HIGHLIGHT")
    highlightTexture:SetAllPoints(true)
    highlightTexture:SetTexture("Interface\\AddOns\\WindKit\\media\\highlight.png")
    setupButton:SetHighlightTexture(highlightTexture)
    
    -- 按钮点击事件
    setupButton:SetScript("OnClick", function()
        WindKit.DebugPrint("打开一键设置界面")
        WKMainPanelFrame:Hide()
        WindKitCharDB.platerConfigIfSetted = true
        -- 设置Plater配置
        if PlaterDB and PlaterDB.profileKeys then
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
    dropdown:SetPoint("TOPLEFT", setupButton, "BOTTOMLEFT", -5, -10)  -- 将下拉菜单放在按钮正下方
    dropdown:SetFrameStrata("DIALOG")
    dropdown:SetFrameLevel(101)
    
    -- 修改下拉菜单背景为透明
    local dropdownButton = _G[dropdown:GetName().."Button"]
    if dropdownButton then
        dropdownButton:SetNormalTexture("")
        dropdownButton:SetHighlightTexture("")
        dropdownButton:SetPushedTexture("")
        dropdownButton:SetDisabledTexture("")
        
        local bgTexture = dropdownButton:CreateTexture(nil, "BACKGROUND")
        bgTexture:SetAllPoints(true)
        bgTexture:SetColorTexture(0, 0, 0, 0) -- 完全透明
        
        local hlTexture = dropdownButton:CreateTexture(nil, "HIGHLIGHT")
        hlTexture:SetAllPoints(true)
        hlTexture:SetTexture("Interface\\AddOns\\WindKit\\media\\highlight.png")
        dropdownButton:SetHighlightTexture(hlTexture)
    end
    
    local dropdownLeft = _G[dropdown:GetName().."Left"]
    local dropdownMiddle = _G[dropdown:GetName().."Middle"]
    local dropdownRight = _G[dropdown:GetName().."Right"]
    
    if dropdownLeft then dropdownLeft:SetVertexColor(0.6, 0.6, 0.6, 0) end
    if dropdownMiddle then dropdownMiddle:SetVertexColor(0.6, 0.6, 0.6, 0) end
    if dropdownRight then dropdownRight:SetVertexColor(0.6, 0.6, 0.6, 0) end
    
    -- 调整菜单细节位置
    hooksecurefunc("UIDropDownMenu_CreateFrames", function()
        local listFrame = _G["DropDownList1"]
        if listFrame and dropdown:IsVisible() and listFrame:IsVisible() then
            listFrame:ClearAllPoints()
            listFrame:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 10, 0)
        end
    end)
    
    -- 获取所有配置名称
    local profiles = labels
    -- 初始化下拉菜单
    local function initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        -- 初始化选中的配置风格名称
        WindKitCharDB.SelectPlaterStyleName = (WindKitCharDB.SelectPlaterStyleName == "Default" or not WindKitCharDB.SelectPlaterStyleName) 
        and "Default" or WindKitCharDB.SelectPlaterStyleName
        -- 初始化选中的配置风格索引
        WindKitCharDB.SelectPlaterStyleIndex = (WindKitCharDB.SelectPlaterStyleIndex == 1 or not WindKitCharDB.SelectPlaterStyleIndex) 
        and 1 or WindKitCharDB.SelectPlaterStyleIndex

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
                WindKitCharDB.SelectPlaterStyleIndex = index
                WindKitCharDB.SelectPlaterStyleName = profileName
            end
            UIDropDownMenu_AddButton(info, level)
        end
        dropdown.selectedID = WindKitCharDB.SelectPlaterStyleIndex
        dropdown.selectedText = WindKitCharDB.SelectPlaterStyleName
    end
    -- 设置下拉菜单的初始化函数
    UIDropDownMenu_Initialize(dropdown, initialize)
            
    -- 设置下拉菜单的默认文本和宽度
    UIDropDownMenu_SetWidth(dropdown, 100)  -- 调整下拉菜单宽度
    UIDropDownMenu_SetButtonWidth(dropdown, 130)  -- 调整按钮宽度
    local text = dropdown.selectedText or "默认[听风]"
    UIDropDownMenu_SetText(dropdown, text)
    local selectedID = dropdown.selectedID or 1
    UIDropDownMenu_SetSelectedID(dropdown, selectedID) 

    return dropdown, setupButton
end

-- 添加ESC键处理
local function OnEscapePressed()
    if WKMainPanelFrame and WKMainPanelFrame:IsVisible() then
        -- 记录面板已关闭状态
        if WindKitCharDB then
            WindKitCharDB.panelClosed = true
        end
        WKMainPanelFrame:Hide()
    end
end

-- 创建斜杠命令
local function CreateSlashCommands()
    -- 注册斜杠命令
    SLASH_WINDKIT1 = "/tf"
    SLASH_WINDKIT2 = "/wk"
    SLASH_WINDKIT3 = "/windkit"
    SlashCmdList["WINDKIT"] = function(msg)
        msg = msg:lower()
        if msg == "info" then
            WindKit.Print("听风一键设置插件工具包")
        elseif msg == "version" then
            WindKit.Print("插件版本 ", WindKit.version)
        elseif msg == "help" then
            WindKit.Print(" 命令用法 ")
            WindKit.Print("  /tf info - 显示角色信息")
            WindKit.Print("  /tf version - 显示版本信息")
            WindKit.Print("  /tf reset - 重置面板状态")
        elseif msg == "game" then
            WindKit.ShowGameVersion()
        elseif msg == "reset" then
            -- 重置面板状态
            if WindKitCharDB then
                WindKitCharDB.panelClosed = false
                WindKit.Print("面板状态已重置，将在下次登录时显示主界面")
            end
            WindKit.showMainPanel()
        else
            if WindKit.panelIsShow() then
                -- 记录面板已关闭状态
                if WindKitCharDB then
                    WindKitCharDB.panelClosed = true
                end
                WindKit.hideMainPanel()
            else
                -- 不再自动清除面板关闭状态，只显示面板
                WindKit.showMainPanel()
            end
        end
    end

    -- 添加测试命令
    SLASH_WINDKITTEST1 = "/wktest"
    SlashCmdList["WINDKITTEST"] = function(msg)
        WindKit.Print("测试命令已执行!")
    end
    SLASH_WINDKITTHELP1 = "/thelp"
    SLASH_WINDKITTHELP2 = "/whelp"
    SlashCmdList["WINDKITTHELP"] = function(msg)
        WindKit.Print(" 命令用法:")
        WindKit.Print("  /tf info - 显示角色信息")
        WindKit.Print("  /tf version - 显示版本信息")
        WindKit.Print("  /tf reset - 重置面板状态")
    end 
end

-- 创建ESC菜单按钮
local function CreateESCButton()
    -- 创建按钮
    local button = CreateFrame("Button", "WindKitESCButton", GameMenuFrame)
    button:SetSize(140, 20)
    
    -- 创建背景纹理
    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
    bg:SetVertexColor(0, 0, 0, 0.7)
    
    -- 设置按钮文字
    local fontString = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fontString:SetPoint("CENTER", 0, 0)
    fontString:SetText("WindKit")
    fontString:SetTextColor(0, 1, 1, 1) -- 青色文字
    
    -- 设置按钮位置（在菜单外部上方）
    button:SetPoint("BOTTOM", GameMenuFrame, "TOP", 0, 0)
    
    -- 设置按钮点击事件
    button:SetScript("OnClick", function()
        if WindKit.panelIsShow() then
            -- 记录面板已关闭状态
            if WindKitCharDB then
                WindKitCharDB.panelClosed = true
            end
            WindKit.hideMainPanel()
        else
            -- 不再自动清除面板关闭状态，只显示面板
            WindKit.showMainPanel()
        end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
        HideUIPanel(GameMenuFrame)
    end)
    
    -- 添加鼠标悬停效果
    button:SetScript("OnEnter", function(self)
        bg:SetVertexColor(0.1, 0.1, 0.1, 0.8)
    end)
    
    button:SetScript("OnLeave", function(self)
        bg:SetVertexColor(0, 0, 0, 0.7)
    end)
    
    -- 调整其他按钮的位置
    local buttons = {
        GameMenuButtonSettings,
        GameMenuButtonUIOptions,
        GameMenuButtonKeybindings,
        GameMenuButtonMacros,
        GameMenuButtonAddons,
        GameMenuButtonLogout,
        GameMenuButtonQuit
    }
    
    local lastButton = GameMenuButtonSettings
    for _, menuButton in ipairs(buttons) do
        if menuButton and menuButton ~= button then
            menuButton:ClearAllPoints()
            menuButton:SetPoint("TOPLEFT", lastButton, "BOTTOMLEFT", 0, -2)
            lastButton = menuButton
        end
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
        
        -- 检查 Details 是否已加载
        if addonName == "Details" then
            WindKit.DebugPrint("Init-> Details加载完成！")
            -- 延迟一点时间再加载Details配置，确保Details完全初始化
            C_Timer.After(1, function()
                if Details and _detalhes and _detalhes.tabela_instancias then
                    -- 重新应用Details配置
                    WKDetailsSetDefaultConfig()
                    
                    -- 延迟刷新界面
                    C_Timer.After(0.5, function()
                        if WKDetailsIsAvailable() then
                            WKDetailsForceReloadConfig()
                        end
                    end)
                else
                    WindKit.DebugPrint("Details尚未完全初始化，将在进入游戏后尝试加载配置")
                end
            end)
        end
    elseif event == "VARIABLES_LOADED" then
        WindKit.DebugPrint("Init-> 玩家数据完全就绪（角色进入世界）")
        savedVariablesLoaded = true
        CreateSlashCommands()
    elseif event == "PLAYER_ENTERING_WORLD" then
        WindKit.DebugPrint("Init-> 切换地图或副本")
        playerEnteringWorld = true

        -- 只有当所有条件都满足时才初始化
        if not (savedVariablesLoaded and playerEnteringWorld) then
            return
        end
        
        -- 检查Details是否已加载但配置未应用
        if Details and _detalhes and not _detalhes.setup_fully_completed then
            WindKit.DebugPrint("Init-> 检测到Details已加载但尚未完成设置")
            -- 延迟应用Details配置
            C_Timer.After(1, function()
                WKDetailsSetDefaultConfig()
                C_Timer.After(0.5, function()
                    if WKDetailsIsAvailable() then
                        WKDetailsForceReloadConfig()
                    end
                end)
            end)
        end
        
        -- 延迟一帧执行，确保UI元素都已创建
        C_Timer.After(0.1, function()
            -- 设置总览面板内容
            WindKit.SetPanelTotalContent()
        end)
    elseif event == "PLAYER_LOGIN" then
        -- 角色名，服务器名
        WindKit.PrintPlayerInfo() -- 打印角色信息
        WKElvUIHideTutorial() -- 隐藏ElvUI教程
        WKElvUIDisabledPlaterNotice() -- Plater冲突提示设置
        
        -- 添加 ESC 键处理
        tinsert(UISpecialFrames, "WKMainPanelFrame")
        
        -- 创建ESC菜单按钮
        CreateESCButton()
        
        -- 确保面板内容已初始化
        C_Timer.After(0.1, function()
            WindKit.SetPanelTotalContent()
        end)
    end
end)

function WindKit.SetPanelTotalContent() 
    -- 确保WindKitCharDB存在
    if not WindKitCharDB then
        WindKitCharDB = {}
    end
    
    -- 确保缩放值存在
    if not WindKitCharDB.scale then
        WindKitCharDB.scale = 1.0
        WindKit.DebugPrint("初始化缩放设置为默认值: 1.0")
    end
    
    -- 检查 ElvUI 是否已加载
    if not elvUILoaded and WKElvUIIfAvailable() then
        elvUILoaded = true
        WindKit.DebugPrint("Init-> ElvUI加载完成！")
        InitializeConfig()
    end

    -- 确保所有必要的变量都已准备好
    if not (ElvDB and ElvDB.profiles and PlaterDB and PlaterDB.profiles) then
        WindKit.DebugPrint("Init-> 等待配置加载...")
        return
    end

    -- 确保主面板和内容面板存在
    if not (WKMainPanelFrame and WKMainPanelFrame.contentPanels and WKMainPanelFrame.contentPanels[1]) then
        WindKit.DebugPrint("Init-> 等待主面板创建...")
        return
    end

    -- 如果ElvUI或Plater配置已设置，或用户手动关闭了面板，则隐藏主面板
    if WindKitCharDB.elvuiConfigIfSetted or WindKitCharDB.platerConfigIfSetted or WindKitCharDB.panelClosed then 
        WindKit.hideMainPanel()
    else
        WindKit.showMainPanel()
    end

    WindKit.DebugPrint("Init-> 初始化总览")

    -- 初始化总览面板ElvUI  
    local elvProfileNames = {}
    if ElvDB and ElvDB.profiles then
        for profileName, _ in pairs(ElvDB.profiles) do
            table.insert(elvProfileNames, profileName)
        end
        -- 对配置名称进行排序
        table.sort(elvProfileNames)
        -- 保存现有配置
        WindKit.ElvUIProfiles = ElvDB.profiles
    end

    -- 初始化总览面板Plater
    local platerProfileNames = {}
    if PlaterDB and PlaterDB.profiles then
        for profileName, _ in pairs(PlaterDB.profiles) do
            table.insert(platerProfileNames, profileName)
        end
        -- 对配置名称进行排序
        table.sort(platerProfileNames)
        -- 保存现有配置
        WindKit.PlaterProfiles = PlaterDB.profiles
    end

    -- 获取配置名称列表
    local elvuiNames = WindKit.GetTableValues(elvProfileNames)
    local platerNames = WindKit.GetTableValues(platerProfileNames)

    -- 初始化 ElvUI 按钮和下拉菜单
    if not WKMainPanelFrame.contentPanels[1].dropdownElvUI then
        local dropdownElvUI, setupButtonElvUI = initTotalTabElvUIContentPanel(WKMainPanelFrame.contentPanels[1], elvuiNames)
        WKMainPanelFrame.contentPanels[1].dropdownElvUI = dropdownElvUI
        WKMainPanelFrame.contentPanels[1].setupButtonElvUI = setupButtonElvUI
    end

    -- 初始化 Plater 按钮和下拉菜单
    if not WKMainPanelFrame.contentPanels[1].dropdownPlater then
        local dropdownPlater, setupButtonPlater = initTotalTabPlaterContentPanel(WKMainPanelFrame.contentPanels[1], platerNames)
        WKMainPanelFrame.contentPanels[1].dropdownPlater = dropdownPlater
        WKMainPanelFrame.contentPanels[1].setupButtonPlater = setupButtonPlater
    end

    -- 如果plater设置了，那么禁用ElvUI的nameplates
    if WindKitCharDB.platerConfigIfSetted then
        WKElvUISetNameplatesEnable(false)
    end

    -- Details强制刷新
    if WKDetailsIsAvailable() then
        -- 在Details完全加载后再刷新
        if Details and _detalhes and _detalhes.tabela_instancias then
            C_Timer.After(0.2, function()
                WKDetailsForceReloadConfig()
            end)
        end
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

