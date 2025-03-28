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
mainFrame.bg:SetTexture("Interface\\AddOns\\WindKit\\media\\bg.png")

-- 创建标题栏
local titleBar = CreateFrame("Frame", nil, mainFrame)
titleBar:SetSize(800, 30)
titleBar:SetPoint("TOPLEFT")
titleBar.bg = titleBar:CreateTexture(nil, "BACKGROUND")
titleBar.bg:SetAllPoints(true)
titleBar.bg:SetColorTexture(0, 0, 0, 0) -- 完全透明

-- 创建标题文本
local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("CENTER", 0, 0)
title:SetText("听风一键设置")

-- 创建关闭按钮
local closeButton = CreateFrame("Button", nil, titleBar)
closeButton:SetSize(16, 16)
closeButton:SetPoint("TOPRIGHT", -4, -7)
closeButton:SetNormalTexture("Interface\\AddOns\\WindKit\\media\\cancel.png")
closeButton:SetHighlightTexture("Interface\\AddOns\\WindKit\\media\\cancel.png")
closeButton:SetScript("OnClick", function() 
    -- 记录面板已关闭状态
    if WindKitCharDB then
        WindKitCharDB.panelClosed = true
    end
    mainFrame:Hide() 
end)

-- 创建左侧标签栏
local leftPanel = CreateFrame("Frame", nil, mainFrame)
leftPanel:SetSize(200, 470)
leftPanel:SetPoint("TOPLEFT", 5, -30)
leftPanel.bg = leftPanel:CreateTexture(nil, "BACKGROUND")
leftPanel.bg:SetAllPoints(true)
leftPanel.bg:SetColorTexture(0, 0, 0, 0) -- 完全透明

-- -- 为左侧面板添加边框
-- CreateBorder(leftPanel)

-- 创建右侧内容面板
local rightPanel = CreateFrame("Frame", nil, mainFrame)
rightPanel:SetSize(580, 470)
rightPanel:SetPoint("TOPRIGHT", -10, -30)
rightPanel.bg = rightPanel:CreateTexture(nil, "BACKGROUND")
rightPanel.bg:SetAllPoints(true)
rightPanel.bg:SetColorTexture(0, 0, 0, 0) -- 完全透明

-- 存储所有内容面板的表
local contentPanels = {}

-- 创建标签按钮的函数
local function CreateTabButton(text, index)
    local button = CreateFrame("Button", nil, leftPanel)
    button:SetSize(190, 30)
    button:SetPoint("TOPLEFT", 5, -5 - (index-1)*35)
    
    -- 按钮背景
    button.bg = button:CreateTexture(nil, "BACKGROUND")
    button.bg:SetAllPoints(true)
    button.bg:SetColorTexture(0, 0, 0, 0) -- 完全透明（未选中状态）
    
    -- 按钮文本
    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("LEFT", 10, 0)
    button.text:SetText(text)
    
    -- 创建箭头指示器
    button.arrow = button:CreateTexture(nil, "OVERLAY")
    button.arrow:SetSize(32, 16)
    button.arrow:SetPoint("RIGHT", -5, 0)
    button.arrow:SetTexture("Interface\\AddOns\\WindKit\\media\\arrowright.png")
    button.arrow:Hide() -- 默认隐藏
    
    -- 高亮材质
    local highlightTexture = button:CreateTexture(nil, "HIGHLIGHT")
    highlightTexture:SetAllPoints(true)
    highlightTexture:SetColorTexture(0.5, 0.5, 0.5, 0.3) -- 半透明高亮效果
    button:SetHighlightTexture(highlightTexture)
    
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
        
        -- 重置所有按钮背景和箭头
        for _, btn in pairs(leftPanel.buttons) do
            btn.bg:SetColorTexture(0, 0, 0, 0) -- 恢复未选中状态
            btn.arrow:Hide()
        end
        -- 设置当前按钮背景和显示箭头
        button.bg:SetColorTexture(0.4, 0.4, 0.4, 0.2) -- 选中状态，半透明
        button.arrow:Show()
    end)
    
    return button
end

-- 存储所有按钮的表
leftPanel.buttons = {}

-- 创建示例标签
local tabNames = {"总览", "使用方法", "帮助"}
for i, name in ipairs(tabNames) do
    leftPanel.buttons[i] = CreateTabButton(name, i)

    -- 其他标签的默认内容
    local content = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    content:SetPoint("TOPLEFT", 10, -10)
    content:SetText(name)
    contentPanels[i].name = name   

    if name == "总览" then end
    if name == "使用方法" then
        content:SetText("")
        -- 添加标题
        local title = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", 20, -20)
        title:SetText("听风工具箱使用方法")
        
        -- 添加说明文字
        local desc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        desc:SetPoint("TOPLEFT", 20, -50)
        desc:SetWidth(550)
        desc:SetJustifyH("LEFT")
        local textContent = "【基本操作】\n"
        textContent = textContent .. "• ESC键或右上角X按钮：关闭主面板\n"
        textContent = textContent .. "• 左侧底部缩放条：调整界面缩放大小\n"
        textContent = textContent .. "• 左侧标签页：切换不同功能区域\n\n"
        textContent = textContent .. "【命令使用】\n"
        textContent = textContent .. "• /tf 或 /wk：打开/关闭主面板\n"
        textContent = textContent .. "• /tf reset：重置面板状态，下次登录时显示主面板\n"
        textContent = textContent .. "• /tf info：显示角色信息\n"
        textContent = textContent .. "• /tf version：显示插件版本\n\n"
        textContent = textContent .. "【插件配置】\n"
        textContent = textContent .. "• ElvUI设置：选择预设风格并点击一键设置按钮\n"
        textContent = textContent .. "• Plater设置：选择预设风格并点击一键设置按钮\n"
        textContent = textContent .. "• Details设置：点击重载配置按钮应用默认设置\n\n"
        textContent = textContent .. "【注意事项】\n"
        textContent = textContent .. "• 关闭此面板后，下次登录将不再自动显示\n"
        textContent = textContent .. "• 需要重新显示面板时，请使用命令 /tf reset"
        desc:SetText(textContent)
        
        -- 添加"了解更多"链接标题
        local moreTitle = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        moreTitle:SetPoint("TOPLEFT", 20, -350)
        moreTitle:SetText("了解更多到主页查看更新：")
        
        -- 创建可点击的主页链接
        local feishuLink = CreateFrame("EditBox", nil, contentPanels[i], "InputBoxTemplate")
        feishuLink:SetSize(450, 20)
        feishuLink:SetPoint("TOPLEFT", 20, -370)
        feishuLink:SetText("https://kxxblqyumrm.feishu.cn/wiki/WxR0waXkViO8Eyk1tOvcinyGnGe?from=from_copylink")
        feishuLink:SetAutoFocus(false)
        feishuLink:SetCursorPosition(0)
        
        -- 添加链接说明
        local linkDesc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        linkDesc:SetPoint("TOPLEFT", 20, -390)
        linkDesc:SetText("点击链接框可以全选文本，Ctrl+C 复制，获取最新功能和更新")
    end

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
        desc:SetText("为插件包界面提供一键设置选项及多种界面优化功能。\n\n主要功能：\n1. 一键设置界面\n2. 便捷设置小工具\n3. 更多功能开发中...")
        
        -- 创建链接标题
        local bilibTitle = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        bilibTitle:SetPoint("TOPLEFT", 20, -150)
        bilibTitle:SetText("Bilibili：")
        
        -- 创建可点击的KOOK链接
        local bilibLink = CreateFrame("EditBox", nil, contentPanels[i], "InputBoxTemplate")
        bilibLink:SetSize(300, 20)
        bilibLink:SetPoint("TOPLEFT", 80, -145)
        bilibLink:SetText("https://space.bilibili.com/38532242")
        bilibLink:SetAutoFocus(false)
        bilibLink:SetCursorPosition(0)

        -- 创建链接标题
        local linkTitle = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        linkTitle:SetPoint("TOPLEFT", 20, -170)
        linkTitle:SetText("GitHub：")
        
        -- 创建可点击的GitHub链接
        local githubLink = CreateFrame("EditBox", nil, contentPanels[i], "InputBoxTemplate")
        githubLink:SetSize(300, 20)
        githubLink:SetPoint("TOPLEFT", 80, -165)
        githubLink:SetText("https://github.com/usiege/WindKit")
        githubLink:SetAutoFocus(false)
        githubLink:SetCursorPosition(0)

        -- 创建链接标题
        local linkTitle = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        linkTitle:SetPoint("TOPLEFT", 20, -190)
        linkTitle:SetText("WC社区：")
        
        -- 创建可点击的KOOK链接
        local kookLink = CreateFrame("EditBox", nil, contentPanels[i], "InputBoxTemplate")
        kookLink:SetSize(300, 20)
        kookLink:SetPoint("TOPLEFT", 80, -185)
        kookLink:SetText("https://www.kookapp.cn/app/invite/EGosAW")
        kookLink:SetAutoFocus(false)
        kookLink:SetCursorPosition(0)

        
        
        -- 添加链接说明
        local linkDesc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        linkDesc:SetPoint("TOPLEFT", 20, -200-10)
        linkDesc:SetText("点击链接框可以全选文本，Ctrl+C 复制")
        
        -- 创建图片容器
        local imageFrame = CreateFrame("Frame", nil, contentPanels[i])
        imageFrame:SetSize(200, 200)
        imageFrame:SetPoint("TOPLEFT", 100, -240)
        
        -- 创建图片纹理
        local image = imageFrame:CreateTexture(nil, "ARTWORK")
        image:SetAllPoints(true)
        image:SetTexture("Interface\\AddOns\\WindKit\\media\\wechat.png")
        
        -- 添加图片说明
        local imageDesc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        imageDesc:SetPoint("TOP", imageFrame, "BOTTOM", 0, -5)
        imageDesc:SetText("WOWCUBE 微信公众号")
    end
end

-- 默认显示第一个标签的内容
leftPanel.buttons[1]:Click()

-- 在左侧面板底部添加缩放滑动条
local scaleFrame = CreateFrame("Frame", nil, leftPanel)
scaleFrame:SetSize(190, 40)
scaleFrame:SetPoint("BOTTOMLEFT", 5, 5)

-- 添加缩放框架背景
scaleFrame.bg = scaleFrame:CreateTexture(nil, "BACKGROUND")
scaleFrame.bg:SetAllPoints(true)
scaleFrame.bg:SetColorTexture(0, 0, 0, 0) -- 完全透明

-- 创建缩放标签
local scaleLabel = scaleFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
scaleLabel:SetPoint("TOPLEFT", 5, -5)
scaleLabel:SetText("界面缩放:")

-- 创建缩放滑动条
local scaleSlider = CreateFrame("Slider", "WKScaleSlider", scaleFrame, "OptionsSliderTemplate")
scaleSlider:SetWidth(170)
scaleSlider:SetHeight(16)
scaleSlider:SetPoint("TOPLEFT", 10, -20)
scaleSlider:SetOrientation("HORIZONTAL")
scaleSlider:SetMinMaxValues(0.8, 1.6)
scaleSlider:SetValueStep(0.05)
scaleSlider:SetObeyStepOnDrag(true)

-- 自定义滑动条外观
local thumbTexture = scaleSlider:GetThumbTexture()
thumbTexture:SetSize(8, 16)
thumbTexture:SetColorTexture(0.7, 0.7, 0.7, 0.7) -- 亮灰色滑块

-- 设置滑动条文本颜色
_G[scaleSlider:GetName() .. "Low"]:SetTextColor(0.8, 0.8, 0.8)
_G[scaleSlider:GetName() .. "High"]:SetTextColor(0.8, 0.8, 0.8)
_G[scaleSlider:GetName() .. "Text"]:SetTextColor(1, 1, 1)

-- 从配置中加载缩放值
local currentScale = WindKitCharDB and WindKitCharDB.scale or 1.0
if currentScale < 0.8 then currentScale = 0.8 end
if currentScale > 1.6 then currentScale = 1.6 end
mainFrame:SetScale(currentScale)

-- 设置滑动条当前值
scaleSlider:SetValue(currentScale)

-- 设置滑动条文本
_G[scaleSlider:GetName() .. "Low"]:SetText("80%")
_G[scaleSlider:GetName() .. "High"]:SetText("160%")
_G[scaleSlider:GetName() .. "Text"]:SetText(math.floor(currentScale * 100) .. "%")

-- 滑动条变化事件
local isDragging = false
local pendingValue = nil

scaleSlider:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        isDragging = true
    end
end)

scaleSlider:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and isDragging then
        isDragging = false
        -- 应用挂起的缩放值
        if pendingValue then
            -- 更新缩放
            mainFrame:SetScale(pendingValue)
            
            -- 保存缩放值到配置中
            if WindKitCharDB then
                WindKitCharDB.scale = pendingValue
                WindKit.DebugPrint("已保存缩放设置: " .. pendingValue)
            else
                WindKit.DebugPrint("错误: WindKitCharDB不存在，无法保存缩放值")
            end
            
            pendingValue = nil
        end
    end
end)

scaleSlider:SetScript("OnValueChanged", function(self, value)
    -- 更新文本
    _G[self:GetName() .. "Text"]:SetText(math.floor(value * 100) .. "%")
    
    if isDragging then
        -- 拖动过程中仅记录值，不应用缩放
        pendingValue = value
    else
        -- 非拖动状态下立即应用（如通过程序修改值时）
        -- 应用缩放
        mainFrame:SetScale(value)
        
        -- 保存缩放值到配置中
        if WindKitCharDB then
            WindKitCharDB.scale = value
            WindKit.DebugPrint("已保存缩放设置(非拖动): " .. value)
        else
            WindKit.DebugPrint("错误: WindKitCharDB不存在，无法保存缩放值")
        end
    end
end)

-- 滑动条提示
scaleSlider:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:AddLine("调整界面缩放")
    GameTooltip:AddLine("可以在80%到160%之间调整", 1, 1, 1)
    GameTooltip:Show()
end)

scaleSlider:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

local function panelIsShow()
    return mainFrame:IsShown()
end

local function showPanel(msg)
    if not mainFrame:IsShown() then
        -- 应用保存的缩放值
        if WindKitCharDB and WindKitCharDB.scale then
            local savedScale = WindKitCharDB.scale
            if savedScale < 0.8 then savedScale = 0.8 end
            if savedScale > 1.6 then savedScale = 1.6 end
            mainFrame:SetScale(savedScale)
            
            -- 更新滑动条显示
            if scaleSlider then
                scaleSlider:SetValue(savedScale)
            end
            
            WindKit.DebugPrint("应用保存的缩放设置: " .. savedScale)
        end
        
        -- 显示面板
        mainFrame:Show()
    end
end

local function hidePanel(msg)
    if mainFrame:IsShown() then
        -- 记录面板已关闭状态
        if WindKitCharDB then
            WindKitCharDB.panelClosed = true
        end
        mainFrame:Hide()
    end
end

local function reloadUI()
    ReloadUI()
end


-- 注册全局函数
WindKit.reloadUI = reloadUI
WindKit.panelIsShow = panelIsShow
WindKit.showMainPanel = showPanel
WindKit.hideMainPanel = hidePanel

-- 返回主框架
mainFrame.contentPanels = contentPanels
WKMainPanelFrame = mainFrame

return mainFrame