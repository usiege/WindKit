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
    contentPanels[i].name = name   

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
        image:SetTexture("Interface\\AddOns\\WindKit\\media\\wechat.png")
        
        -- 添加图片说明
        local imageDesc = contentPanels[i]:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        imageDesc:SetPoint("TOP", imageFrame, "BOTTOM", 0, -5)
        imageDesc:SetText("WOWCUBE 微信公众号")
    end
end

-- 默认显示第一个标签的内容
leftPanel.buttons[1]:Click()

-- 缩放角标
do
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
            local delta = (deltaX + deltaY) / 200
            
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
end

-- 从配置中加载缩放值
if WindKitDB and WindKitDB.scale then
    mainFrame:SetScale(WindKitDB.scale)
end

local function panelIsShow()
    return mainFrame:IsShown()
end

local function showPanel(msg)
    if not mainFrame:IsShown() then
        mainFrame:Show()
    end
end

local function hidePanel(msg)
    if mainFrame:IsShown() then
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