---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2011  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor,
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------




Prat:AddModuleToLoad(function()

--[[
    2007-06-24: added option to save cmd history - fin
]]

    local PRAT_MODULE = Prat:RequestModuleName("History")

    if PRAT_MODULE == nil then
        return
    end

    local L = Prat:GetLocalizer({})


    --[===[@debug@
    L:AddLocale("enUS", {
        ["History"] = true,
        ["Chat history options."] = true,
        ["Set Chat Lines"] = true,
        ["Set the number of lines of chat history for each window."] = true,
        ["Set Command History"] = true,
        ["Maximum number of lines of command history to save."] = true,
        ["Save Command History"] = true,
        ["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = true,
        ["Scrollback"] = true,
        ["Store the chat lines between sessions"] = true,
        ["Scrollback Options"] = true,
        divider = "========== End of Scrollback ==========",
        scrollbacklen_name = "Scrollback Length",
        scrollbacklen_desc = "Number of chatlines to save in the scrollback buffer.",
        ["Colors the GMOTD label"] = true,
        ["Color GMOTD"] = true,
        delaygmotd_name = "Delay GMOTD",
        delaygmotd_desc = "Delay GMOTD until after all the startup spam",
    })
    --@end-debug@]===]

    -- These Localizations are auto-generated. To help with localization
    -- please go to http://www.wowace.com/projects/prat-3-0/localization/


    --@non-debug@
    L:AddLocale("enUS",
    {
	["Chat history options."] = true,
	["Color GMOTD"] = true,
	["Colors the GMOTD label"] = true,
	delaygmotd_desc = "Delay GMOTD until after all the startup spam",
	delaygmotd_name = "Delay GMOTD",
	divider = "========== End of Scrollback ==========",
	History = true,
	["Maximum number of lines of command history to save."] = true,
	["Save Command History"] = true,
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = true,
	Scrollback = true,
	scrollbacklen_desc = "Number of chatlines to save in the scrollback buffer.",
	scrollbacklen_name = "Scrollback Length",
	["Scrollback Options"] = true,
	["Set Chat Lines"] = true,
	["Set Command History"] = true,
	["Set the number of lines of chat history for each window."] = true,
	["Store the chat lines between sessions"] = true,
}

    )
    L:AddLocale("frFR",
    {
	["Chat history options."] = "Option de l'historique.",
	-- ["Color GMOTD"] = "",
	-- ["Colors the GMOTD label"] = "",
	delaygmotd_desc = "Afficher le message du jour de la guilde après tous les autres messages lors de la connexion.",
	-- delaygmotd_name = "",
	divider = "========== Fin de l'historique ==========",
	History = "Historique",
	["Maximum number of lines of command history to save."] = "Nombre maximum de lignes de commande à sauvegarder dans l'historique.",
	["Save Command History"] = "Historique de commandes",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "Sauvegarde l'historique des commandes entre les sessions (à utiliser avec alt+haut ou juste haut)",
	-- Scrollback = "",
	scrollbacklen_desc = "Nombre de lignes de discussions à sauvegarder dans l'historique.",
	scrollbacklen_name = "Taille de l'historique",
	-- ["Scrollback Options"] = "",
	["Set Chat Lines"] = "Historique de discussions",
	["Set Command History"] = "Historique de commandes",
	["Set the number of lines of chat history for each window."] = "Définit le nombre de lignes dans l'historique pour chaque fenêtre.",
	["Store the chat lines between sessions"] = "Sauvegarder l'historique des discussions entre les sessions.",
}

    )
    L:AddLocale("deDE",
    {
	["Chat history options."] = "Optionen zu Chat-Verlauf.",
	["Color GMOTD"] = "Farbe Gildennachricht des Tages",
	["Colors the GMOTD label"] = "Färbt die GMOTD-Beschriftung",
	delaygmotd_desc = "GMOTD verzögern, bis die Ausgabe aller Mitteilungen nach dem Einloggen vollendet ist.",
	delaygmotd_name = "GMOTD verzögern",
	divider = "======= Ende der Aufzeichnungen =======",
	History = "Verlauf",
	["Maximum number of lines of command history to save."] = "Maximal zu speichernde Zeilenanzahl des Befehlverlaufs.",
	["Save Command History"] = "Befehlsverlauf speichern",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "Speichert Befehlsverlauf zwischen Sitzungen (um mit Alt + \"Pfeil nach oben\" oder nur \"Pfeil nach oben\" verwendet zu werden).",
	Scrollback = "Aufzeichnung",
	scrollbacklen_desc = "Anzahl der Chat-Zeilen, die im Puffer gespeichert werden sollen",
	scrollbacklen_name = "Scroll-Weite",
	["Scrollback Options"] = "Optionen zum Aufwärtsscrollen",
	["Set Chat Lines"] = "Chat-Zeilen einstellen",
	["Set Command History"] = "Befehlsverlauf einstellen",
	["Set the number of lines of chat history for each window."] = "Die Zeilenanzahl des Chat-Verlaufs für jedes Fenster einstellen.",
	["Store the chat lines between sessions"] = "Speichert den Chat zwischen den Sitzungen",
}

    )
    L:AddLocale("koKR",
    {
	["Chat history options."] = "히스토리 설정",
	-- ["Color GMOTD"] = "",
	-- ["Colors the GMOTD label"] = "",
	-- delaygmotd_desc = "",
	-- delaygmotd_name = "",
	-- divider = "",
	History = "히스토리",
	["Maximum number of lines of command history to save."] = "기억할 명령어 히스토리 갯수를 설정합니다.",
	["Save Command History"] = "명령어 히스토리 저장",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "명령어 히스토리를 저장합니다. (Alt+위화살표나 위화살표를 사용하는 명령어)",
	-- Scrollback = "",
	-- scrollbacklen_desc = "",
	-- scrollbacklen_name = "",
	-- ["Scrollback Options"] = "",
	["Set Chat Lines"] = "대화 히스토리 설정",
	["Set Command History"] = "명령어 히스토리 설정",
	["Set the number of lines of chat history for each window."] = "각각의 대화창에 대해 최대 히스토리 라인수를 설정합니다.",
	-- ["Store the chat lines between sessions"] = "",
}

    )
    L:AddLocale("esMX",
    {
	-- ["Chat history options."] = "",
	-- ["Color GMOTD"] = "",
	-- ["Colors the GMOTD label"] = "",
	-- delaygmotd_desc = "",
	-- delaygmotd_name = "",
	-- divider = "",
	-- History = "",
	-- ["Maximum number of lines of command history to save."] = "",
	-- ["Save Command History"] = "",
	-- ["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "",
	-- Scrollback = "",
	-- scrollbacklen_desc = "",
	-- scrollbacklen_name = "",
	-- ["Scrollback Options"] = "",
	-- ["Set Chat Lines"] = "",
	-- ["Set Command History"] = "",
	-- ["Set the number of lines of chat history for each window."] = "",
	-- ["Store the chat lines between sessions"] = "",
}

    )
    L:AddLocale("ruRU",
    {
	["Chat history options."] = "Настройки истории чата.",
	["Color GMOTD"] = "Цвет  GMOTD",
	["Colors the GMOTD label"] = "Цвета названия СДГ",
	delaygmotd_desc = "Задерживать отображение СДГ вплоть до окончания спама при входе в игру",
	delaygmotd_name = "задержка GMOTD",
	divider = "========== Конец истории сообщений ==========",
	History = "История",
	["Maximum number of lines of command history to save."] = "Максимальное число строк сохранённых в истории команд.",
	["Save Command History"] = "Сохранять историю команд",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "Сохранять историю команд между сеансами (для использования используйте alt+ стрелка вверх или просто стрелку вверх)",
	Scrollback = "История сообщений",
	scrollbacklen_desc = "Количество строк чата, которое надо сохранять в буфере истории сообщений.",
	scrollbacklen_name = "Длина истории сообщений",
	["Scrollback Options"] = "Вернуть опции",
	["Set Chat Lines"] = "Задать число строк чата",
	["Set Command History"] = "История команд",
	["Set the number of lines of chat history for each window."] = "Установите число строк истории чата для всех окон чата.",
	["Store the chat lines between sessions"] = "Сохранять строки чата между сессиями",
}

    )
    L:AddLocale("zhCN",
    {
	["Chat history options."] = "历史聊天记录选项",
	-- ["Color GMOTD"] = "",
	-- ["Colors the GMOTD label"] = "",
	-- delaygmotd_desc = "",
	delaygmotd_name = "延迟 GMOTD", -- Needs review
	divider = "========== 回卷结束 ==========", -- Needs review
	History = "历史记录",
	["Maximum number of lines of command history to save."] = "存储命令记录最大行数",
	["Save Command History"] = "命令记录存储",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "存储会话之间命令的历史记录(使用alt+上箭头键或仅上箭头键)",
	Scrollback = "回卷", -- Needs review
	-- scrollbacklen_desc = "",
	scrollbacklen_name = "回卷长度", -- Needs review
	-- ["Scrollback Options"] = "",
	["Set Chat Lines"] = "聊天行设置",
	["Set Command History"] = "命令历史记录",
	["Set the number of lines of chat history for each window."] = "为每个聊天窗口设置聊天历史记录行数",
	-- ["Store the chat lines between sessions"] = "",
}

    )
    L:AddLocale("esES",
    {
	["Chat history options."] = "Opciones del historial del chat.",
	-- ["Color GMOTD"] = "",
	-- ["Colors the GMOTD label"] = "",
	-- delaygmotd_desc = "",
	-- delaygmotd_name = "",
	-- divider = "",
	History = "Historial",
	["Maximum number of lines of command history to save."] = "Máximo número de líneas a guardar por el comando historial.",
	["Save Command History"] = "Comando Guardar Historial",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "Guarda el historial de comandos entre sesiones (para utilizar con alt+flecha arriba o sólo la flecha arriba)",
	-- Scrollback = "",
	-- scrollbacklen_desc = "",
	-- scrollbacklen_name = "",
	-- ["Scrollback Options"] = "",
	["Set Chat Lines"] = "Establecer Líneas de Chat",
	["Set Command History"] = "Establecer Historial de Comandos",
	["Set the number of lines of chat history for each window."] = "Establece el número de líneas del historial de chat para cada ventana.",
	-- ["Store the chat lines between sessions"] = "",
}

    )
    L:AddLocale("zhTW",
    {
	["Chat history options."] = "歷史訊息選項。",
	["Color GMOTD"] = "顏色 GMOTD",
	["Colors the GMOTD label"] = "顏色 GMOTD 標籤",
	-- delaygmotd_desc = "",
	delaygmotd_name = "延遲 GMOTD",
	divider = "========== 捲動結束 ==========",
	History = "歷史訊息",
	["Maximum number of lines of command history to save."] = "最大行數的指令記錄儲存。",
	["Save Command History"] = "儲存指令歷史",
	-- ["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "",
	Scrollback = "捲動",
	-- scrollbacklen_desc = "",
	scrollbacklen_name = "捲動長度",
	["Scrollback Options"] = "捲動選項",
	["Set Chat Lines"] = "設定聊天行數",
	["Set Command History"] = "設定指令歷史",
	["Set the number of lines of chat history for each window."] = "設定行數的聊天記錄每個視窗。",
	-- ["Store the chat lines between sessions"] = "",
}

    )
    --@end-non-debug@

    -- create prat module
    local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")
    module.L = L

    Prat:SetModuleDefaults(module.name, {
        profile = {
            on = true,
            chatlinesframes = {},
            chatlines = 384,
            maxlines = 50,
            savehistory = false,
            scrollback = true,
            scrollbacklen = 50,
            colorgmotd = true,
            delaygmotd = true,
        }
    })

    module.pluginopts = {}

    Prat:SetModuleOptions(module.name, {
        name = L["History"],
        desc = L["Chat history options."],
        type = "group",
        plugins = module.pluginopts,
        args = {
            chatlinesframes = {
                name = L["Set Chat Lines"],
                desc = L["Set the number of lines of chat history for each window."],
                type = "multiselect",
                values = Prat.HookedFrameList,
                get = "GetSubValue",
                set = "SetSubValue"
            },
            chatlines = {
                name = L["Set Chat Lines"],
                desc = L["Set the number of lines of chat history for each window."],
                type = "range",
                order = 120,
                min = 300,
                max = 5000,
                step = 10,
                bigStep = 50,
            },
            cmdhistheader = {
                name = "Command History Options",
                type = "header",
                order = 130,
            },
            maxlines = {
                name = L["Set Command History"],
                desc = L["Maximum number of lines of command history to save."],
                type = "range",
                order = 132,
                min = 0,
                max = 500,
                step = 10,
                bigStep = 50,
                disabled = function() return not module.db.profile.savehistory end
            },
            savehistory = {
                name = L["Save Command History"],
                desc = L["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"],
                type = "toggle",
                order = 131,
            },
            colorgmotd = {
                name = L["Color GMOTD"],
                desc = L["Colors the GMOTD label"],
                type = "toggle",
                order = 150,
            },
            delaygmotd = {
                name = L.delaygmotd_name,
                desc = L.delaygmotd_desc,
                type = "toggle",
                order = 151
            }
        }
    })

    --[[------------------------------------------------
        Module Event Functions
    ------------------------------------------------]] --

    -- things to do when the module is enabled
    function module:OnModuleEnable()
        self:ConfigureAllChatFrames()

        if Prat3CharDB then        
            if Prat3CharDB and not Prat3CharDB.history then
                Prat3CharDB.history = {}
            end
    
            if self.db.profile.savehistory then
                if self.db.profile.cmdhistory then
                    Prat3CharDB.history.cmdhistory = self.db.profile.cmdhistory 
                    self.db.profile.cmdhistory = nil
                end    
    
                if not Prat3CharDB.history.cmdhistory then
                    Prat3CharDB.history.cmdhistory = {}
                end
    
                self:SecureHook(ChatFrame1EditBox, "AddHistoryLine")
                self:addSavedHistory()
            end
    
            -- Clean out any old data
            if self.db.profile.cmdhistory then
                self.db.profile.cmdhistory = nil
            end    
        end
        
        if IsInGuild() then
            self.frame = self.frame or CreateFrame("Frame")

            if self.db.profile.delaygmotd then
                self:DelayGMOTD(self.frame)
            end

            if self.db.profile.colorgmotd then
                local a, b = strsplit(":", GUILD_MOTD_TEMPLATE)
                if a and b then
                    GUILD_MOTD_TEMPLATE = "|cffffffff" .. a .. "|r:" .. b
                end
            end
        end


    end




    -- things to do when the module is enabled
    function module:OnModuleDisable()
        self:ConfigureAllChatFrames(384)
    end

    function module:ConfigureAllChatFrames(lines)
        local lines = lines or self.db.profile.chatlines

        for k,v in pairs(self.db.profile.chatlinesframes) do
            self:SetHistory(_G[k], lines)
        end
    end

    function module:OnSubvalueChanged()
        self:ConfigureAllChatFrames()
    end

    function module:OnValueChanged()
        self:ConfigureAllChatFrames()
    end


    function module:DelayGMOTD(frame)
        local delay = 2.5
        local maxtime = 60
        ChatFrame1:UnregisterEvent("GUILD_MOTD")
        frame:SetScript("OnUpdate", function(this, expired)
            delay = delay - expired
            if delay < 0 then
                local msg = GetGuildRosterMOTD()
                if maxtime < 0 or (msg and msg:len() > 0) then
                    ChatFrame1:RegisterEvent("GUILD_MOTD")

                    for _,f in pairs(Prat.Frames) do
                        if f:IsEventRegistered("GUILD_MOTD") then
                            ChatFrame_SystemEventHandler(f, "GUILD_MOTD", msg)
                        end
                    end
                    this:Hide()
                else
                    delay = 2.5
                    maxtime = maxtime - 2.5
                end
            end
        end)
    end


    --[[------------------------------------------------
        Core Functions
    ------------------------------------------------]] --
    local acquire, reclaim
    do
        local cache = setmetatable({}, {
            __mode = 'k'
        })
        acquire = function()
            local t = next(cache) or {}
            cache[t] = nil
            return t
        end
        reclaim = function(t)
            for k in pairs(t) do
                t[k] = nil
            end
            cache[t] = true
        end
    end


    function module:SetHistory(f, lines)
        if f == nil then return end
        
        if f:GetMaxLines() ~= lines then
            local chatlines = acquire()
            for i=f:GetNumRegions(),1,-1 do
                local x = select(i, f:GetRegions())
                if x:GetObjectType() == "FontString" then
                    table.insert(chatlines, {
                        x:GetText(), x:GetTextColor()
                    })
                end
            end

            f:SetMaxLines(lines)

            Prat.loading = true
            for i,v in ipairs(chatlines) do
                f:AddMessage(unpack(v))
            end
            Prat.loading = false

            reclaim(chatlines)
        end
    end

    function module:addSavedHistory(cmdhistory)
        local cmdhistory = Prat3CharDB.history.cmdhistory or {}
        local cmdindex = #cmdhistory

        -- where there"s a while, there"s a way
        while cmdindex > 0 do
            ChatFrame1EditBox:AddHistoryLine(cmdhistory[cmdindex])
            cmdindex = cmdindex - 1
        -- way
        end
    end

    function module:saveLine(text)
        if not text or (text == "") then
            return false
        end

        local maxlines = self.db.profile.maxlines
        local cmdhistory = Prat3CharDB.history.cmdhistory or {}

        table.insert(cmdhistory, 1, text)

        if #cmdhistory > maxlines then
            for x=1,(#cmdhistory - maxlines) do
                table.remove(cmdhistory)
            end
        end

        Prat3CharDB.history.cmdhistory = cmdhistory
    end

    function module:AddHistoryLine(editBox)
        editBox = editBox or {}

        -- following code mostly ripped off from Blizzard, but at least I understand it now
        local text = ""
        local type = editBox:GetAttribute("chatType")
        local header = _G["SLASH_" .. type .. "1"]

        if (header) then
            text = header
        end

        if (type == "WHISPER") then
            text = text .. " " .. editBox:GetAttribute("tellTarget")
        elseif (type == "CHANNEL") then
            text = "/" .. editBox:GetAttribute("channelTarget")
        end

        local editBoxText = editBox:GetText();
        if (strlen(editBoxText) > 0) then
            text = text .. " " .. editBox:GetText();
            self:saveLine(text)
        end
    end


    return
end) -- Prat:AddModuleToLoad