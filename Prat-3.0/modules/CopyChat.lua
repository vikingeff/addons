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


local PRAT_MODULE = Prat:RequestModuleName("CopyChat")

if PRAT_MODULE == nil then 
    return 
end

local MAX_SCRAPE_TIME = 5 -- seconds

local L = Prat:GetLocalizer({})

--[===[@debug@
L:AddLocale("enUS", {
    ["CopyChat"] = true,
    ["Copy text from the active chat window."] = true,
    ["Copy Text"] = true,
    ["Copy To Editbox"] = true,
    ["Copy all of the text in the selected chat frame into an edit box"] = true,
    ["showbutton_name"] = "Copy Button",
    ["showbutton_desc"] = "Show a button on the chatframe",
    buttonpos_name = "Button Location",
    buttonpos_desc = "Where on the chatframe to show the copy button",
    ["ChatFrame"] = true,
    [" Text"] = true,
    ["Message From : %s"] = true,
    ["Copy Text Format"] = true,
    ["Should the copied text be plain, or formatted so you can see the colors."] = true,
    ["Plain"] = true,
    ["HTML"] = true,
    ["BBCode"] = true,
    ["Wowace.com Forums"] = true,
    TOPLEFT  =    "Top, Left",
    TOPRIGHT =    "Top, Right",
    BOTTOMRIGHT = "Bottom, Right",
    BOTTOMLEFT =  "Bottom, Left",
})
--@end-debug@]===]

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--@non-debug@
L:AddLocale("enUS", 
{
	BBCode = true,
	BOTTOMLEFT = "Bottom, Left",
	BOTTOMRIGHT = "Bottom, Right",
	buttonpos_desc = "Where on the chatframe to show the copy button",
	buttonpos_name = "Button Location",
	ChatFrame = true,
	["Copy all of the text in the selected chat frame into an edit box"] = true,
	CopyChat = true,
	["Copy Text"] = true,
	["Copy Text Format"] = true,
	["Copy text from the active chat window."] = true,
	["Copy To Editbox"] = true,
	HTML = true,
	["Message From : %s"] = true,
	Plain = true,
	["Should the copied text be plain, or formatted so you can see the colors."] = true,
	showbutton_desc = "Show a button on the chatframe",
	showbutton_name = "Copy Button",
	[" Text"] = true,
	TOPLEFT = "Top, Left",
	TOPRIGHT = "Top, Right",
	["Wowace.com Forums"] = true,
}

)
L:AddLocale("frFR",  
{
	BBCode = true,
	-- BOTTOMLEFT = "",
	-- BOTTOMRIGHT = "",
	-- buttonpos_desc = "",
	-- buttonpos_name = "",
	-- ChatFrame = "",
	["Copy all of the text in the selected chat frame into an edit box"] = "Copier tout le texte de la fenêtre de discussion sélectionnée dans une boîte d'édition.",
	CopyChat = "Copier",
	["Copy Text"] = "Copier le texte",
	["Copy Text Format"] = "Format du texte copié",
	["Copy text from the active chat window."] = "Copier le texte à partir de la fenêtre de discussion active.",
	-- ["Copy To Editbox"] = "",
	HTML = true,
	["Message From : %s"] = "Message de : %s",
	Plain = "Texte seul",
	["Should the copied text be plain, or formatted so you can see the colors."] = "Le texte copié doit-il être seul, ou formaté de tel manière à voir les couleurs.",
	showbutton_desc = "Montrer un bouton sur la fenêtre de discussion.",
	showbutton_name = "Bouton de copie",
	[" Text"] = "Texte",
	-- TOPLEFT = "",
	-- TOPRIGHT = "",
	["Wowace.com Forums"] = "Forums wowace.com",
}

)
L:AddLocale("deDE", 
{
	BBCode = true,
	BOTTOMLEFT = "Unten, links",
	BOTTOMRIGHT = "Unten, rechts",
	buttonpos_desc = "Wo im Chat-Fenster die 'Kopier'-Schaltfläche dargestellt werden soll.",
	buttonpos_name = "Schaltflächenposition",
	ChatFrame = true,
	["Copy all of the text in the selected chat frame into an edit box"] = "Kopiere den gesamten Text des ausgewählten Chat-Rahmens in ein Eingabefeld.",
	CopyChat = true,
	["Copy Text"] = "Text kopieren",
	["Copy Text Format"] = "Textformat kopieren",
	["Copy text from the active chat window."] = "Text im aktiven Chat-Fenster kopieren.",
	["Copy To Editbox"] = "In das Bearbeitungsfeld kopieren",
	HTML = true,
	["Message From : %s"] = "Mitteilung von: %s",
	Plain = "Einfach",
	["Should the copied text be plain, or formatted so you can see the colors."] = "Soll der kopierte Text einfach oder formattiert mit farbiger Darstellung kopiert werden?",
	showbutton_desc = "Schaltfläche im Chat-Rahmen anzeigen",
	showbutton_name = "Schaltfläche Kopieren",
	[" Text"] = "Text",
	TOPLEFT = "Oben, links",
	TOPRIGHT = "Oben, rechts",
	["Wowace.com Forums"] = "Wowace.com Foren",
}

)
L:AddLocale("koKR",  
{
	-- BBCode = "",
	-- BOTTOMLEFT = "",
	-- BOTTOMRIGHT = "",
	-- buttonpos_desc = "",
	-- buttonpos_name = "",
	ChatFrame = "채팅창",
	["Copy all of the text in the selected chat frame into an edit box"] = "선택된 채팅창의 모든 내용을 대화 입력창으로 복사합니다",
	CopyChat = "대화 복사",
	["Copy Text"] = "텍스트 복사",
	["Copy Text Format"] = "복사 내용 서식",
	["Copy text from the active chat window."] = "활성화 된 채팅창에서 내용 복사.",
	-- ["Copy To Editbox"] = "",
	HTML = true,
	["Message From : %s"] = "%s 로부터 귓말",
	Plain = "보통",
	-- ["Should the copied text be plain, or formatted so you can see the colors."] = "",
	showbutton_desc = "채팅창에 버튼 보이기",
	showbutton_name = "복사 버튼",
	[" Text"] = "텍스트",
	-- TOPLEFT = "",
	-- TOPRIGHT = "",
	["Wowace.com Forums"] = "wowace.com 포럼",
}

)
L:AddLocale("esMX",  
{
	-- BBCode = "",
	-- BOTTOMLEFT = "",
	-- BOTTOMRIGHT = "",
	-- buttonpos_desc = "",
	-- buttonpos_name = "",
	-- ChatFrame = "",
	-- ["Copy all of the text in the selected chat frame into an edit box"] = "",
	-- CopyChat = "",
	-- ["Copy Text"] = "",
	-- ["Copy Text Format"] = "",
	-- ["Copy text from the active chat window."] = "",
	-- ["Copy To Editbox"] = "",
	-- HTML = "",
	-- ["Message From : %s"] = "",
	-- Plain = "",
	-- ["Should the copied text be plain, or formatted so you can see the colors."] = "",
	-- showbutton_desc = "",
	-- showbutton_name = "",
	-- [" Text"] = "",
	-- TOPLEFT = "",
	-- TOPRIGHT = "",
	-- ["Wowace.com Forums"] = "",
}

)
L:AddLocale("ruRU",  
{
	BBCode = true,
	BOTTOMLEFT = "Снизу, Слева",
	BOTTOMRIGHT = "Снизу, Справа",
	buttonpos_desc = "Где в окне чата показывать кнопку копирования",
	buttonpos_name = "Положение кнопки",
	ChatFrame = "Окно чата",
	["Copy all of the text in the selected chat frame into an edit box"] = "Копировать весь текст из выбранного окна чата в поле ввода.",
	CopyChat = true,
	["Copy Text"] = "Копировать текст",
	["Copy Text Format"] = "Формат копирования текста",
	["Copy text from the active chat window."] = "Копировать текст из активного окна чата.",
	["Copy To Editbox"] = "Копировать чат",
	HTML = true,
	["Message From : %s"] = "Сообщение от : %s",
	Plain = "Обычный текст",
	["Should the copied text be plain, or formatted so you can see the colors."] = "Копировать информацию как обычный текст или же форматированный, с сохранением цветов и т.п.",
	showbutton_desc = "Показывать кнопку копирования в окне чата",
	showbutton_name = "Кнопка копирования",
	[" Text"] = " Текст",
	TOPLEFT = "Сверху, Слева",
	TOPRIGHT = "Сверху, Справа",
	["Wowace.com Forums"] = "Форумы Wowace.com",
}

)
L:AddLocale("zhCN",  
{
	BBCode = "BB代码",
	BOTTOMLEFT = "左下", -- Needs review
	BOTTOMRIGHT = "右下", -- Needs review
	buttonpos_desc = "复制按钮在聊天框的位置", -- Needs review
	buttonpos_name = "按钮位置", -- Needs review
	ChatFrame = "聊天框",
	["Copy all of the text in the selected chat frame into an edit box"] = "在选定的聊天框复制全部文本到输入框",
	CopyChat = "聊天复制",
	["Copy Text"] = "复制文本",
	["Copy Text Format"] = "复制文本格式",
	["Copy text from the active chat window."] = "从活跃的聊天窗口复制文本",
	["Copy To Editbox"] = "复制到编辑框", -- Needs review
	HTML = "超文本标记语言",
	["Message From : %s"] = "信息来自: %s",
	Plain = "简洁",
	["Should the copied text be plain, or formatted so you can see the colors."] = "如果用简洁或排版复制的文本,你可以看到颜色",
	showbutton_desc = "在聊天框显示按钮",
	showbutton_name = "复制按钮",
	[" Text"] = "文本",
	TOPLEFT = "左上", -- Needs review
	TOPRIGHT = "右上", -- Needs review
	["Wowace.com Forums"] = "Wowace.com论坛",
}

)
L:AddLocale("esES",  
{
	BBCode = true,
	-- BOTTOMLEFT = "",
	-- BOTTOMRIGHT = "",
	-- buttonpos_desc = "",
	-- buttonpos_name = "",
	ChatFrame = "MarcoChat",
	["Copy all of the text in the selected chat frame into an edit box"] = "Copiar todo el texto seleccionado en el marco del chat a una caja de edición",
	CopyChat = "ChatCopiar",
	["Copy Text"] = "Copiar Texto",
	["Copy Text Format"] = "Copiar Texto con fomato",
	["Copy text from the active chat window."] = "Copiar texto desde la ventana de chat activa.",
	-- ["Copy To Editbox"] = "",
	HTML = true,
	["Message From : %s"] = "Mensaje de : %s",
	Plain = "Liso",
	["Should the copied text be plain, or formatted so you can see the colors."] = "El texto copiado debería ser llano, o con formato para que pueda ver los colores. ",
	showbutton_desc = "Muestra un botón en el marco del chat",
	showbutton_name = "Botón Copiar",
	[" Text"] = "Texto",
	-- TOPLEFT = "",
	-- TOPRIGHT = "",
	["Wowace.com Forums"] = "Foros Wowace.com",
}

)
L:AddLocale("zhTW",  
{
	BBCode = true,
	BOTTOMLEFT = "下, 左",
	BOTTOMRIGHT = "下, 右",
	-- buttonpos_desc = "",
	buttonpos_name = "按鈕位置",
	ChatFrame = "聊天視窗",
	-- ["Copy all of the text in the selected chat frame into an edit box"] = "",
	CopyChat = true,
	["Copy Text"] = "複製文字",
	["Copy Text Format"] = "複製文字格式",
	["Copy text from the active chat window."] = "複製使用中聊天視窗文字",
	["Copy To Editbox"] = "複製至編輯盒",
	HTML = true,
	["Message From : %s"] = "來自 %s 的訊息",
	-- Plain = "",
	-- ["Should the copied text be plain, or formatted so you can see the colors."] = "",
	showbutton_desc = "於聊天視窗中顯示按鈕",
	showbutton_name = "複製按鈕",
	[" Text"] = "文字",
	TOPLEFT = "上, 左",
	TOPRIGHT = "上, 右",
	["Wowace.com Forums"] = "Wowace.com 論壇",
}

)
--@end-non-debug@

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceTimer-3.0")

Prat:SetModuleDefaults(module.name, {
    profile = {
        on  = true,
        showbutton = {["*"] = true},
        buttonpos = "TOPLEFT",
        copyformat = "plain"
    }
} )

Prat:SetModuleOptions(module.name, {
    name = L["CopyChat"],
    desc = L["Copy text from the active chat window."],
    type = "group",
    args = {
        showbutton = {
            name = L["showbutton_name"],
            desc = L["showbutton_desc"],
            type = "multiselect",
            values = Prat.FrameList,
            get = "GetSubValue",
            set = "SetSubValue"
        },
        buttonpos = {
            name = L.buttonpos_name,
            desc = L.buttonpos_desc,
            type = "select",
            order = 195,
            get = "GetValue", 
            set = "SetValue",
            values = { ["TOPLEFT"] = L.TOPLEFT, ["TOPRIGHT"] = L.TOPRIGHT , 
                       ["BOTTOMLEFT"] = L.BOTTOMLEFT, ["BOTTOMRIGHT"] = L.BOTTOMRIGHT },
        },
        copy = {
            name = L["Copy Text"],
            desc = L["Copy all of the text in the selected chat frame into an edit box"],
            type = "execute",
            order = 190,
            func = "MenuScrape"
        },
        copyformat = {
            name = L["Copy Text Format"],
            desc = L["Should the copied text be plain, or formatted so you can see the colors."],
            type = "select",
            order = 195,
            get = "GetValue", 
            set = "SetValue",
            values = { ["plain"] = L["Plain"], ["bbcode"] = L["BBCode"] , ["html"] = L["HTML"], ["wowace"] = L["Wowace.com Forums"] },
        },

    }
})

function module:MenuScrape()
    self:ScrapeChatFrame(SELECTED_CHAT_FRAME) 
    HideDropDownMenu(1)
end


Prat:SetModuleInit(module.name,
    function(module)
        PratCCFrameScrollText:SetScript("OnTextChanged", function(this) module:OnTextChanged(this) end)
        PratCCFrameScrollText:SetScript("OnEscapePressed", function(this) PratCCFrame:Hide() module.str = nil end)


        Prat.RegisterChatCommand("copychat",
        function(name)
            local frame = SELECTED_CHAT_FRAME

            if frame then
                module:ScrapeChatFrame(frame)
            end
        end)
    end)


function module:OnModuleEnable()
    self.buttons = {}
    for k,v in pairs(Prat.Frames) do
        self.buttons[k] = self:MakeReminder(v:GetID())
        self:showbutton(k, self.db.profile.showbutton[k])
    end
    UnitPopupButtons["COPYCHAT"]    = { text =L["Copy Text"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlink(a1, a2) end , arg1 = "", arg2 = ""};
    UnitPopupButtons["COPYCHATEDIT"]    = { text =L["Copy To Editbox"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlinkToEdit(a1, a2) end , arg1 = "", arg2 = ""};



    if not self.menusAdded then
        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHATEDIT");
        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHAT");    
        self.menusAdded = true
    end
    
    Prat:RegisterDropdownButton("COPYCHAT", function(menu, button) button.arg1 = module.clickedFrame end )
    Prat:RegisterDropdownButton("COPYCHATEDIT", function(menu, button) button.arg1 = module.clickedFrame end )


    self:SecureHook("ChatFrame_OnHyperlinkShow")
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
end
    
function module:Prat_FramesUpdated(info, name, chatFrame, ...)
    local id = chatFrame:GetID()
    self.buttons[id] = self:MakeReminder(id)
    self:showbutton(id, self.db.profile.showbutton[1])
end

function module:ChatFrame_OnHyperlinkShow(this, ...)
    self.clickedframe = this
end

function module:OnModuleDisable()
    Prat.UnregisterAllChatEvents(self)
    self:hidebuttons()
    PratCCFrame:Hide()
end


--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

module.lines = {}
module.str = nil

--function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
--    local ORIGIN_FRAME = self.clickedframe
--    
--    for i=1, UIDROPDOWNMENU_MAXBUTTONS do
--        button = _G["DropDownList"..UIDROPDOWNMENU_MENU_LEVEL.."Button"..i];
--        
--        if button.value == "COPYCHAT" then 
--          --  self:Debug(dropdownMenu:GetName(), which, unit, name, userData, button.value, ...)
--            button.func = UnitPopupButtons["COPYCHAT"].func
--            button.arg1 = ORIGIN_FRAME
--        end
--    end
--end


function module:GetFormattedLine(line, r, g, b)
    local fmt = self.copyformat or self.db.profile.copyformat
    local CLR = Prat.CLR
    
    line = line:gsub("|c00000000|r", "")

    if fmt == "plain" then 
        return line
    end

    if fmt == "bbcode" or fmt == "wowace" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "[color=#%1]"):gsub("|r", "[/color]")
    
       return "[color=#"..CLR:GetHexColor(r,g,b).."]"..fline.."[/color]"
    end

    if fmt == "html" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "<font color='#%1'>"):gsub("|r", "</font>")
    
       return "<p><font color='#"..CLR:GetHexColor(r,g,b).."' face='monospace'>"..fline.."</font></p>"
    end

end


function module:CopyLineFromPlayerlinkToEdit(origin_frame, ...)

    -- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetObjectType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe

    for i=1, #self.lines do
        self.lines[i] = nil
    end

    self:AddLines(self.lines, frame:GetRegions())

    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU

    local name = dropdownFrame.name
    local server = dropdownFrame.server  or ""
    local linenum = dropdownFrame.lineID

    local fullname = name;

    if server:len()>0 then
        fullname = name.."-"..server;
    end

    local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
        if self.lines[i]:find(findname:gsub("%-", "%%-")) then
            local text = self.lines[i]:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
            --self:StaticPopupCopyLine(fullname, self.lines[i])

            local editBox = ChatEdit_ChooseBoxForSend(frame);

            --DEBUG FIXME - for now, we're not going to remove spaces from names. We need to make sure X-server still works.
            -- Remove spaces from the server name for slash command parsing
            --name = gsub(name, " ", "");

            if ( editBox ~= ChatEdit_GetActiveWindow() ) then
                ChatFrame_OpenChat(text, frame);
            else
                editBox:SetText(text);
            end
            
        end
    end
end

function module:CopyLineFromPlayerlink(origin_frame, ...)

    -- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetObjectType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe
    
    for i=1, #self.lines do
        self.lines[i] = nil
    end

    self:AddLines(self.lines, frame:GetRegions())    

    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
    
    local name = dropdownFrame.name
    local server = dropdownFrame.server  or ""
    local linenum = dropdownFrame.lineID
    
    local fullname = name;

    if server:len()>0 then
        fullname = name.."-"..server;
    end

    local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
        if self.lines[i]:find(findname:gsub("%-", "%%-")) then
            self:StaticPopupCopyLine(fullname, self.lines[i])
        end
    end
    
end


function module:StaticPopupCopyLine(sender, text)
    StaticPopupDialogs["COPY_LINE"] = StaticPopupDialogs["COPY_LINE"] or {
        text = L["Message From : %s"],
        chattext = "",
        button2 = ACCEPT,
        hasEditBox = 1,
        hasWideEditBox = 1,

        preferredIndex = 3,

        OnShow = function(this)
            this:SetWidth(420)
            local editBox = _G[this:GetName().."WideEditBox"] or _G[this:GetName().."EditBox"]
            editBox:SetText(StaticPopupDialogs["COPY_LINE"].chattext);
            editBox:SetFocus();
            editBox:HighlightText(0);

            local button = _G[this:GetName().."Button2"];
            button:ClearAllPoints();
            button:SetWidth(200);
            button:SetPoint("CENTER", editBox, "CENTER", 0, -30);
        end,

        OnHide = function() end,
        OnAccept = function() end,
        OnCancel = function() end,
        EditBoxOnEscapePressed = function(this) this:GetParent():Hide(); end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1
    };

    StaticPopupDialogs["COPY_LINE"].chattext = text
    StaticPopup_Show ("COPY_LINE", sender);
end


function module:ScrapeChatFrame(frame, noshow)
--    smf = Prat.Addon:GetModule("SMFHax", true)
--    if smf then
--        self.twocolumn, smf.twocolumn = smf.twocolumn
--        smf:ClearColumn1()
--    end

    self:DoCopyChat(frame, nil, noshow)
end

function module:ScrapeFullChatFrame(frame, noshow)
--    smf = Prat.Addon:GetModule("SMFHax", true)
--    if smf then
--        self.twocolumn, smf.twocolumn = smf.twocolumn
--        smf:ClearColumn1()
--    end
    frame:ScrollToBottom()

	local fontFile, oldsize, fontFlags = frame:GetFont();
    self.oldsize = oldsize
	frame:SetFont(fontFile, 2, fontFlags);
	SetChatWindowSize(frame:GetID(), 1);

--    self:DoCopyChatScroll(frame)

    self:ScheduleTimer("DoCopyChatScroll", 0.1, frame)
end
     
local scrapelines = {}
function module:DoCopyChatScroll(frame, noshow)
    self.longstr = ""
    self.str = ""
    
    if frame:GetNumMessages() == 0 then return end
    
    wipe(scrapelines)


    local starttime = time()
    local runtime = 0

    self:DoCopyChat(frame, nil, true)
    table.insert(scrapelines,self.str)
    self.str = nil

    while not frame:AtTop() or runtime >= MAX_SCRAPE_TIME do
        frame:PageUp()
        runtime = time() - starttime
        if runtime >= MAX_SCRAPE_TIME then
            Prat:Print("Frame scraping timeout exceeded, results will be incomplete.")
            break;
        end
        self:DoCopyChat(frame, nil, true)
        table.insert(scrapelines,1, self.str)
        self.str = nil
    end

    frame:ScrollToBottom()
    
    self.str = table.concat(scrapelines, "\n")
    wipe(scrapelines)

    if self.oldsize then
        FCF_SetChatWindowFontSize(nil, frame, self.oldsize)
        self.oldsize = nil
    end

    if not noshow then 
        if (self.copyformat and self.copyformat == "wowace") or self.db.profile.copyformat == "wowace" then
            self.str = "[bgcolor=black]"..self.str.."[/bgcolor]"
        end

        PratCCText:SetText(L["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..L[" Text"], lines)
        PratCCFrameScrollText:SetText(self.str or "")
        PratCCFrame:Show()
    end
end
function module:DoCopyChatArg(arg)
    self:DoCopyChat(unpack(arg))
end

function module:DoCopyChat(frame, oldsize, noshow)
    wipe(self.lines)

    self:AddLines(self.lines, frame:GetRegions())

    self.str = table.concat(self.lines, "\n")

    wipe(self.lines)

    if oldsize then
        FCF_SetChatWindowFontSize(frame, oldsize)
    end
    
    if not noshow then 
        if (self.copyformat and self.copyformat == "wowace") or self.db.profile.copyformat == "wowace" then
            self.str = "[bgcolor=black]"..self.str.."[/bgcolor]"
        end

        PratCCText:SetText(L["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..L[" Text"], lines)
        PratCCFrameScrollText:SetText(self.str or "")
        PratCCFrame:Show()
    end
end

function module:CopyChat()
    module:ScrapeChatFrame(SELECTED_CHAT_FRAME)
end

function module:AddLines(lines, ...)
  for i=select("#", ...),1,-1 do
    local x = select(i, ...)
    if x:GetObjectType() == "FontString" and not x:GetName() then
        table.insert(lines, self:GetFormattedLine(x:GetText(), x:GetTextColor()))
    end
  end
end

function module:OnTextChanged(this)
    if self.str and this:GetText() ~= self.str then
        this:SetText(self.str)
        self.str = nil
    end
    local s = PratCCFrameScrollScrollBar
    this:GetParent():UpdateScrollChildRect()
    local _, m = s:GetMinMaxValues()
    if m > 0 and this.max ~= m then
        this.max = m
        s:SetValue(m)
    end
end

function module:hidebuttons()
    for k,v in pairs(self.buttons) do
        v:Hide()
    end
end

function module:showbutton(id, show)
    local b = self.buttons[id]
    if show then b:Show() else b:Hide() end
end

do 
    local function reminderOnClick(self, button, down) 
        PlaySound("igChatBottom"); 
        if (IsShiftKeyDown()) then
            module.copyformat = "wowace"
        end
        if (IsControlKeyDown()) then
            module:ScrapeFullChatFrame(self:GetParent()) 
        else
            module:ScrapeChatFrame(self:GetParent()) 
        end
            
        module.copyformat = nil
    end
    local function reminderOnEnter(self, motion) self:SetAlpha(0.9) end
    local function reminderOnLeave(self, motion) self:SetAlpha(0.2) end
    
    function module:MakeReminder(id)
        local cf = _G["ChatFrame"..id]
        local name = "ChatFrame"..id.."PratCCReminder"
        local b = _G[name]
        if not b then
            b = CreateFrame("Button", name, cf)
            b:SetFrameStrata("BACKGROUND")
            b:SetWidth(24)
            b:SetHeight(24)
            b:SetNormalTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy2")
            b:SetPushedTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy")
            b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
            b:SetPoint(self.db.profile.buttonpos, cf, self.db.profile.buttonpos, 0, 0)
            b:SetScript("OnClick", reminderOnClick)
            b:SetScript("OnEnter", reminderOnEnter)
            b:SetScript("OnLeave", reminderOnLeave)
            b:SetAlpha(0.2)
            b:Hide()
        end

        return b
    end
end

  return
end ) -- Prat:AddModuleToLoad