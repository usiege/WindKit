if name == "总览" then
    local panel = contentPanels[i]

    -- 创建下拉菜单
    local dropdown = CreateDropDownMenu(panel, 20, -20)
    
    -- 在下拉菜单右侧创建设置选项
    -- ... (之前的勾选框代码，需要调整位置到右侧)
    local checkboxStartX = 200 -- 调整这个值来设置右侧勾选框的起始位置
    
    -- 创建标题
    local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", checkboxStartX, -20)
    title:SetText("设置选项")
    
    -- 创建右侧勾选框
    local checkboxes = {
        {text = "启用自动追踪", default = true},
        {text = "显示详细信息", default = false},
        {text = "启用声音提示", default = true},
        {text = "显示小地图图标", default = true},
    }
    
    panel.checkboxes = {}
    for index, data in ipairs(checkboxes) do
        local checkbox = CreateFrame("CheckButton", nil, panel, "UICheckButtonTemplate")
        checkbox:SetSize(24, 24)
        checkbox:SetPoint("TOPLEFT", checkboxStartX, -50 - (index-1)*30)
        checkbox:SetChecked(data.default)
        
        local label = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
        label:SetText(data.text)
        
        panel.checkboxes[index] = checkbox
    end
    
    
else
    
end