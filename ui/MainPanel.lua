


-- 创建主框架
local mainFrame = CreateFrame("Frame", "MyAddonFrame", UIParent)
mainFrame:SetSize(800, 500)
mainFrame:SetPoint("CENTER")
mainFrame:SetFrameStrata("TOOLTIP")
mainFrame:SetFrameLevel(999)

-- 设置可移动
mainFrame:SetMovable(true)
mainFrame:EnableMouse(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)

-- 创建背景
mainFrame.bg = mainFrame:CreateTexture(nil, "BACKGROUND")
mainFrame.bg:SetAllPoints(true)
mainFrame.bg:SetColorTexture(0, 0, 0, 0.8)

-- 创建标题栏
local titleBar = CreateFrame("Frame", nil, mainFrame)
titleBar:SetSize(800, 30)
titleBar:SetPoint("TOPLEFT")
titleBar.bg = titleBar:CreateTexture(nil, "BACKGROUND")
titleBar.bg:SetAllPoints(true)
titleBar.bg:SetColorTexture(0.1, 0.1, 0.1, 0.9)

-- 创建标题文本
local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("LEFT", 10, 0)
title:SetText("听风一键设置")

-- 创建关闭按钮
local closeButton = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", -5, -5)
closeButton:SetScript("OnClick", function() mainFrame:Hide() end)

-- 创建左侧标签栏
local leftPanel = CreateFrame("Frame", nil, mainFrame)
leftPanel:SetSize(200, 470)
leftPanel:SetPoint("TOPLEFT", 0, -30)
leftPanel.bg = leftPanel:CreateTexture(nil, "BACKGROUND")
leftPanel.bg:SetAllPoints(true)
leftPanel.bg:SetColorTexture(0.15, 0.15, 0.15, 0.9)

-- 创建右侧内容面板
local rightPanel = CreateFrame("Frame", nil, mainFrame)
rightPanel:SetSize(600, 470)
rightPanel:SetPoint("TOPRIGHT", 0, -30)
rightPanel.bg = rightPanel:CreateTexture(nil, "BACKGROUND")
rightPanel.bg:SetAllPoints(true)
rightPanel.bg:SetColorTexture(0.2, 0.2, 0.2, 0.8)

-- 创建游戏设置窗口的函数
local function CreateGameSettingsWindow(gameName)
    -- 检查是否已存在窗口
    if _G["GameSettingsWindow"] then
        _G["GameSettingsWindow"]:Hide()
    end
    
    -- 创建窗口
    local window = CreateFrame("Frame", "GameSettingsWindow", UIParent)
    window:SetSize(300, 400)
    window:SetPoint("CENTER")
    window:SetFrameStrata("DIALOG")
    
    -- 设置可移动
    window:SetMovable(true)
    window:EnableMouse(true)
    window:RegisterForDrag("LeftButton")
    window:SetScript("OnDragStart", window.StartMoving)
    window:SetScript("OnDragStop", window.StopMovingOrSizing)
    
    -- 窗口背景
    window.bg = window:CreateTexture(nil, "BACKGROUND")
    window.bg:SetAllPoints(true)
    window.bg:SetColorTexture(0, 0, 0, 0.9)
    
    -- 标题栏
    local titleBar = CreateFrame("Frame", nil, window)
    titleBar:SetSize(300, 30)
    titleBar:SetPoint("TOPLEFT")
    titleBar.bg = titleBar:CreateTexture(nil, "BACKGROUND")
    titleBar.bg:SetAllPoints(true)
    titleBar.bg:SetColorTexture(0.1, 0.1, 0.1, 0.9)
    
    -- 标题文本
    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("CENTER", titleBar, "CENTER")
    title:SetText(gameName .. " 设置")
    
    -- 关闭按钮
    local closeButton = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", -5, -5)
    closeButton:SetScript("OnClick", function()
        print(gameName .. " 设置已保存")
        window:Hide()
    end)
    
    -- 创建勾选框
    local checkboxes = {
        {text = "启用自动更新", default = true},
        {text = "显示详细日志", default = false},
        {text = "开机自动启动", default = true},
        {text = "最小化到托盘", default = true},
    }
    
    for i, data in ipairs(checkboxes) do
        local checkbox = CreateFrame("CheckButton", nil, window, "UICheckButtonTemplate")
        checkbox:SetSize(24, 24)
        checkbox:SetPoint("TOPLEFT", 20, -50 - (i-1)*30)
        checkbox:SetChecked(data.default)
        
        local label = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
        label:SetText(data.text)
    end
    
    -- 确认按钮
    local confirmButton = CreateFrame("Button", nil, window, "UIPanelButtonTemplate")
    confirmButton:SetSize(100, 25)
    confirmButton:SetPoint("BOTTOMRIGHT", -120, 20)
    confirmButton:SetText("确认")
    confirmButton:SetScript("OnClick", function()
        print(gameName .. " 设置已保存")
        window:Hide()
    end)
    
    -- 取消按钮
    local cancelButton = CreateFrame("Button", nil, window, "UIPanelButtonTemplate")
    cancelButton:SetSize(100, 25)
    cancelButton:SetPoint("BOTTOMRIGHT", -10, 20)
    cancelButton:SetText("取消")
    cancelButton:SetScript("OnClick", function()
        window:Hide()
    end)
end

-- 存储所有内容面板的表
local contentPanels = {}

-- 首先创建下拉菜单的初始化函数
local function CreateDropDownMenu(parent, x, y)
    local dropdown = CreateFrame("Frame", "MyAddonDropDown", parent, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", x, y)
    
    -- 存储当前选中的值
    dropdown.selectedID = 1
    
    local games = {
        {text = "默认[听风]", value = 1},
        {text = "FFXIV", value = 2},
        {text = "OverWatch", value = 3},
        {text = "War3", value = 4},
    }
    
    local function OnClick(self, arg1, arg2, checked)
        dropdown.selectedID = self:GetID()
        UIDropDownMenu_SetSelectedID(dropdown, dropdown.selectedID)
        UIDropDownMenu_SetText(dropdown, games[dropdown.selectedID].text)
        -- 创建新窗口
        CreateGameSettingsWindow(games[dropdown.selectedID].text)
    end
    
    local function initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for k, v in pairs(games) do
            info.text = v.text
            info.value = v.value
            info.func = OnClick
            info.checked = (k == dropdown.selectedID)
            UIDropDownMenu_AddButton(info)
        end
    end
    
    UIDropDownMenu_Initialize(dropdown, initialize)
    UIDropDownMenu_SetWidth(dropdown, 100)
    UIDropDownMenu_SetButtonWidth(dropdown, 124)
    UIDropDownMenu_SetSelectedID(dropdown, dropdown.selectedID)
    UIDropDownMenu_SetText(dropdown, games[dropdown.selectedID].text)
    UIDropDownMenu_JustifyText(dropdown, "LEFT")
    
    return dropdown
end

-- 创建标签按钮的函数
local function CreateTabButton(text, index)
    local button = CreateFrame("Button", nil, leftPanel)
    button:SetSize(190, 30)
    button:SetPoint("TOPLEFT", 5, -5 - (index-1)*35)
    
    -- 按钮背景
    button.bg = button:CreateTexture(nil, "BACKGROUND")
    button.bg:SetAllPoints(true)
    button.bg:SetColorTexture(0.3, 0.3, 0.3, 0.5)
    
    -- 按钮文本
    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("LEFT", 10, 0)
    button.text:SetText(text)
    
    -- 高亮材质
    button:SetHighlightTexture("Interface\\Buttons\\UI-ListBox-Highlight")
    
    -- 创建对应的内容面板
    local contentPanel = CreateFrame("Frame", nil, rightPanel)
    contentPanel:SetSize(590, 460)
    contentPanel:SetPoint("TOPLEFT", 5, -5)
    contentPanel:Hide()
    
    contentPanels[index] = contentPanel
    
    -- 点击事件
    button:SetScript("OnClick", function()
        -- 隐藏所有内容面板
        for _, panel in pairs(contentPanels) do
            panel:Hide()
        end
        -- 显示当前内容面板
        contentPanel:Show()
        
        -- 重置所有按钮背景
        for _, btn in pairs(leftPanel.buttons) do
            btn.bg:SetColorTexture(0.3, 0.3, 0.3, 0.5)
        end
        -- 设置当前按钮背景
        button.bg:SetColorTexture(0.4, 0.4, 0.4, 0.8)
    end)
    
    return button
end

-- 存储所有按钮的表
leftPanel.buttons = {}

-- 创建示例标签
local tabNames = {"总览", "设置", "统计", "帮助"}
for i, name in ipairs(tabNames) do
    leftPanel.buttons[i] = CreateTabButton(name, i)
    -- 其他标签页的默认内容
    local content = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    content:SetPoint("TOPLEFT", 10, -10)
    content:SetText(name .. " 面板的内容")

    -- 添加一键设置
    if name == "总览" then
        -- 在总览面板添加下拉菜单
        local dropdown = CreateDropDownMenu(contentPanels[i], 20, -40)
        
        -- 添加一键设置界面按钮
        local setupButton = CreateFrame("Button", nil, contentPanels[i], "UIPanelButtonTemplate")
        setupButton:SetSize(120, 30)
        setupButton:SetPoint("TOPLEFT", 20, -100) -- 位置在下拉菜单下方
        setupButton:SetText("一键设置界面")
        
        -- 按钮点击事件
        setupButton:SetScript("OnClick", function()
            -- 这里可以添加打开设置界面的逻辑
            WindKit.DebugPrint("打开一键设置界面")
            -- 如果有其他设置窗口函数，可以在这里调用
            -- 例如：CreateGameSettingsWindow("FFXIV")
            -- 隐藏界面
            mainFrame:Hide()
            -- 设置

            -- 重载窗口
            WindKit.reloadUI()
        end)
        
    else
        
    end
end

-- 默认显示第一个标签的内容
leftPanel.buttons[1]:Click()

-- 添加显示/隐藏命令
local function showPanel(msg)
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end


local function reloadUI()
    ReloadUI()
end

-- 注册全局函数
WindKit.reloadUI = reloadUI
WindKit.showMainPanel = showPanel