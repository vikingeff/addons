--[[
Copyright 2008-2013 João Cardoso
Scrap is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of Scrap.
--]]

local Tooltip = CreateFrame('GameTooltip', 'ScrapTooltip', nil, 'GameTooltipTemplate')
local Scrap = CreateFrame('Button', 'Scrap', MerchantBuyBackItem)
local Unfit = LibStub('Unfit-1.0')
local L = Scrap_Locals


--[[ Constants ]]--

local CLASS_NAME = LOCALIZED_CLASS_NAMES_MALE[select(2, UnitClass('player'))]
local WEAPON, ARMOR, _, CONSUMABLES = GetAuctionItemClasses()
local FISHING_ROD = select(17 , GetAuctionItemSubClasses(1))

local CAN_TRADE = BIND_TRADE_TIME_REMAINING:format('.*')
local CAN_REFUND = REFUND_TIME_REMAINING:format('.*')
local MATCH_CLASS = ITEM_CLASSES_ALLOWED:format('')
local IN_SET = EQUIPMENT_SETS:format('.*')
local SLOT_SLICE = ('INVTYPE_'):len() + 1

local ACTUAL_SLOTS = {
	ROBE = 'CHEST',
	CLOAK = 'BACK',
	RANGEDRIGHT = 'RANGED',
	THROWN = 'RANGED',
	WEAPONMAINHAND = 'MAINHAND',
	WEAPONOFFHAND = 'OFFHAND',
	HOLDABLE = 'OFFHAND',
	SHIELD = 'OFFHAND',
}

BINDING_NAME_SCRAP_TOGGLE = L.ToggleJunk
BINDING_NAME_SCRAP_SELL = L.SellJunk
BINDING_HEADER_SCRAP = 'Scrap'

Scrap_Junk = Scrap_Junk or {}
Scrap_AI = Scrap_AI or {}


--[[ Locals ]]

local function GetLine(i)
	local line = _G['ScrapTooltipTextLeft'..i]
	return line and line:GetText() or ''
end

local function GetValue(level, quality)
	if quality == ITEM_QUALITY_EPIC then
		return (level + 344.36) / 106.29
	elseif quality == ITEM_QUALITY_RARE then
		return (level + 287.14) / 97.632
	else
		return (level + 292.23) / 101.18
	end
end


--[[ Events ]]--

function Scrap:Startup()
	self.SettingsUpdated = function() end
	self:SetScript('OnEvent', function(self, event) self[event](self) end)
	self:RegisterEvent('VARIABLES_LOADED')
	self:RegisterEvent('MERCHANT_SHOW')
end

function Scrap:VARIABLES_LOADED()
	setmetatable(Scrap_Junk, Scrap_BaseList)
	self.Startup, self.VARIABLES_LOADED = nil
	
	if not Scrap_Tut then
		Scrap_AutoSell, Scrap_Safe = true, true
	end
	
	if not Scrap_Version then	
		Scrap_Icons = true
	end
	
	Scrap_Version = 11
end

function Scrap:MERCHANT_SHOW()
	self.MERCHANT_SHOW = nil
	
	if LoadAddOn('Scrap_Merchant') then
		self:MERCHANT_SHOW()
	else
		self:UnregisterEvent('MERCHANT_SHOW')
	end
end


--[[ Junk Public Methods ]]--

function Scrap:IsJunk(id, ...)
	if id and Scrap_Junk[id] ~= false then
		return Scrap_Junk[id] or (Scrap_AI[id] and Scrap_AI[id] > 3) or self:CheckFilters(id, ...)
	end
end

function Scrap:IterateJunk()
	local bagNumSlots, bag, slot = GetContainerNumSlots(BACKPACK_CONTAINER), BACKPACK_CONTAINER, 0
	local match, id
	
	return function()
		match = nil
		
		while not match do
			if slot < bagNumSlots then
				slot = slot + 1
			elseif bag < NUM_BAG_FRAMES then
				bag = bag + 1
				bagNumSlots = GetContainerNumSlots(bag)
				slot = 1
			else
				bag, slot = nil
				break
			end
			
			id = GetContainerItemID(bag, slot)
			match = self:IsJunk(id, bag, slot)
		end
		
		return bag, slot, id
	end
end

function Scrap:ToggleJunk(id)
	local message

	if self:IsJunk(id) then
	   	Scrap_Junk[id] = false
		message = L.Removed
	else
	   	Scrap_Junk[id] = true
		message = L.Added
  	end

	self:Print(message, select(2, GetItemInfo(id)), 'LOOT')
end


--[[ Filters ]]--

function Scrap:CheckFilters(...)
	local _, link, quality, level, minLevel, category, class, _, equipSlot, _, value = GetItemInfo(...)
	local level = max(level or 0, minLevel or 0)
	local gray = quality == ITEM_QUALITY_POOR
	local value = value and value > 0

	local equipment = category == ARMOR or category == WEAPON
	local consumable = category == CONSUMABLES

	if gray then
		return not equipment or self:HighLevel(level)

	elseif equipment then
		local slot = equipSlot:sub(SLOT_SLICE)

		if value and self:StandardQuality(quality) and self:CombatSlot(slot, class) then
			return self:EvaluateTooltip(class, equipSlot, slot, level, quality, link, ...)
		end

	elseif consumable then
		return value and Scrap_LowConsume and self:LowLevel(level)
	end
end

function Scrap:HighLevel(level)
	return level > 10 or UnitLevel('player') > 8
end

function Scrap:LowLevel(level)
	return level ~= 0 and level < (UnitLevel('player') - 10)
end

function Scrap:StandardQuality(quality)
	return quality >= ITEM_QUALITY_UNCOMMON and quality <= ITEM_QUALITY_EPIC
end

function Scrap:CombatSlot(slot, class)
	return slot ~= 'TABARD' and slot ~= 'BODY' and class ~= FISHING_ROD
end

function Scrap:EvaluateTooltip(class, equipSlot, slotID, level, quality, link, id, ...)
	local bag, slot = self:GetSlot(id, ...)
	self:LoadTooltip(link, bag, slot)
			
	if not self:BelongsToSet() and self:IsSoulbound(bag, slot) then
		local unusable = not self:IsEnchanter() and (Unfit:IsClassUnusable(class, equipSlot) or self:IsOtherClass())
		return unusable or self:IsLowEquip(id, class, slotID, level, quality)
	end
end

function Scrap:BelongsToSet()
	return CanUseEquipmentSets() and GetLine(self.numLines - 1):find(IN_SET)
end

function Scrap:IsSoulbound(bag, slot)
	local lastLine = GetLine(self.numLines)
	local soulbound = bag and slot and ITEM_SOULBOUND or ITEM_BIND_ON_PICKUP

	if not lastLine:find(CAN_TRADE) and not lastLine:find(CAN_REFUND) then
		for i = 2,7 do
			if GetLine(i) == soulbound then
				self.limit = i
				return true
			end
		end
	end
end

function Scrap:IsEnchanter()
    local prof1, prof2 = GetProfessions()
    return not prof1 or not prof2 or select(7, GetProfessionInfo(prof1)) == 333 or select(7, GetProfessionInfo(prof2)) == 333
end

function Scrap:IsOtherClass()
	for i = self.numLines, self.limit, -1 do
		local text = GetLine(i)
		if text:find(MATCH_CLASS) then
			return not text:find(CLASS_NAME)
		end
	end
end

function Scrap:IsLowEquip(id, class, slot, ...)
	if slot ~= '' and slot ~= 'TRINKET' then
		return self:HasBetterEquip(id, slot, ...)
	end
end

function Scrap:HasBetterEquip(id, slot, level, quality)
	if Scrap_LowEquip then
		local slot1, slot2 = ACTUAL_SLOTS[slot] or slot
		local value = GetValue(level, quality)
		local double
		
		if slot1 == 'WEAPON' or slot1 == '2HWEAPON' then
			if slot1 == '2HWEAPON' then
				double = true
			end
			
			slot1, slot2 = 'MAINHAND', 'OFFHAND'
		elseif slot1 == 'FINGER' then
			slot1, slot2 = 'FINGER1', 'FINGER2'
		end
		
		return self:IsBetterEquip(slot1, value) and (not slot2 or self:IsBetterEquip(slot2, value, double))
	end
end

function Scrap:IsBetterEquip(slot, value, empty)
	local item = GetInventoryItemID('player', _G['INVSLOT_'..slot])
	if item then
		local _,_, quality, level = GetItemInfo(item)
		return GetValue(level, quality) / value > 1.1
	elseif empty then
		return true
	end
end


--[[ Data Mining ]]--

function Scrap:GetSlot(id, bag, slot)
	if bag and slot then
		return bag, slot
	elseif GetItemCount(id) > 0 then
		for bag = 0, NUM_BAG_FRAMES do
		  	 for slot = 1, GetContainerNumSlots(bag) do
		  	 	if id == GetContainerItemID(bag, slot) then
		  	 		return bag, slot
		  	 	end
			end
		end
	end
end

function Scrap:LoadTooltip(link, bag, slot)
	Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')

	if bag and slot then
		if bag ~= BANK_CONTAINER then
			Tooltip:SetBagItem(bag, slot)
		else
			Tooltip:SetInventoryItem('player', BankButtonIDToInvSlotID(slot))
		end
	else
		Tooltip:SetHyperlink(link)
	end
	
	self.numLines = Tooltip:NumLines()
end


--[[ Utility ]]--

function Scrap:PrintMoney(pattern, value)
	self:Print(pattern, GetCoinTextureString(value), 'MONEY')
end

function Scrap:Print (pattern, value, channel)
 	local channel = 'CHAT_MSG_'..channel
 	for i = 1, 10 do
		local frame = _G['ChatFrame'..i]
		if frame:IsEventRegistered(channel) then
			ChatFrame_MessageEventHandler(frame, channel, pattern:format(value), '', nil, '', nil, nil, nil, nil, nil, nil, nil, '')
		end
	end
end

function Scrap:GetID (link)
	return link and tonumber(link:match('item:(%d+)'))
end

Scrap:Startup()