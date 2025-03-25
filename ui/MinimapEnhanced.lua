-- 创建小地图按钮
local minimapButton = CreateFrame("Button", "WindKitMinimapButton", Minimap)
minimapButton:SetSize(32, 32)
minimapButton:SetFrameStrata("MEDIUM")
minimapButton:EnableMouse(true) -- 确保按钮可以接收鼠标事件
minimapButton:RegisterForClicks("AnyUp") -- 注册所有鼠标按键事件

-- 设置按钮背景（可选）
local background = minimapButton:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints()
background:SetColorTexture(0, 0, 0, 0.5) -- 半透明黑色背景

-- Make the button movable
minimapButton:SetMovable(true)
minimapButton:SetClampedToScreen(true)
minimapButton:SetUserPlaced(true)

-- 创建文字显示
-- 设置图标纹理
-- minimapButton.icon = minimapButton:CreateTexture(nil, "BACKGROUND")
-- minimapButton.icon:SetSize(24, 24)
-- minimapButton.icon:SetPoint("CENTER", 0, 0)
-- minimapButton.icon:SetTexture("Interface\\AddOns\\WindKit\\media\\minimap-icon") -- 需要添加自己的图标
-- 如果没有自定义图标，可以使用系统图标
-- minimapButton.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
minimapButton.text = minimapButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
minimapButton.text:ClearAllPoints()
minimapButton.text:SetPoint("CENTER", minimapButton, "CENTER", 0, 0)
minimapButton.text:SetJustifyH("CENTER")
minimapButton.text:SetJustifyV("MIDDLE")
minimapButton.text:SetText("W")
minimapButton.text:SetTextColor(1, 1, 1) -- 白色文字
minimapButton.text:SetFont(minimapButton.text:GetFont(), 16, "OUTLINE") -- 调整字体大小为16

-- 设置边框纹理
-- minimapButton.border = minimapButton:CreateTexture(nil, "OVERLAY")
-- minimapButton.border:SetSize(54, 54)
-- minimapButton.border:ClearAllPoints()
-- minimapButton.border:SetAllPoints(minimapButton) -- 使用SetAllPoints
-- minimapButton.border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

-- 设置提示文本
minimapButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:AddLine("WindKit")
    GameTooltip:AddLine("左键点击: 显示主面板", 1, 1, 1)
    GameTooltip:AddLine("右键点击: 显示欢迎", 1, 1, 1)
    GameTooltip:AddLine("双击右键: 重载界面", 1, 1, 1)
    GameTooltip:Show()
end)

minimapButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- 创建弹出提示框函数
local function ShowPopupMessage(message)
    -- 如果已存在提示框，先隐藏
    if minimapButton.popupFrame then
        minimapButton.popupFrame:Hide()
    end

    -- 创建提示框
    local popup = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    popup:SetSize(300, 50)
    popup:SetPoint("TOP", UIParent, "TOP", 0, -100)
    popup:SetFrameStrata("DIALOG")
    
    -- 设置背景
    popup:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    popup:SetBackdropColor(0, 0, 0, 0.8)
    popup:SetBackdropBorderColor(1, 0.8, 0, 1)

    -- 创建文本
    local text = popup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("CENTER")
    text:SetText(message)
    text:SetTextColor(1, 1, 1)

    -- 创建动画组
    popup.ag = popup:CreateAnimationGroup()
    
    -- 淡入动画
    local fadeIn = popup.ag:CreateAnimation("Alpha")
    fadeIn:SetFromAlpha(0)
    fadeIn:SetToAlpha(1)
    fadeIn:SetDuration(0.3)
    fadeIn:SetOrder(1)
    
    -- 延迟动画
    local delay = popup.ag:CreateAnimation("Alpha")
    delay:SetFromAlpha(1)
    delay:SetToAlpha(1)
    delay:SetDuration(1)
    delay:SetOrder(2)
    
    -- 淡出动画
    local fadeOut = popup.ag:CreateAnimation("Alpha")
    fadeOut:SetFromAlpha(1)
    fadeOut:SetToAlpha(0)
    fadeOut:SetDuration(0.3)
    fadeOut:SetOrder(3)
    
    -- 设置动画完成时隐藏
    popup.ag:SetScript("OnFinished", function()
        popup:Hide()
    end)

    -- 显示并开始动画
    popup:Show()
    popup:SetAlpha(0)
    popup.ag:Play()

    -- 保存引用以便后续使用
    minimapButton.popupFrame = popup
end

-- 添加点击事件
local lastRightClick = 0
local DOUBLE_CLICK_TIME = 0.4 -- 双击时间窗口（秒）

minimapButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
        if WindKit.panelIsShow() then
            WindKit.hideMainPanel()
        else
            WindKit.showMainPanel()
        end
    elseif button == "RightButton" then
        local now = GetTime()
        if (now - lastRightClick) <= DOUBLE_CLICK_TIME then
            -- 双击右键
            ReloadUI()
        else
            -- 单击右键
            ShowPopupMessage("|cff33ff99WindKit|r: 欢迎使用听风工具箱!")
        end
        lastRightClick = now
    end
end)

-- 使按钮可拖动
local function UpdateButtonPosition(angle)
    local radius = 80 -- 距离小地图中心的距离
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius
    minimapButton:ClearAllPoints()
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
    minimapButton:SetScale(1.0) -- 确保缩放正确
end

local function GetCursorAngle()
    local mx, my = Minimap:GetCenter()
    local px, py = GetCursorPosition()
    local scale = Minimap:GetEffectiveScale()
    px, py = px / scale, py / scale
    return math.atan2(py - my, px - mx)
end

-- 初始位置
local minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND"
local buttonRadius = 80
local buttonAngle = 0

-- 添加拖动功能
minimapButton:RegisterForDrag("LeftButton")
minimapButton:SetScript("OnDragStart", function(self)
    self.isDragging = true
end)

minimapButton:SetScript("OnDragStop", function(self)
    self.isDragging = false
    -- 保存位置
    local angle = GetCursorAngle()
    -- 保存角度到SavedVariables中
    if not WindKitDB then WindKitDB = {} end
    WindKitDB.minimapButtonAngle = angle
    UpdateButtonPosition(angle)
end)

minimapButton:SetScript("OnUpdate", function(self)
    if self.isDragging then
        local angle = GetCursorAngle()
        UpdateButtonPosition(angle)
    end
end)

-- 如果有保存的位置，加载时设置
if WindKitDB and WindKitDB.minimapButtonAngle then
    UpdateButtonPosition(WindKitDB.minimapButtonAngle)
else
    UpdateButtonPosition(math.pi * 1.5) -- 默认位置在顶部
end

-- 导出函数以便其他文件使用
WindKit.minimapButton = minimapButton
