ColorInventory = LibStub("AceAddon-3.0"):NewAddon("ColorInventory", "AceEvent-3.0", "AceBucket-3.0", "AceHook-3.0", "AceConsole-3.0")
local defaults = {
	profile = {
		Junk = true,
		Common = false,
		Uncommon = true,
		Rare = true,
		Epic = true,
		Legendary = true,
		Artifact = true,
		Heirloom = true,
		Glyphs = true,
		Glyphs_always = false,
		Quest = true,
  		QuestColor = {
   			r = 1,
   			g = 1,
   			b = 0
  		},
	},
}
local containerMax  = NUM_BAG_SLOTS + NUM_BANKBAGSLOTS + 1
local gBankMax      = 98
local gBankGroupMax = 14
local _G            = getfenv(0)
local L 	    = LibStub("AceLocale-3.0"):GetLocale("ColorInventory")
--local Combuctor = LibStub('AceAddon-3.0'):GetAddon('Combuctor')
local db
local Gratuity      = LibStub:GetLibrary("LibGratuity-3.0")

local function getOptions()
	local options = {
		type = "group",
		name = GetAddOnMetadata("ColorInventory", "Title"),
		args = {
			Junk = {
				name = L["Color Junk"],
				desc = L["Toggle colored border on Junk Items (grey, border will be red)."],
				type = "toggle",
				order = 100,
				width = "full",
				get = function() return db.Junk end,
				set = function() db.Junk = not db.Junk end,
			},
			Common = {
				name = L["Color Common Items"],
				desc = L["Toggle colored border on Common items (white)."],
				type = "toggle",
				order = 200,
				width = "full",
				get = function() return db.Common end,
				set = function() db.Common = not db.Common end,
			},
			Uncommon = {
				name = L["Color Uncommon Items"],
				desc = L["Toggle colored border on Uncommon items (green)."],
				type = "toggle",
				order = 300,
				width = "full",
				get = function() return db.Uncommon  end,
				set = function() db.Uncommon = not db.Uncommon end,
			},
			Rare = {
				name = L["Color Rare Items"],
				desc = L["Toggle colored border on Rare items (blue)."],
				type = "toggle",
				order = 400,
				width = "full",
				get = function() return db.Rare end,
				set = function() db.Rare = not db.Rare end,
			},
			Epic = {
				name = L["Color Epic Items"],
				desc = L["Toggle colored border on Epic items (purple)."],
				type = "toggle",
				order = 500,
				width = "full",
				get = function() return db.Epic end,
				set = function() db.Epic = not db.Epic end,
			},
			Legendary = {
				name = L["Color Legendary Items"],
				desc = L["Toggle colored border on Legendary items (orange)."],
				type = "toggle",
				order = 600,
				width = "full",
				get = function() return db.Legendary end,
				set = function() db.Legendary = not db.Legendary end,
			},
			Artifact = {
				name = L["Color Artifact Items"],
				desc = L["Toggle colored border on Artifact items (gold)."],
				type = "toggle",
				order = 700,
				width = "full",
				get = function() return db.Artifact end,
				set = function() db.Artifact = not db.Artifact end,
			},
			Heirloom = {
				name = L["Color Heirloom Items"],
				desc = L["Toggle colored border on Heirloom items (gold)."],
				type = "toggle",
				order = 800,
				width = "full",
				get = function() return db.Heirloom end,
				set = function() db.Heirloom = not db.Heirloom end,
			},
			Glyphs = {
				name = L["Color Glyphs"],
				desc = L["Toggle colored border on Glyphs for your Class."],
				type = "toggle",
				order = 900,
				width = "full",
				get = function() return db.Glyphs end,
				set = function() db.Glyphs = not db.Glyphs end,
			},
			Glyphs_always = {
				name = L["Always color glyphs"],
				desc = L["Always color glyphs based on their types, despite your class."],
				type = "toggle", 
				order = 950,
				width = "full",
				get = function() return db.Glyphs_always end,
				set = function() db.Glyphs_always = not db.Glyphs_always end,
			},
			Quest = {
				name = L["Color Quest Items"],
				desc = L["Toggle colored borders on Quest Items."],
				type = "toggle",
				order = 1000,
				width = "full",
				get = function() return db.Quest end,
				set = function() db.Quest = not db.Quest end,
			},
   			QuestColor = {
    				name = L[" - Select Color"],
    				desc = L["Click to select the color for Quest Items."],
    				type = "color",
    				hasAlpha = false,
    				order = 1100,
    				get = function() return db.QuestColor.r, db.QuestColor.g, db.QuestColor.b end,
                  		set = function(info, r, g, b, a)
     					local c = db.QuestColor
     					c.r = r
     					c.g = g
     					c.b = b
    				end,
                  		disabled = function() if not db.Quest then return true else return false end end,
   			},
		}
	}
	return options
end

function ColorInventory:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("ColorInventoryDB", defaults)
	db = self.db.profile
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("ColorInventory", getOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ColorInventory", GetAddOnMetadata("ColorInventory", "Title"))
	self.borders = {}
end

function ColorInventory:OnEnable()
	self:SecureHook("ContainerFrame_OnShow", "ScanAllBags")
	self:SecureHook("ContainerFrame_OnHide", "ClearAllBags")
	
	self:RegisterEvent("ADDON_LOADED")
	
	self:HookCombuctor();
	
	self:RegisterEvent("BAG_UPDATE", "ScanAllBags")
    
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED", "ScanBank")
	self:RegisterEvent("PLAYERBANKBAGSLOTS_CHANGED", "ScanBank")
	self:RegisterEvent("BANKFRAME_OPENED", "ScanBank")    
	self:RegisterEvent("GUILDBANK_UPDATE_TABS", "ScanGuildBank")
	self:RegisterEvent("GUILDBANKBAGSLOTS_CHANGED", "ScanGuildBank")
	self:RegisterEvent("GUILDBANK_ITEM_LOCK_CHANGED", "ScanGuildBank")
	self:RegisterEvent("GUILDBANKFRAME_OPENED", "ScanGuildBank")
	self:ScanAllBags()
end

function ColorInventory:ADDON_LOADED(eventName, addonName)	
	if (addonName == "Combuctor") then
		self:HookCombuctor()		
	end
end


function ColorInventory:HookCombuctor()
	if not Combuctor or self:IsHooked(Combuctor.ItemSlot, "Update") then
		--print("Fail combuctor")
		return 
	end
	--print("Success combuctor")
	self:SecureHook(Combuctor.ItemSlot, "Update", "CombuctorUpdate")
end

-- Combuctor
function ColorInventory:CombuctorUpdate(combuctor)
	--print("CombuctorUpdate")
	
	local link = combuctor.hasItem
	
	
	--print(link)
	if link then		
		self:PrepareButton(combuctor)
		self:ColorButton(combuctor, link)	
	else
		self:CleanButton(combuctor)
	end
end

function ColorInventory:CreateBorder(slot, refPoint, slotName)
    	local border = slot:CreateTexture(nil, "OVERLAY")
    	--border:SetTexture("Interface\\Buttons\\UI-Button-Outline")
		border:SetTexture("Interface\\Addons\\ColorInventory\\colorFrame")
    	border:SetBlendMode("ADD")
    	--border:SetVertexColor(0, 1, 0)
    	border:SetAlpha(0.5)
    	border:SetHeight(38)
    	border:SetWidth(38)
    	border:SetPoint("CENTER", slot or refPoint)
    	border:Hide()
    	self.borders[slotName] = border
    	return border
end

function ColorInventory:PrepareButton(button)	
		
		if not button.border then
		button.border = button:CreateTexture(nil, "OVERLAY")
		button.border:SetTexture("Interface\\Addons\\ColorInventory\\colorFrame")
		--button.border:SetTexture([[Interface\Buttons\UI-ActionButton-Border]])
		button.border:SetWidth(38)
		button.border:SetAlpha(0.5)
		button.border:SetHeight(38)
		button.border:SetPoint("CENTER", button)
		button.border:SetBlendMode('ADD')
		button.border:Hide()
		end
end

function ColorInventory:ColorButton(button, link)
    --local borderFrame = self:getBorderFrame(slotFrame,slotName)
	
	if button.border then
		local r, g, b = self:determineColor(link)
		if r ~= nil and g ~= nil and b ~= nil then
            		button.border:SetVertexColor(r, g, b, 0.5)
            		button.border:Show()
        	else
            		button.border:Hide()
        	end
		button.hasBorder = true
	end	
end

function ColorInventory:CleanButton(button)
	--print("Cleaning")
	if button.border then
		button.border:Hide()
	end
end

function ColorInventory:ScanGuildBank()
	local bankTab = GetCurrentGuildBankTab()
    	for i=1, gBankMax do
        	local index, column = self:walkGBank(i)
        	local slotName  = "GuildBankColumn"..column.."Button"..index
        	local slotFrame = _G[slotName]
        	local itemLink  = GetGuildBankItemLink(bankTab, i)
        	self:Colorize(itemLink, slotFrame, slotName)
    	end
end

function ColorInventory:walkGBank(i)
    	local index, column
    	index = mod(i, gBankGroupMax)
    	if ( index == 0 ) then
        	index = gBankGroupMax
    	end
    	column = ceil((i-0.5)/gBankGroupMax)
    	return index, column
end

function ColorInventory:getBorderFrame(slotFrame, slotName)
    	if slotFrame == nil then
        	return
    	end
    	local borderFrame = self.borders[slotName]
    	if borderFrame == nil then
        	borderFrame = self:CreateBorder(slotFrame, nil, slotName)
    	end
    	return borderFrame
end

function ColorInventory:ScanAllBags( )
	for containerIndex = 1, containerMax do
		self:_ScanBag(containerIndex)
	end
end

function ColorInventory:ClearAllBags( )
	for containerIndex = 1, containerMax do
    		local bagFrame = _G["ContainerFrame"..containerIndex]
    		if bagFrame == nil then
        		return
    		end
    		local bagIndex  = bagFrame:GetID()  -- deal with bank vs nonbank bag id issues.
    		local bagSize   = GetContainerNumSlots(bagIndex)
		for itemIndex = 1, bagSize do
			local borderFrame = self:getBorderFrame(slotFrame,slotName)
			if (borderFrame) then 
				borderFrame:Hide()
			end
		end
	end
end

function ColorInventory:_ScanBag(containerIndex) --containerIndex, bagIndex )
    	local bagFrame = _G["ContainerFrame"..containerIndex]
    	if bagFrame == nil then
        	return
    	end
    	local bagIndex  = bagFrame:GetID()  -- deal with bank vs nonbank bag id issues.
    	local bagSize   = GetContainerNumSlots(bagIndex)
    	if bagFrame:IsVisible() then
        	for itemIndex = 1, bagSize do
			local slotName  = "ContainerFrame"..containerIndex.."Item"..itemIndex
            		local slotFrame = _G["ContainerFrame"..containerIndex.."Item"..itemIndex] -- _G[slotName]
            		local slotIndex = abs(itemIndex - (bagSize + 1))
            		local itemLink  = GetContainerItemLink(bagIndex, slotIndex) 
       			if slotFrame and slotFrame:IsVisible() then
               			self:Colorize(itemLink, slotFrame, slotName)
       			end
        	end
    	end
end



function ColorInventory:ScanBank()
	for bankIndex = 1, GetContainerNumSlots(-1) do
        	local slotName  = "BankFrameItem"..bankIndex
		local slotFrame = _G[slotName]
		local borderFrame = self:getBorderFrame(slotFrame,slotName)
		if (borderFrame) then 
			borderFrame:Hide()
		end
	end
    	for bankIndex = 1, GetContainerNumSlots(-1) do
        	local slotName  = "BankFrameItem"..bankIndex
		local slotFrame = _G[slotName]
        	local itemLink  = GetContainerItemLink(-1, bankIndex)
		if itemLink then 
			if slotFrame and slotFrame:IsVisible() then
				self:Colorize(itemLink, slotFrame, slotName)
			end
		elseif borderFrame then
			borderFrame:Hide()
		end
	end
end

function ColorInventory:Colorize(itemLink,slotFrame,slotName)
    local borderFrame = self:getBorderFrame(slotFrame,slotName)
	if itemLink and borderFrame then
        	local r, g, b = self:determineColor(itemLink)
        	if r ~= nil and g ~= nil and b ~= nil then
            		borderFrame:SetVertexColor(r, g, b)
            		borderFrame:Show()
        	else
            		borderFrame:Hide()
        	end
    	elseif borderFrame then
        	borderFrame:Hide()
    	end
end

function ColorInventory:determineColor(itemLink)
    	local ItemRarity = select(3, GetItemInfo(itemLink))
		
		local itemType = select(6, GetItemInfo(itemLink))
		
		if (itemType == "Glyph") then
			if db.Glyphs then
				local class = select(7, GetItemInfo(itemLink))
				--print("class for glyph " .. class)
				local playerClass = UnitClass("player")
				if (playerClass == class or db.Glyphs_always) then 
					Gratuity:SetHyperlink(itemLink)
					local glyphType = Gratuity:GetLine(2,false)
	
					
					if (glyphType == "Prime Glyph") then
						ItemRarity = 5 -- legendary
					
					elseif (glyphType == "Major Glyph") then
						ItemRarity = 3 --rare
					
					elseif (glyphType == "Minor Glyph") then
						ItemRarity = 2 --green
					end
					
					local r, g, b, hex = GetItemQualityColor(ItemRarity)
					return r, g, b
				else
					r = 0
	     			g = 0.7
             		b = 0.7
             		return r, g, b
				end
			end
		end
		
		
    	if (ItemRarity) then
		--Glyphs will be colored UnCommon for Major and Rare for Minor
		
		if ItemRarity == 0 then 
			--Coloring junk items red to make them stand out
             if db.Junk then
             		r = 1.0
	     			g = 0.0
             		b = 0.0
             		return r, g, b
             end
		elseif ItemRarity == 1 then
			if db.Quest then
				--Check for quest items
				Gratuity:SetHyperlink(itemLink)
				local quest = Gratuity:Find('Quest',1,4,false,1)
				if quest ~= nil then
					r = db.QuestColor.r
					g = db.QuestColor.g
					b = db.QuestColor.b
					return r, g, b
					--return 0,0,0
				end
			end
			if db.Common then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		elseif ItemRarity == 2 then
			if db.Uncommon then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		elseif ItemRarity == 3 then
			if db.Rare then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		elseif ItemRarity == 4 then
			if db.Epic then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		elseif ItemRarity == 5 then
			if db.Legendary then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		elseif ItemRarity == 6 then
			if db.Artifact then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		elseif ItemRarity == 7 then
			if db.Heirloom then
				local r, g, b, hex = GetItemQualityColor(ItemRarity)
				return r, g, b
			end
		else
			return
		end
		return
    	end
    	return
end

local function hasBlizzardQuestHighlight() 
	return GetContainerItemQuestInfo and true or false 
end