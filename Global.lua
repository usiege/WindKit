-- 创建全局WINDKIT表
_G["WindKit"] = _G["WindKit"] or {}
WindKitDB = WindKitDB or {}
WindKitCharDB = WindKitCharDB or {}

-- 全局变量
GetAddOnMetadata = C_AddOns.GetAddOnMetadata


-- 创建本地配置表
local addonName, addon = ...
WindKit.addonName = addonName

-- 获取完整的插件信息
local function GetWindKitInfo(addonName)
    local version = GetAddOnMetadata(addonName, "Version")
    local title = GetAddOnMetadata(addonName, "Title")
    local notes = GetAddOnMetadata(addonName, "Notes")
    local interface = GetAddOnMetadata(addonName, "Interface")
    return version, title, notes, interface
end

-- 添加加载确认
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD") 
frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "WindKit"  then
        WindKit.DebugPrint("WindKit 加载完成")

    elseif event == "VARIABLES_LOADED" then
        WindKit.DebugPrint("所有 SavedVariables 加载完毕")
        -- 插件版本信息
        local version, title, notes, interface = GetWindKitInfo(WindKit.addonName)
        WindKit.version = version
        WindKit.title = title
        WindKit.notes = notes
        WindKit.interface = interface

        -- 设置ElvUI配置
        local name = WindKitDB.playerInfo.name
        local realm = WindKitDB.playerInfo.realm
        
        -- 角色单独配置
        if not WindKitCharDB.ElvUIConfig then
            WindKit.SetElvUIConfig(name, realm)
            WindKitCharDB.ElvUIConfig = true
        end

    elseif event == "PLAYER_LOGIN" then
        WindKit.DebugPrint("玩家数据完全就绪（角色进入世界）")
        -- 角色名，服务器名
        WindKit.PrintPlayerInfo() -- 打印角色信息
        WKElvUIHideTutorial() -- 隐藏ElvUI教程
        
    elseif event == "PLAYER_ENTERING_WORLD" then
        WindKit.DebugPrint("切换地图或副本")

    end
    if addonName == "WindKit" then
        -- 注册斜杠命令
        SLASH_WINDKIT1 = "/tf"
        SLASH_WINDKIT2 = "/wk"
        SLASH_WINDKIT3 = "/windkit"
        SlashCmdList["WINDKIT"] = function(msg)
            msg = msg:lower()
            if msg == "info" then
                WindKit.Print("听风一键设置插件工具包")
            elseif msg == "version" then
                WindKit.Print("游戏版本 ", WindKit.version)
            elseif msg == "help" then
                WindKit.Print(" 命令用法:")
                WindKit.Print("  /tf info - 显示角色信息")
                WindKit.Print("  /tf version - 显示版本信息")
            elseif msg == "game" then
                WindKit.ShowGameVersion()
            else
                WindKit.showMainPanel()
            end
        end

        -- 添加测试命令
        SLASH_WINDKITTEST1 = "/wktest"
        SlashCmdList["WINDKITTEST"] = function(msg)
            WindKit.Print("测试命令已执行!")
        end
        SLASH_WINDKITTHELP1 = "/thelp"
        SLASH_WINDKITTHELP2 = "/Whelp"
        SlashCmdList["WINDKITTHELP"] = function(msg)
            WindKit.Print(" 命令用法:")
            WindKit.Print("  /tf info - 显示角色信息")
            WindKit.Print("  /tf version - 显示版本信息")
        end
    end
end)

-- 添加全局函数
function WindKit.GetPlayerInfo()
    if WindKitDB and WindKitDB.playerInfo then
        return WindKitDB.playerInfo.name, 
        WindKitDB.playerInfo.realm, 
        WindKitDB.playerInfo.fullName
    end
    return nil, nil, nil
end

function WindKit.PrintPlayerInfo()
    local name, realm = WindKit.GetPlayerInfo()
    if name and realm then
        WindKit.DebugPrint("角色名: ", name)
        WindKit.DebugPrint("服务器: ", realm)

    else
        WindKit.DebugPrint("|cff33ff99WindKit|r: 角色信息未加载")
    end
end

-- 添加一些实用函数
function WindKit.Print(...)
    print("|cff33ff99WindKit|r:",...)
end

-- 添加 table 转字符串的辅助函数
local function TableToString(tbl, indent, done)
    done = done or {}
    indent = indent or 0
    if type(tbl) ~= "table" then return tostring(tbl) end
    if done[tbl] then return "recursion" end -- 防止循环引用
    done[tbl] = true

    local str = "{\n"
    for k, v in pairs(tbl) do
        str = str .. string.rep("  ", indent + 1) -- 缩进
        if type(k) ~= "number" then
            k = '"' .. tostring(k) .. '"'
        end
        str = str .. "[" .. k .. "] = "
        
        if type(v) == "table" then
            str = str .. TableToString(v, indent + 1, done)
        elseif type(v) == "string" then
            str = str .. '"' .. v .. '"'
        else
            str = str .. tostring(v)
        end
        str = str .. ",\n"
    end
    str = str .. string.rep("  ", indent) .. "}"
    return str
end

-- 添加 table 转字符串函数
WindKit.TableToString = function(var, name)
    name = name or "变量"
    if type(var) == "table" then
        return TableToString(var)
    else
        return string.format("%s 不是一个 table，是一个 %s，值为: %s", 
            name, type(var), tostring(var))
    end
end

-- 添加获取 table 所有键的函数
WindKit.GetTableKeys = function(tbl)
    if type(tbl) ~= "table" then
        return {}
    end
    
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, k)
    end
    -- 对键进行排序（如果是字符串）
    table.sort(keys, function(a, b)
        if type(a) == "string" and type(b) == "string" then
            return a < b
        end
        return tostring(a) < tostring(b)
    end)
    return keys
end

-- 添加获取 table 所有值的函数
WindKit.GetTableValues = function(tbl)
    if type(tbl) ~= "table" then
        return {}
    end
    
    local values = {}
    for _, v in pairs(tbl) do
        table.insert(values, v)
    end
    return values
end

function WindKit.DebugPrint(...)
    local args = {...}
    if #args == 0 then return end

    -- 如果只有一个参数且是 table，使用 TableToString
    if #args == 1 and type(args[1]) == "table" then
        local str = WindKit.TableToString(args[1])
        print("|cff33ff99WindKit Debug|r:", str)
        return
    end

    -- 处理多个参数
    local parts = {}
    for i, v in ipairs(args) do
        if type(v) == "table" then
            parts[i] = WindKit.TableToString(v)
        else
            parts[i] = tostring(v)
        end
    end
    
    print("|cff33ff99WindKit Debug|r:", unpack(parts))
end

function WindKit.ShowVersion()
    print("|cff33ff99WindKit|r 版本:", WindKit.version)
end

-- 添加获取版本信息的函数
function WindKit.GetGameVersion()
    local version, build, date, tocversion = GetBuildInfo()
    return {
        version = version,
        build = build,
        date = date,
        tocversion = tocversion
    }
end

-- 添加显示版本信息的函数
function WindKit.ShowGameVersion()
    local vInfo = WindKit.GetGameVersion()
    WindKit.Print("游戏版本信息:")
    WindKit.Print("版本: " .. vInfo.version)
    WindKit.Print("构建号: " .. vInfo.build)
    WindKit.Print("构建日期: " .. vInfo.date)
    WindKit.Print("TOC版本: " .. vInfo.tocversion)
end

-- 添加测试命令
SLASH_WINDKITTEST1 = "/wktest"
SlashCmdList["WINDKITTEST"] = function(msg)
    print("WindKit插件测试命令已执行!")
end

-- 设置ElvUI配置
function WindKit.SetElvUIConfig(name, realm) 
    WKElvUISetDefaultConfig(name, realm)
    WKElvUIHideTutorial()
    --输出加载信息
    WindKit.Print("|cff33ff99WindKit|r: ".."配置已加载")
end

