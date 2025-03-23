-- 创建主框架
local mainFrame = CreateFrame("Frame", "MyAddonFrame", UIParent)
mainFrame:SetSize(800, 510)
mainFrame:SetPoint("CENTER")
mainFrame:SetFrameStrata("DIALOG")
mainFrame:SetFrameLevel(100)

-- 设置可移动
mainFrame:SetMovable(true)
mainFrame:EnableMouse(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)

-- 修改主框架的背景和边框
-- 背景
mainFrame.bg = mainFrame:CreateTexture(nil, "BACKGROUND")
mainFrame.bg:SetAllPoints(true)
mainFrame.bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

-- 创建标题栏
local titleBar = CreateFrame("Frame", nil, mainFrame)
titleBar:SetSize(800, 30)
titleBar:SetPoint("TOPLEFT")
titleBar.bg = titleBar:CreateTexture(nil, "BACKGROUND")
titleBar.bg:SetAllPoints(true)
titleBar.bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

-- 创建标题文本
local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("LEFT", 10, 0)
title:SetText("听风一键设置")

-- 创建关闭按钮
local closeButton = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", -2, -2)
closeButton:SetScript("OnClick", function() mainFrame:Hide() end)

-- 创建左侧标签栏
local leftPanel = CreateFrame("Frame", nil, mainFrame)
leftPanel:SetSize(200, 470)
leftPanel:SetPoint("TOPLEFT", 0, -30)
leftPanel.bg = leftPanel:CreateTexture(nil, "BACKGROUND")
leftPanel.bg:SetAllPoints(true)
leftPanel.bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

-- -- 为左侧面板添加边框
-- CreateBorder(leftPanel)

-- 创建右侧内容面板
local rightPanel = CreateFrame("Frame", nil, mainFrame)
rightPanel:SetSize(580, 470)
rightPanel:SetPoint("TOPRIGHT", -10, -30)
rightPanel.bg = rightPanel:CreateTexture(nil, "BACKGROUND")
rightPanel.bg:SetAllPoints(true)
rightPanel.bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

-- -- 为右侧面板添加边框
-- CreateBorder(rightPanel)

-- 存储所有内容面板的表
local contentPanels = {}

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

-- 首先创建下拉菜单的初始化函数
local function CreateDropDownMenu(parent, x, y)
    local dropdown = CreateFrame("Frame", "MyAddonDropDown", parent, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", x, y)
    dropdown:SetFrameStrata("DIALOG")
    dropdown:SetFrameLevel(101)
    
    -- 存储当前选中的值
    dropdown.selectedID = 1
    
    local games = {
        {text = "默认[听风]", value = 1},
    }
    
    local function OnClick(self, arg1, arg2, checked)
        dropdown.selectedID = self:GetID()
        UIDropDownMenu_SetSelectedID(dropdown, dropdown.selectedID)
        UIDropDownMenu_SetText(dropdown, games[dropdown.selectedID].text)

        -- 点击下拉菜单条项
        -- 创建新窗口
        -- CreateGameSettingsWindow(games[dropdown.selectedID].text)
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
local tabNames = {"总览", "帮助"}
for i, name in ipairs(tabNames) do
    leftPanel.buttons[i] = CreateTabButton(name, i)

    -- 其他标签的默认内容
    local content = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    content:SetPoint("TOPLEFT", 10, -10)
    content:SetText(name)


    if name == "帮助" then
        content:SetText("")
        -- 添加标题
        local title = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", 20, -20)
        title:SetText("听风工具箱使用帮助")
        
        -- 添加说明文字
        local desc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        desc:SetPoint("TOPLEFT", 20, -50)
        desc:SetWidth(550)
        desc:SetJustifyH("LEFT")
        desc:SetText("听风工具箱专门为插件包提供一键设置及多种界面优化功能。\n\n主要功能：\n1. 一键设置界面\n2. 便捷设置小工具\n3. 更多功能开发中...")
        
        -- 创建链接标题
        local linkTitle = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        linkTitle:SetPoint("TOPLEFT", 20, -150)
        linkTitle:SetText("GitHub：")
        
        -- 创建可点击的GitHub链接
        local githubLink = CreateFrame("EditBox", nil, contentPanels[i], "InputBoxTemplate")
        githubLink:SetSize(300, 20)
        githubLink:SetPoint("TOPLEFT", 80, -145)
        githubLink:SetText("https://github.com/usiege/WindKit")
        githubLink:SetAutoFocus(false)
        githubLink:SetCursorPosition(0)

        -- 创建链接标题
        local linkTitle = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        linkTitle:SetPoint("TOPLEFT", 20, -170)
        linkTitle:SetText("WC社区：")
        
        -- 创建可点击的KOOK链接
        local kookLink = CreateFrame("EditBox", nil, contentPanels[i], "InputBoxTemplate")
        kookLink:SetSize(300, 20)
        kookLink:SetPoint("TOPLEFT", 80, -165)
        kookLink:SetText("https://www.kookapp.cn/app/invite/EGosAW")
        kookLink:SetAutoFocus(false)
        kookLink:SetCursorPosition(0)
        
        -- 添加链接说明
        local linkDesc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        linkDesc:SetPoint("TOPLEFT", 20, -200)
        linkDesc:SetText("点击链接框可以全选文本，Ctrl+C 复制")
        
        -- 创建图片容器
        local imageFrame = CreateFrame("Frame", nil, contentPanels[i])
        imageFrame:SetSize(200, 200)
        imageFrame:SetPoint("TOPLEFT", 100, -240)
        
        -- 创建图片纹理
        local image = imageFrame:CreateTexture(nil, "ARTWORK")
        image:SetAllPoints(true)
        image:SetTexture("Interface\\AddOns\\WindKit\\media\\wechat.png") -- 需要添加实际的图片路径
        -- 如果暂时没有图片，可以使用系统图标
        -- image:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        
        -- 添加图片说明
        local imageDesc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        imageDesc:SetPoint("TOP", imageFrame, "BOTTOM", 0, -5)
        imageDesc:SetText("WOWCUBE 微信公众号")
        
    elseif name == "总览" then
        -- 在总览面板添加下拉菜单
        local dropdown = CreateDropDownMenu(contentPanels[i], 20, -40)
        
        -- 添加一键设置界面按钮
        local setupButton = CreateFrame("Button", nil, contentPanels[i], "UIPanelButtonTemplate")
        setupButton:SetSize(120, 30)
        setupButton:SetPoint("TOPLEFT", 180, -40) -- 位置在下拉菜单下方
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

-- 移除之前的滑动条代码，添加缩放角标
local resizeButton = CreateFrame("Button", nil, mainFrame)
resizeButton:SetSize(16, 16)
resizeButton:SetPoint("BOTTOMRIGHT", -2, 2)

-- 创建角标纹理
resizeButton.texture = resizeButton:CreateTexture(nil, "OVERLAY")
resizeButton.texture:SetAllPoints()
resizeButton.texture:SetTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")

-- 鼠标悬停和按下时的纹理
resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

-- 缩放状态变量
local isScaling = false
local startX, startY, startScale
local minScale, maxScale = 0.5, 1.5

-- 开始缩放
resizeButton:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        isScaling = true
        startX, startY = GetCursorPosition()
        startScale = mainFrame:GetScale()
        
        -- 记录原始位置
        if not mainFrame.originalPosition then
            local point, relativeTo, relativePoint, xOfs, yOfs = mainFrame:GetPoint()
            mainFrame.originalPosition = {
                point = point,
                relativeTo = relativeTo,
                relativePoint = relativePoint,
                xOfs = xOfs,
                yOfs = yOfs
            }
        end
    end
end)

-- 缩放过程
resizeButton:SetScript("OnUpdate", function(self)
    if isScaling then
        local currentX, currentY = GetCursorPosition()
        local deltaX = (currentX - startX) / UIParent:GetScale()
        local deltaY = (currentY - startY) / UIParent:GetScale()
        local delta = (deltaX + deltaY) / 200 -- 调整这个值可以改变缩放灵敏度
        
        -- 计算新的缩放值
        local newScale = math.max(minScale, math.min(maxScale, startScale + delta))
        
        -- 应用缩放
        mainFrame:SetScale(newScale)
        
        -- 保持原始位置
        mainFrame:ClearAllPoints()
        mainFrame:SetPoint(
            mainFrame.originalPosition.point,
            mainFrame.originalPosition.relativeTo,
            mainFrame.originalPosition.relativePoint,
            mainFrame.originalPosition.xOfs,
            mainFrame.originalPosition.yOfs
        )
        
        -- 保存缩放值到配置中
        WindKitDB.scale = newScale
    end
end)

-- 结束缩放
resizeButton:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        isScaling = false
    end
end)

-- 鼠标提示
resizeButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:AddLine("拖动调整界面大小")
    GameTooltip:AddLine("可以在50%到150%之间调整", 1, 1, 1)
    GameTooltip:Show()
end)

resizeButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- 从配置中加载缩放值
if WindKitDB and WindKitDB.scale then
    mainFrame:SetScale(WindKitDB.scale)
end



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

