----------------------------------------------------
-- 
----------------------------------------------------
--disable it, set 0 (to stop logging unknown spell ids)
local debug1 = 1;

WLoseControlDB = WLoseControlDB or { scale = 2, timer = false, hidden = false, lock = false, PVPauras = {}, PVEauras = {}, }
--local abilities = {}
--local order
--local band = bit.band
local debuffs1 = {
	-- Other
	[1604] = "Snare",	-- Dazed
	-- Death Knight
	[47481] = "CC",		-- Gnaw (Ghoul)
	[51209] = "CC",		-- Hungering Cold
	[47476] = "Silence",	-- Strangulate
	[45524] = "Snare",	-- Chains of Ice
	[55666] = "Snare",	-- Desecration (no duration, lasts as long as you stand in it)
	[58617] = "Snare",	-- Glyph of Heart Strike
	[50436] = "Snare",	-- Icy Clutch (Chilblains)
	-- Druid
	[5211]  = "CC",		-- Bash (also Shaman Spirit Wolf ability)
	[33786] = "CC",		-- Cyclone
	[2637]  = "CC",		-- Hibernate (works against Druids in most forms and Shamans using Ghost Wolf)
	[22570] = "CC",		-- Maim
	[9005]  = "CC",		-- Pounce
	[339]   = "Root",	-- Entangling Roots
	[19675] = "Root",	-- Feral Charge Effect (immobilize with interrupt [spell lockout, not silence])
	[58179] = "Snare",	-- Infected Wounds
	[61391] = "Snare",	-- Typhoon
	-- Hunter
	[60210] = "CC",		-- Freezing Arrow Effect
	[3355]  = "CC",		-- Freezing Trap Effect
	[24394] = "CC",		-- Intimidation
	[1513]  = "CC",		-- Scare Beast (works against Druids in most forms and Shamans using Ghost Wolf)
	[19503] = "CC",		-- Scatter Shot
	[19386] = "CC",		-- Wyvern Sting
	[34490] = "Silence",	-- Silencing Shot
	[53359] = "Disarm",	-- Chimera Shot - Scorpid
	[19306] = "Root",	-- Counterattack
	[19185] = "Root",	-- Entrapment
	[35101] = "Snare",	-- Concussive Barrage
	[5116]  = "Snare",	-- Concussive Shot
	[13810] = "Snare",	-- Frost Trap Aura (no duration, lasts as long as you stand in it)
	[61394] = "Snare",	-- Glyph of Freezing Trap
	[2974]  = "Snare",	-- Wing Clip
	-- Hunter Pets
	[50519] = "CC",		-- Sonic Blast (Bat)
	[50541] = "Disarm",	-- Snatch (Bird of Prey)
	[54644] = "Snare",	-- Froststorm Breath (Chimera)
	[50245] = "Root",	-- Pin (Crab)
	[50271] = "Snare",	-- Tendon Rip (Hyena)
	[50518] = "CC",		-- Ravage (Ravager)
	[54706] = "Root",	-- Venom Web Spray (Silithid)
	[4167]  = "Root",	-- Web (Spider)
	-- Mage
	[44572] = "CC",		-- Deep Freeze
	[31661] = "CC",		-- Dragon's Breath
	[12355] = "CC",		-- Impact
	[118]   = "CC",		-- Polymorph
	[18469] = "Silence",	-- Silenced - Improved Counterspell
	[64346] = "Disarm",	-- Fiery Payback
	[33395] = "Root",	-- Freeze (Water Elemental)
	[122]   = "Root",	-- Frost Nova
	[11071] = "Root",	-- Frostbite
	[55080] = "Root",	-- Shattered Barrier
	[11113] = "Snare",	-- Blast Wave
	[6136]  = "Snare",	-- Chilled (generic effect, used by lots of spells [looks weird on Improved Blizzard, might want to comment out])
	[120]   = "Snare",	-- Cone of Cold
	[116]   = "Snare",	-- Frostbolt
	[47610] = "Snare",	-- Frostfire Bolt
	[31589] = "Snare",	-- Slow
	-- Paladin
	[853]   = "CC",		-- Hammer of Justice
	[2812]  = "CC",		-- Holy Wrath (works against Warlocks using Metamorphasis and Death Knights using Lichborne)
	[20066] = "CC",		-- Repentance
	[20170] = "CC",		-- Stun (Seal of Justice proc)
	[10326] = "CC",		-- Turn Evil (works against Warlocks using Metamorphasis and Death Knights using Lichborne)
	[63529] = "Silence",	-- Shield of the Templar
	[20184] = "Snare",	-- Judgement of Justice (100% movement snare; druids and shamans might want this though)
	-- Priest
	[605]   = "CC",		-- Mind Control
	[64044] = "CC",		-- Psychic Horror
	[8122]  = "CC",		-- Psychic Scream
	[9484]  = "CC",		-- Shackle Undead (works against Death Knights using Lichborne)
	[15487] = "Silence",	-- Silence
	--[64058] = "Disarm",	-- Psychic Horror (duplicate debuff names not allowed atm, need to figure out how to support this later)
	[15407] = "Snare",	-- Mind Flay
	-- Rogue
	[2094]  = "CC",		-- Blind
	[1833]  = "CC",		-- Cheap Shot
	[1776]  = "CC",		-- Gouge
	[408]   = "CC",		-- Kidney Shot
	[6770]  = "CC",		-- Sap
	[1330]  = "Silence",	-- Garrote - Silence
	[18425] = "Silence",	-- Silenced - Improved Kick
	[51722] = "Disarm",	-- Dismantle
	[31125] = "Snare",	-- Blade Twisting
	[3409]  = "Snare",	-- Crippling Poison
	[26679] = "Snare",	-- Deadly Throw
	-- Shaman
	[39796] = "CC",		-- Stoneclaw Stun
	[51514] = "CC",		-- Hex (although effectively a silence+disarm effect, it is conventionally thought of as a "CC", plus you can trinket out of it)
	[64695] = "Root",	-- Earthgrab (Storm, Earth and Fire)
	[63685] = "Root",	-- Freeze (Frozen Power)
	[3600]  = "Snare",	-- Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
	[8056]  = "Snare",	-- Frost Shock
	[8034]  = "Snare",	-- Frostbrand Attack
	-- Warlock
	[710]   = "CC",		-- Banish (works against Warlocks using Metamorphasis and Druids using Tree Form)
	[6789]  = "CC",		-- Death Coil
	[5782]  = "CC",		-- Fear
	[5484]  = "CC",		-- Howl of Terror
	[6358]  = "CC",		-- Seduction (Succubus)
	[30283] = "CC",		-- Shadowfury
	[24259] = "Silence",	-- Spell Lock (Felhunter)
	[18118] = "Snare",	-- Aftermath
	[18223] = "Snare",	-- Curse of Exhaustion
	-- Warrior
	[7922]  = "CC",		-- Charge Stun
	[12809] = "CC",		-- Concussion Blow
	[20253] = "CC",		-- Intercept (also Warlock Felguard ability)
	[5246]  = "CC",		-- Intimidating Shout
	[12798] = "CC",		-- Revenge Stun
	[46968] = "CC",		-- Shockwave
	[18498] = "Silence",	-- Silenced - Gag Order
	[676]   = "Disarm",	-- Disarm
	[58373] = "Root",	-- Glyph of Hamstring
	[23694] = "Root",	-- Improved Hamstring
	[1715]  = "Snare",	-- Hamstring
	[12323] = "Snare",	-- Piercing Howl
	-- Other
	[30217] = "CC",		-- Adamantite Grenade
	[67769] = "CC",		-- Cobalt Frag Bomb
	[30216] = "CC",		-- Fel Iron Bomb
	[20549] = "CC",		-- War Stomp
	[25046] = "Silence",	-- Arcane Torrent
	[39965] = "Root",	-- Frost Grenade
	[55536] = "Root",	-- Frostweave Net
	[13099] = "Root",	-- Net-o-Matic
	[29703] = "Snare",	-- Dazed
}
local buffs1 = {
	-- Immunities
	[46924] = "Immune",	-- Bladestorm (Warrior)
	[642]   = "Immune",	-- Divine Shield (Paladin)
	[45438] = "Immune",	-- Ice Block (Mage)
	[34692] = "Immune", -- The Beast Within (Hunter)
	[31821] = "Immune",	-- aura mastery
	[10278] = "Immune",	-- BOP
	[1044] = "Immune",	-- FREEDOM
}
local pvedebuffs1 = {
	-- Immunities
	--[69127] = "Immune",	-- chill of the throne
	--rotface
	[73023] = "Immune",	-- mutated infection
	--festergut
	[73020] = "Immune",	-- vile gas
	[72103] = "Immune",	-- inoculated
	--sindra
	[70126] = "Immune",	-- frost beacon
	[70157] = "Immune",	-- ice tomb
	[69762] = "Immune",	-- unchained magic
	[69766] = "Immune",	-- instability
	--valythria
	[70766] = "Immune",	-- dream state
	[71941] = "Immune",	-- twisted nightmares
	--deathbringer saurfang
	[72443] = "Immune",	-- boiling blood
	--lady deathwhisper
	[71237] = "Immune",	-- curse of torpor
	[71289] = "Immune",	-- dominate mind
	--[71001] = "Immune",	-- death and decay
	--lord marrowgar
	[69065] = "Immune",	-- impaled
}
local pveblacklist1 = {
	-- Immunities
	[26013] = "Immune",	-- BG Deserter
	[69127] = "Immune",	-- chill of the throne
	[25771] = "Immune",	-- forbearance
	[57723] = "Immune",	-- exhaustion
	[6788] = "Immune",	-- weakened soul
	--prof
	--[73117] = "Immune",	-- plague sickness
	--sindra
	[71052] = "Immune",	-- frost aura
}

local pveblacklist = {}
local buffs = {} -- localized names are saved here
local debuffs = {} -- localized names are saved here
local pvedebuffs = {} -- localized names are saved here
for k, v in pairs(buffs1) do
	local name = GetSpellInfo(k)
	if name then
		buffs[name] = v
	end
end

for k, v in pairs(debuffs1) do
	local name = GetSpellInfo(k)
	if name then
		debuffs[name] = v
	end
end

for k, v in pairs(pvedebuffs1) do
	local name = GetSpellInfo(k)
	if name then
		pvedebuffs[name] = v
	end
end

for k, v in pairs(pveblacklist1) do
	local name = GetSpellInfo(k)
	if name then
		pveblacklist[name] = v
	end
end

local bufftype ={
	["Silence"] = 1,
	["CC"] = 2,
	["Root"] = 3,
	["Snare"] = 4,
	["Disarm"] = 5,
	["Immune"] = 6,
}

local frame
local bar
local zonetype=0
--local PlayerName = GetUnitName("player")

local GetTime = GetTime
local ipairs = ipairs
--local pairs = pairs
--local select = select
--local floor = floor
--local band = bit.band
local GetSpellInfo = GetSpellInfo

--local GROUP_UNITS = bit.bor(0x00000010, 0x00000400)

local function WLoseControl_SavePosition()
	local point, _, relativePoint, xOfs, yOfs = bar:GetPoint()
	if not WLoseControlDB.Position then
		WLoseControlDB.Position = {}
	end
	WLoseControlDB.Position.point = point
	WLoseControlDB.Position.relativePoint = relativePoint
	WLoseControlDB.Position.xOfs = xOfs
	WLoseControlDB.Position.yOfs = yOfs
end

local function WLoseControl_LoadPosition()
	if WLoseControlDB.Position then
		bar:SetPoint(WLoseControlDB.Position.point,UIParent,WLoseControlDB.Position.relativePoint,WLoseControlDB.Position.xOfs,WLoseControlDB.Position.yOfs)
	else
		bar:SetPoint("CENTER", UIParent, "CENTER")
	end
end

local function WLoseControl_UpdateBar()
	bar:SetScale(WLoseControlDB.scale)
	if WLoseControlDB.lock then
		bar:EnableMouse(false)
	else
		bar:EnableMouse(true)
	end
end

local function WLoseControl_CreateBar()
	bar = CreateFrame("Frame", nil, UIParent)
	bar:SetMovable(true)
	bar:SetWidth(30)
	bar:SetHeight(30)
	bar:SetClampedToScreen(true)
	bar:SetScript("OnMouseDown",function(self,button) if button == "LeftButton" then self:StartMoving() end end)
	bar:SetScript("OnMouseUp",function(self,button) if button == "LeftButton" then self:StopMovingOrSizing() WLoseControl_SavePosition() end end)
	bar:Show()

	--local x = -45
	--local y = 0

	local _,_,spellicon = GetSpellInfo(642)
	local ability = { icon = spellicon, duration = 30 }

	local cd = CreateFrame("Cooldown",nil,bar)
	cd.noomnicc = true
	cd.noCooldownCount = true
	cd:SetAllPoints(true)
	cd:SetFrameStrata("MEDIUM")
	cd:SetReverse(true)
	cd:Hide()

	local texture = bar:CreateTexture(nil,"BACKGROUND")
	texture:SetAllPoints(true)
	texture:SetTexture(ability.icon)
	texture:SetTexCoord(0.07,0.9,0.07,0.90)

	local text = cd:CreateFontString(nil,"ARTWORK")
	text:SetFont(STANDARD_TEXT_FONT,16,"OUTLINE")
	text:SetTextColor(1,1,0,1)
	text:SetPoint("CENTER",bar,"CENTER",2,0)

	bar.texture = texture
	bar.text = text
	bar.duration = ability.duration
	bar.cd = cd

	WLoseControl_UpdateBar()
	WLoseControl_LoadPosition()
end

local function WLoseControl_UpdateText(cooldown)
	if cooldown < 10 then
		if cooldown <= 0.1 then
			bar.text:SetText("")
		else
			bar.text:SetFormattedText("%1.1f",cooldown)
		end
	else
		bar.text:SetFormattedText("%d",cooldown)
	end
	if cooldown < 6 then
		bar.text:SetTextColor(1,0,0,1)
	else
		bar.text:SetTextColor(1,1,0,1)
	end
end

local function WLoseControl_StopAbility()
	if WLoseControlDB.hidden then bar:Hide() end
	bar.cooldown = 0
	bar.duration = 0
	bar.text:SetText("")
	bar.cd:Hide()
end

local time = 0
local tttime = 0.1
local function WLoseControl_OnUpdate(self, elapsed)
	time = time + elapsed
	if time > tttime then
		bar.cooldown = bar.start + bar.duration - GetTime()
		if bar.cooldown <= 0 then
			WLoseControl_StopAbility()
			frame:SetScript("OnUpdate",nil)
		else
			WLoseControl_UpdateText(bar.cooldown)
		end
		time = time - tttime
	end
end

local function WLoseControl_StartTimer(icon,expirationtime)
	if WLoseControlDB.hidden then
		bar:Show()
	end
	if expirationtime ~=0 then
		local time1=GetTime()
		bar.texture:SetTexture(icon)
		bar.duration = expirationtime - time1
		bar.cd:Show()
		bar.cd:SetReverse(true)
		bar.cd:SetCooldown(time1-0.40,bar.duration)
		bar.start = time1
		WLoseControl_UpdateText(bar.duration)

		frame:SetScript("OnUpdate",WLoseControl_OnUpdate)
	else
		bar.texture:SetTexture(icon)
		bar.cd:Show()
		bar.cd:SetReverse(false)
	end
end

local function WLoseControl_ResetAllTimers()
	WLoseControl_StopAbility()
end

local name2
local expirationtime2=0

local function WLoseControl_UNIT_AURA(unit1)
	if unit1 ~= "player" then return end

	local name1
	local duration1=0
	local icon1
	local expirationtime1=0

	if zonetype == 1 then --PVE
		--duration1 = -1
		for i = 1, 40 do
			local name, _, icon, _, dtype2, duration, expirationtime,ucaster,_,_,sid = UnitDebuff(unit1, i)
			if not name then break end
			if pvedebuffs[name] then
				--[[
				if name ~= name2 then
					ChatFrame3:AddMessage(tostring(name))
					ChatFrame3:AddMessage(tostring(sid))
				end
				--]]
				name1=name
				icon1=icon
				duration1=duration
				expirationtime1=expirationtime
				break
			elseif not pveblacklist[name] then
				--
				if name ~= name2 then
					ChatFrame3:AddMessage(tostring(name))
					ChatFrame3:AddMessage(tostring(sid))
				end
				--]]
				--ChatFrame3:AddMessage(tostring(pveblacklist[name]))
				--ChatFrame3:AddMessage(tostring(duration))
				--ChatFrame3:AddMessage(tostring(expirationtime))
				name1=name
				icon1=icon
				duration1=duration
				expirationtime1=expirationtime
				--break
				--elseif expirationtime == expirationtime1 then
				--	duration1=-1
				--end
				--[[
				if debug1 == 1 then
					local za1,za3--,za2
					za1=GetZoneText()
					--za2=GetSubZoneText()
					za3=UnitName(ucaster)
					if not WLoseControlDB.PVEauras[sid] then
						if name ~= name2 then
							ChatFrame3:AddMessage(tostring(name))
							ChatFrame3:AddMessage(tostring(sid))
						end
						WLoseControlDB.PVEauras[sid] = " PVE "..tostring(name).."   "..tostring(za1).."  "..tostring(za3).."   "..tostring(dtype2).."  "..tostring(duration);
					end
				end
				--]]
			end
		end
		if icon1 then
			if name1~=name2 or expirationtime1~=expirationtime2 then
				name2=name1
				--ChatFrame3:AddMessage("4")
				expirationtime2=expirationtime1
				WLoseControl_StartTimer(icon1,expirationtime1)
			end
		else-- not icon1 then
			name2=""
			expirationtime2=0
			WLoseControl_StopAbility()
		end


	elseif zonetype == 2 then	--PVP
		local firstdbf=0
		for i = 1, 40 do
			local name, _, icon, _, dtype1, duration, expirationtime,_,_,_,Auraid7 = UnitDebuff(unit1, i)
			if not name then break end
		--[[
		ChatFrame3:AddMessage("------")
		ChatFrame3:AddMessage(tostring(name))
		ChatFrame3:AddMessage(tostring(duration))
		ChatFrame3:AddMessage(tostring(expirationtime))
		--]]
			if debuffs[name] then
				if( firstdbf==1 and ( name1 and bufftype[debuffs[name1]]>bufftype[debuffs[name]] ) or ( bufftype[debuffs[name1]]==bufftype[debuffs[name]] and expirationtime > expirationtime1) ) then
					firstdbf=1
					name1=name
					icon1=icon
					duration1=duration
					expirationtime1=expirationtime
				elseif firstdbf==0 and expirationtime > expirationtime1 then
					--ChatFrame3:AddMessage("-----------")
					--ChatFrame3:AddMessage(tostring(name1))
					--ChatFrame3:AddMessage(tostring(bufftype[debuffs[name1]]))
					--ChatFrame3:AddMessage(tostring(name))
					--ChatFrame3:AddMessage(tostring(bufftype[debuffs[name]]))
					--ChatFrame3:AddMessage("-----------")
					firstdbf=1
					name1=name
					icon1=icon
					duration1=duration
					expirationtime1=expirationtime
				end
			elseif debug1 == 1 then
				local zas123
				_, zas123 = IsInInstance()
				if (zas123 =="pvp" or zas123 =="arena") and not WLoseControlDB.PVPauras[Auraid7] then
					--ChatFrame3:AddMessage(tostring(name))
					WLoseControlDB.PVPauras[Auraid7] = " PVP "..name.."  "..tostring(dtype1).."  "..tostring(duration);
				end
			end
		end
		if firstdbf==0 then
			for i = 1, 40 do
				local name, _, icon, _, _, duration, expirationtime = UnitBuff(unit1, i)
				if not name then break end
				if buffs[name] then
					if expirationtime > expirationtime1 then
						name1=name
						icon1=icon
						duration1=duration
						expirationtime1=expirationtime
						--break
					end
				end
			end
		end

		if duration1 > 0 then
			if name1~=name2 or expirationtime1~=expirationtime2 then
				name2=name1
				--ChatFrame3:AddMessage(tostring(name2))
				--ChatFrame3:AddMessage(tostring(bufftype[debuffs[name2]]))
				expirationtime2=expirationtime1
				WLoseControl_StartTimer(icon1,expirationtime1)
			end
		elseif duration1 == 0 then
			name2=""
			expirationtime2=0
			WLoseControl_StopAbility()
		end
	end

end

local function WLoseControl_PLAYER_ENTERING_WORLD(self)
	WLoseControl_ResetAllTimers()

	local _, type1 = IsInInstance()
	if ( type1 == "party" or type1 == "raid" ) then
		zonetype = 1
		--for _,v in ipairs(order) do bar[v]:Hide() end
	else
		zonetype = 2
	end
end

local function WLoseControl_Reset()
	WLoseControlBarDB = { scale = 2, hidden = false, lock = false }
	WLoseControl_UpdateBar()
	WLoseControl_LoadPosition()
end

local function WLoseControl_Test()
	local _,_,icon = GetSpellInfo(1044)
	local expiration = 30 + GetTime()
	WLoseControl_StartTimer(icon,expiration)
end

local cmdfuncs = {
	scale = function(v) WLoseControlDB.scale = v; WLoseControl_UpdateBar() end,
	hidden = function() WLoseControlDB.hidden = not WLoseControlDB.hidden; WLoseControl_UpdateBar() end,
	lock = function() WLoseControlDB.lock = not WLoseControlDB.lock; WLoseControl_UpdateBar() end,
	reset = function() WLoseControl_Reset() end,
	test = function() WLoseControl_Test() end,
}

local cmdtbl = {}
function WLoseControl_Command(cmd)
	for k in ipairs(cmdtbl) do
		cmdtbl[k] = nil
	end
	for v in gmatch(cmd, "[^ ]+") do
  	tinsert(cmdtbl, v)
  end
  local cb = cmdfuncs[cmdtbl[1]]
  if cb then
  	local s = tonumber(cmdtbl[2])
  	cb(s)
  else
  	ChatFrame1:AddMessage("WLoseControl Options | /whpa <option>",0,1,0)
  	ChatFrame1:AddMessage("-- scale <number> | value: " .. WLoseControlDB.scale,0,1,0)
  	ChatFrame1:AddMessage("-- hidden (toggle) | value: " .. tostring(WLoseControlDB.hidden),0,1,0)
  	ChatFrame1:AddMessage("-- lock (toggle) | value: " .. tostring(WLoseControlDB.lock),0,1,0)
  	ChatFrame1:AddMessage("-- test (execute)",0,1,0)
  	ChatFrame1:AddMessage("-- reset (execute)",0,1,0)
  end
end

local function WLoseControl_OnLoad(self)
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_AURA")
	if not WLoseControlDB.scale then WLoseControlDB.scale = 2 end
	if not WLoseControlDB.hidden then WLoseControlDB.hidden = false end
	if not WLoseControlDB.lock then WLoseControlDB.lock = false end
	if not WLoseControlDB.timer then WLoseControlDB.timer = true end
	if not WLoseControlDB.PVPauras then WLoseControlDB.PVPauras = {} end
	if not WLoseControlDB.PVEauras then WLoseControlDB.PVEauras = {} end
	WLoseControl_CreateBar()

	SlashCmdList["WLoseControl"] = WLoseControl_Command
	SLASH_WLoseControl1 = "/wlc"

	ChatFrame1:AddMessage("WLoseControl loaded. Type /wlc for options.",0,1,0)

	WLoseControl_PLAYER_ENTERING_WORLD(self)
end

local eventhandler = {
	["UNIT_AURA"] = function(self,...) WLoseControl_UNIT_AURA(...) end,
	["VARIABLES_LOADED"] = function(self) WLoseControl_OnLoad(self) end,
	["PLAYER_ENTERING_WORLD"] = function(self) WLoseControl_PLAYER_ENTERING_WORLD(self) end,
}

local function WLoseControl_OnEvent(self,event,...)
	--if 1 or zonetype == 1 then
	--eventhandler[event](self,...)
	--end
	eventhandler[event](self,...)
end

frame = CreateFrame("Frame",nil,UIParent)
frame:SetScript("OnEvent",WLoseControl_OnEvent)
frame:RegisterEvent("VARIABLES_LOADED")
