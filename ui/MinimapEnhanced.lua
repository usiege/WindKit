-- 创建小地图按钮
local minimapButton = CreateFrame("Button", "WindKitMinimapButton", Minimap)
minimapButton:SetSize(32, 32)
minimapButton:SetFrameStrata("MEDIUM")
minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)

-- 创建文字显示
-- 设置图标纹理
-- minimapButton.icon = minimapButton:CreateTexture(nil, "BACKGROUND")
-- minimapButton.icon:SetSize(24, 24)
-- minimapButton.icon:SetPoint("CENTER", 0, 0)
-- minimapButton.icon:SetTexture("Interface\\AddOns\\WindKit\\media\\minimap-icon") -- 需要添加自己的图标
-- 如果没有自定义图标，可以使用系统图标
-- minimapButton.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
minimapButton.text = minimapButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
minimapButton.text:SetPoint("CENTER", 0, 0)
minimapButton.text:SetText("W")
minimapButton.text:SetTextColor(1, 1, 1) -- 白色文字

-- 设置边框纹理
minimapButton.border = minimapButton:CreateTexture(nil, "OVERLAY")
minimapButton.border:SetSize(54, 54)
minimapButton.border:SetPoint("CENTER")
minimapButton.border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

-- 添加高亮效果
minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

-- 设置提示文本
minimapButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:AddLine("WindKit")
    GameTooltip:AddLine("左键点击: 显示信息", 1, 1, 1)
    GameTooltip:AddLine("右键点击: 重载界面", 1, 1, 1)
    GameTooltip:Show()
end)

minimapButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- 添加点击事件
minimapButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
        print("|cff33ff99WindKit|r: 欢迎使用听风工具箱!")
        WindKit.showMainPanel()
    elseif button == "RightButton" then
        print("|cff33ff99WindKit|r: 右键点击")
        WindKit.reloadUI()
    end
end)

-- 使按钮可拖动
local function UpdateButtonPosition(angle)
    local radius = 80 -- 距离小地图中心的距离
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

-- 初始位置
local minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND"
local buttonRadius = 80
local buttonAngle = 0

-- 添加拖动功能
minimapButton:RegisterForDrag("LeftButton")
minimapButton:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)

minimapButton:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    -- 保存位置
    local xpos, ypos = self:GetCenter()
    local minimapXpos, minimapYpos = Minimap:GetCenter()
    local angle = math.atan2(ypos - minimapYpos, xpos - minimapXpos)
    UpdateButtonPosition(angle)
    -- 可以保存角度到SavedVariables中
    -- WindKitDB.minimapButtonAngle = angle
end)

-- 如果有保存的位置，加载时设置
if WindKitDB and WindKitDB.minimapButtonAngle then
    UpdateButtonPosition(WindKitDB.minimapButtonAngle)
else
    UpdateButtonPosition(math.pi * 1.5) -- 默认位置在顶部
end

-- 导出函数以便其他文件使用
WindKit.minimapButton = minimapButton
