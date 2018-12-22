----------------------------------------------------
-- 
----------------------------------------------------
-- disable it, set 0 (to stop logging unknown spell ids to SavedVariables in wow\WTF\Account\<acc_name>\SavedVariables\<addon_name>.lua)
-- later you can add them to the lists
local global_debug = 1;

local pvp_debuffs = {
    -- Other
    [1604] = "Snare", -- Dazed
    -- Death Knight
    [47481] = "CC", -- Gnaw (Ghoul)
    [51209] = "CC", -- Hungering Cold
    [47476] = "Silence", -- Strangulate
    [45524] = "Snare", -- Chains of Ice
    [55666] = "Snare", -- Desecration (no duration, lasts as long as you stand in it)
    [58617] = "Snare", -- Glyph of Heart Strike
    [50436] = "Snare", -- Icy Clutch (Chilblains)
    -- Druid
    [5211] = "CC", -- Bash (also Shaman Spirit Wolf ability)
    [33786] = "CC", -- Cyclone
    [2637] = "CC", -- Hibernate (works against Druids in most forms and Shamans using Ghost Wolf)
    [22570] = "CC", -- Maim
    [9005] = "CC", -- Pounce
    [339] = "Root", -- Entangling Roots
    [19675] = "Root", -- Feral Charge Effect (immobilize with interrupt [spell lockout, not silence])
    [58179] = "Snare", -- Infected Wounds
    [61391] = "Snare", -- Typhoon
    -- Hunter
    [60210] = "CC", -- Freezing Arrow Effect
    [3355] = "CC", -- Freezing Trap Effect
    [24394] = "CC", -- Intimidation
    [1513] = "CC", -- Scare Beast (works against Druids in most forms and Shamans using Ghost Wolf)
    [19503] = "CC", -- Scatter Shot
    [19386] = "CC", -- Wyvern Sting
    [34490] = "Silence", -- Silencing Shot
    [53359] = "Disarm", -- Chimera Shot - Scorpid
    [19306] = "Root", -- Counterattack
    [19185] = "Root", -- Entrapment
    [35101] = "Snare", -- Concussive Barrage
    [5116] = "Snare", -- Concussive Shot
    [13810] = "Snare", -- Frost Trap Aura (no duration, lasts as long as you stand in it)
    [61394] = "Snare", -- Glyph of Freezing Trap
    [2974] = "Snare", -- Wing Clip
    -- Hunter Pets
    [50519] = "CC", -- Sonic Blast (Bat)
    [50541] = "Disarm", -- Snatch (Bird of Prey)
    [54644] = "Snare", -- Froststorm Breath (Chimera)
    [50245] = "Root", -- Pin (Crab)
    [50271] = "Snare", -- Tendon Rip (Hyena)
    [50518] = "CC", -- Ravage (Ravager)
    [54706] = "Root", -- Venom Web Spray (Silithid)
    [4167] = "Root", -- Web (Spider)
    -- Mage
    [44572] = "CC", -- Deep Freeze
    [31661] = "CC", -- Dragon's Breath
    [12355] = "CC", -- Impact
    [118] = "CC", -- Polymorph
    [18469] = "Silence", -- Silenced - Improved Counterspell
    [64346] = "Disarm", -- Fiery Payback
    [33395] = "Root", -- Freeze (Water Elemental)
    [122] = "Root", -- Frost Nova
    [11071] = "Root", -- Frostbite
    [55080] = "Root", -- Shattered Barrier
    [11113] = "Snare", -- Blast Wave
    [6136] = "Snare", -- Chilled (generic effect, used by lots of spells [looks weird on Improved Blizzard, might want to comment out])
    [120] = "Snare", -- Cone of Cold
    [116] = "Snare", -- Frostbolt
    [47610] = "Snare", -- Frostfire Bolt
    [31589] = "Snare", -- Slow
    -- Paladin
    [853] = "CC", -- Hammer of Justice
    [2812] = "CC", -- Holy Wrath (works against Warlocks using Metamorphasis and Death Knights using Lichborne)
    [20066] = "CC", -- Repentance
    [20170] = "CC", -- Stun (Seal of Justice proc)
    [10326] = "CC", -- Turn Evil (works against Warlocks using Metamorphasis and Death Knights using Lichborne)
    [63529] = "Silence", -- Shield of the Templar
    [20184] = "Snare", -- Judgement of Justice (100% movement snare; druids and shamans might want this though)
    -- Priest
    [605] = "CC", -- Mind Control
    [64044] = "CC", -- Psychic Horror
    [8122] = "CC", -- Psychic Scream
    [9484] = "CC", -- Shackle Undead (works against Death Knights using Lichborne)
    [15487] = "Silence", -- Silence
    --[64058] = "Disarm",	-- Psychic Horror (duplicate debuff names not allowed atm, need to figure out how to support this later)
    [15407] = "Snare", -- Mind Flay
    -- Rogue
    [2094] = "CC", -- Blind
    [1833] = "CC", -- Cheap Shot
    [1776] = "CC", -- Gouge
    [408] = "CC", -- Kidney Shot
    [6770] = "CC", -- Sap
    [1330] = "Silence", -- Garrote - Silence
    [18425] = "Silence", -- Silenced - Improved Kick
    [51722] = "Disarm", -- Dismantle
    [31125] = "Snare", -- Blade Twisting
    [3409] = "Snare", -- Crippling Poison
    [26679] = "Snare", -- Deadly Throw
    -- Shaman
    [39796] = "CC", -- Stoneclaw Stun
    [51514] = "CC", -- Hex (although effectively a silence+disarm effect, it is conventionally thought of as a "CC", plus you can trinket out of it)
    [64695] = "Root", -- Earthgrab (Storm, Earth and Fire)
    [63685] = "Root", -- Freeze (Frozen Power)
    [3600] = "Snare", -- Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
    [8056] = "Snare", -- Frost Shock
    [8034] = "Snare", -- Frostbrand Attack
    -- Warlock
    [710] = "CC", -- Banish (works against Warlocks using Metamorphasis and Druids using Tree Form)
    [6789] = "CC", -- Death Coil
    [5782] = "CC", -- Fear
    [5484] = "CC", -- Howl of Terror
    [6358] = "CC", -- Seduction (Succubus)
    [30283] = "CC", -- Shadowfury
    [24259] = "Silence", -- Spell Lock (Felhunter)
    [18118] = "Snare", -- Aftermath
    [18223] = "Snare", -- Curse of Exhaustion
    -- Warrior
    [7922] = "CC", -- Charge Stun
    [12809] = "CC", -- Concussion Blow
    [20253] = "CC", -- Intercept (also Warlock Felguard ability)
    [5246] = "CC", -- Intimidating Shout
    [12798] = "CC", -- Revenge Stun
    [46968] = "CC", -- Shockwave
    [18498] = "Silence", -- Silenced - Gag Order
    [676] = "Disarm", -- Disarm
    [58373] = "Root", -- Glyph of Hamstring
    [23694] = "Root", -- Improved Hamstring
    [1715] = "Snare", -- Hamstring
    [12323] = "Snare", -- Piercing Howl
    -- Other
    [30217] = "CC", -- Adamantite Grenade
    [67769] = "CC", -- Cobalt Frag Bomb
    [30216] = "CC", -- Fel Iron Bomb
    [20549] = "CC", -- War Stomp
    [25046] = "Silence", -- Arcane Torrent
    [39965] = "Root", -- Frost Grenade
    [55536] = "Root", -- Frostweave Net
    [13099] = "Root", -- Net-o-Matic
    [29703] = "Snare", -- Dazed
}
-- priorities not applicable, but order in array is important (first found taken)
local pve_debuffs = {
    -- Immunities
    --[69127] = "Immune",	-- chill of the throne
    --rotface
    [73023] = "Immune", -- mutated infection
    --festergut
    [73020] = "Immune", -- vile gas
    [72103] = "Immune", -- inoculated
    --sindra
    [70126] = "Immune", -- frost beacon
    [70157] = "Immune", -- ice tomb
    [69762] = "Immune", -- unchained magic
    [69766] = "Immune", -- instability
    --valythria
    [70766] = "Immune", -- dream state
    [71941] = "Immune", -- twisted nightmares
    --deathbringer saurfang
    [72443] = "Immune", -- boiling blood
    --lady deathwhisper
    [71289] = "Immune", -- dominate mind
    [71237] = "Immune", -- curse of torpor
    --[71001] = "Immune",	-- death and decay
    --lord marrowgar
    [69065] = "Immune", -- impaled
}
-- priorities not applicable
local pvp_blacklisted = {
    --prof
    --[73117] = "Immune",	-- plague sickness
}
-- priorities not applicable
local global_blacklisted = {
    [26013] = "Immune", -- BG Deserter
    [25771] = "Immune", -- forbearance
    [57723] = "Immune", -- exhaustion
    [6788] = "Immune", -- weakened soul
}
-- priorities not applicable
local pve_blacklisted = {
    --prof
    --[73117] = "Immune",	-- plague sickness
    --sindra
    [71052] = "Immune", -- frost aura
}
local global_buffs = {
    [46924] = "Immune", -- Bladestorm (Warrior)
    [642] = "Immune", -- Divine Shield (Paladin)
    [45438] = "Immune", -- Ice Block (Mage)
    [34692] = "Immune", -- The Beast Within (Hunter)
    [31821] = "Immune", -- aura mastery
    [10278] = "Immune", -- BOP
    [1044] = "Root", -- FREEDOM
}

--for k, v in pairs(buffs1) do
--    local name = GetSpellInfo(k)
--    if name then
--        buffs[name] = v
--    end
--end

-- priority (the more the higher)
local buffTypePriority = {
    ["high"] = 10,
    ["Silence"] = 7,
    ["CC"] = 6,
    ["Immune"] = 5,
    ["Root"] = 4,
    ["Snare"] = 3,
    ["low"] = 1
}

local frame
local bar
local zonetype = 0

local GetTime = GetTime
local ipairs = ipairs
local GetSpellInfo = GetSpellInfo
local UnitDebuff = UnitDebuff
local UnitBuff = UnitBuff
local IsInInstance = IsInInstance
local GetRealZoneText = GetRealZoneText

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
        bar:SetPoint(WLoseControlDB.Position.point, UIParent, WLoseControlDB.Position.relativePoint, WLoseControlDB.Position.xOfs, WLoseControlDB.Position.yOfs)
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
    if WLoseControlDB.timer == true then
        bar.text:Show()
    else
        bar.text:Hide()
    end
end

local function WLoseControl_CreateBar()
    bar = CreateFrame("Frame", nil, UIParent)
    bar:SetMovable(true)
    bar:SetWidth(30)
    bar:SetHeight(30)
    bar:SetClampedToScreen(true)
    bar:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            self:StartMoving()
        end
    end)
    bar:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            self:StopMovingOrSizing()
            WLoseControl_SavePosition()
        end
    end)
    bar:Show()

    local _, _, spellicon = GetSpellInfo(642)
    local ability = { icon = spellicon, duration = 30 }

    local cd = CreateFrame("Cooldown", nil, bar)
    cd.noomnicc = true
    cd.noCooldownCount = true
    cd:SetAllPoints(true)
    cd:SetFrameStrata("MEDIUM")
    cd:SetReverse(true)
    cd:Hide()

    local texture = bar:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(true)
    texture:SetTexture(ability.icon)
    texture:SetTexCoord(0.07, 0.9, 0.07, 0.90)

    local text = cd:CreateFontString(nil, "ARTWORK")
    text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
    text:SetTextColor(1, 1, 0, 1)
    text:SetPoint("CENTER", bar, "CENTER", 2, 0)

    bar.texture = texture
    bar.text = text
    bar.duration = ability.duration
    bar.cd = cd

    WLoseControl_UpdateBar()
    WLoseControl_LoadPosition()
end

local function WLoseControl_UpdateText(cooldown)
    if cooldown > 60 then
        bar.text:SetText("")
    end
    if cooldown < 10 then
        if cooldown <= 0.1 then
            bar.text:SetText("")
        else
            bar.text:SetFormattedText("%1.1f", cooldown)
        end
    else
        bar.text:SetFormattedText("%d", cooldown)
    end
    if cooldown < 6 then
        bar.text:SetTextColor(1, 0, 0, 1)
    else
        bar.text:SetTextColor(1, 1, 0, 1)
    end
end

local function WLoseControl_StopAbility()
    if WLoseControlDB.hidden then
        bar:Hide()
    end
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
            frame:SetScript("OnUpdate", nil)
        else
            WLoseControl_UpdateText(bar.cooldown)
        end
        time = time - tttime
    end
end

local function WLoseControl_StartTimer(icon, expirationtime)
    if WLoseControlDB.hidden then
        bar:Show()
    end
    if expirationtime ~= 0 then
        local time1 = GetTime()
        bar.texture:SetTexture(icon)
        bar.duration = expirationtime - time1
        bar.cd:Show()
        bar.cd:SetReverse(true)
        bar.cd:SetCooldown(time1 - 0.40, bar.duration)
        bar.start = time1
        if WLoseControlDB.timer == true then
            WLoseControl_UpdateText(bar.duration)
        end

        frame:SetScript("OnUpdate", WLoseControl_OnUpdate)
    else
        bar.texture:SetTexture(icon)
        bar.cd:Show()
        bar.cd:SetReverse(false)
    end
end

local function WLoseControl_ResetAllTimers()
    WLoseControl_StopAbility()
end

--local global_spell_name
local global_expiration_time = 0
local global_spell_id = 0

local function WLoseControl_UNIT_AURA(affectedUnit)
    if affectedUnit ~= "player" then
        return
    end

    --local local_spell_name
    local local_duration = 0
    local local_icon
    local local_expiration_time = 0
    local local_spell_id
    local local_shouldConsolidate = 1

    -- debuffs checking
    for i = 1, 40 do
        local name, _, icon, _, dtype, duration, expirationtime, ucaster, _, shouldConsolidate, sid = UnitDebuff(affectedUnit, i)
        if not sid then
            break
        end
        if shouldConsolidate == nil then
            shouldConsolidate = 0
        end

        if zonetype == 1 then
            --PVE (party , raid)
            -- using first found pve aura!
            if pve_debuffs[sid] then
                local_spell_id = sid
                local_icon = icon
                local_duration = duration
                local_expiration_time = expirationtime
                local_shouldConsolidate = shouldConsolidate
                break

                -- or display any other if not black listed
            elseif not global_blacklisted[sid] and not pve_blacklisted[sid] then
                -- using shouldConsolidate as a trash filter (don t know if it can be 1 on debuffs though)
                if shouldConsolidate <= local_shouldConsolidate then
                    local_spell_id = sid
                    local_icon = icon
                    local_duration = duration
                    local_expiration_time = expirationtime
                    local_shouldConsolidate = shouldConsolidate
                end

                -- log new unknown pve auras
                if sid ~= global_spell_id then
                    if global_debug == 1 then
                        if not WLoseControlDB.PVEauras[sid] then
                            local temp = GetRealZoneText()
                            WLoseControlDB.PVEauras[sid] = temp .. " : " .. name .. " - " .. tostring(dtype) .. " - " .. tostring(duration) .. " - " .. tostring(shouldConsolidate);
                        end
                    end
                end
            end

        elseif zonetype == 2 then
            --PVP (arena, pvp aka bg, none aka outworld)
            if (
                    not global_blacklisted[sid] and not pvp_blacklisted[sid] and (
                            -- among listed
                            pvp_debuffs[sid] and (
                                    -- first listed found
                                    not pvp_debuffs[local_spell_id]
                                            -- has higher priority
                                            or buffTypePriority[pvp_debuffs[sid]] > buffTypePriority[pvp_debuffs[local_spell_id]]
                                            -- same priority but longer duration (for example two stuns and second is longer)
                                            or buffTypePriority[pvp_debuffs[local_spell_id]] == buffTypePriority[pvp_debuffs[sid]] and expirationtime > local_expiration_time
                            )
                                    -- first found
                                    or not local_spell_id
                                    -- choosing between already found and not listed
                                    -- using shouldConsolidate as a trash filter (don t know if it can be 1 on debuffs though)
                                    or not pvp_debuffs[local_spell_id] and shouldConsolidate <= local_shouldConsolidate
                    )
            )
            then
                local_spell_id = sid
                local_icon = icon
                local_duration = duration
                local_expiration_time = expirationtime
                local_shouldConsolidate = shouldConsolidate

                -- log new unknown pvp aura
                if not pvp_debuffs[sid] and global_debug == 1 then
                    local temp_zone_type
                    _, temp_zone_type = IsInInstance()
                    -- not including levelling and other world spells trash
                    if temp_zone_type ~= "none" and not WLoseControlDB.PVPauras[sid] then
                        local temp = GetRealZoneText()
                        WLoseControlDB.PVPauras[sid] = temp .. " : " .. name .. " - " .. tostring(dtype) .. " - " .. tostring(duration) .. " - " .. tostring(shouldConsolidate);
                    end
                end
            end
        end
    end

    -- if no debuffs check buffs
    if not local_spell_id then
        for i = 1, 40 do
            local name, _, icon, _, _, duration, expirationtime, _, _, shouldConsolidate, sid = UnitBuff(affectedUnit, i)
            if not sid then
                break
            end
            if shouldConsolidate == nil then
                shouldConsolidate = 0
            end

            if (
                    -- among listed
                    global_buffs[sid] and (
                            -- first listed found
                            not global_buffs[local_spell_id]
                                    -- has higher priority
                                    or buffTypePriority[global_buffs[sid]] > buffTypePriority[global_buffs[local_spell_id]]
                                    -- same priority but longer duration (for example two stuns and second is longer)
                                    or buffTypePriority[global_buffs[local_spell_id]] == buffTypePriority[global_buffs[sid]] and expirationtime > local_expiration_time
                    )
                    -- not spamming any buff

                    -- first found
                    --or not local_spell_id
                    -- choosing between already found and not listed
                    -- using shouldConsolidate as a trash filter (don t know if it can be 1 on debuffs though)
                    --or not buffs[local_spell_id] and shouldConsolidate <= local_shouldConsolidate
            )
            then
                local_spell_id = sid
                local_icon = icon
                local_duration = duration
                local_expiration_time = expirationtime
                local_shouldConsolidate = shouldConsolidate
            else
                if global_debug == 1 then
                    local temp_zone_type
                    _, temp_zone_type = IsInInstance()
                    -- not including levelling and other world spells trash
                    if temp_zone_type ~= "none" and not WLoseControlDB.BuffAuras[sid] then
                        local temp = GetRealZoneText()
                        WLoseControlDB.BuffAuras[sid] = temp .. " : " .. name .. " - " .. tostring(dtype) .. " - " .. tostring(duration) .. " - " .. tostring(shouldConsolidate);
                    end
                end
            end
        end
    end

    -- setting global wLoseControl frame parameters
    if local_duration > 0 then
        if local_spell_id ~= global_spell_id or local_expiration_time ~= global_expiration_time then
            global_spell_id = local_spell_id
            global_expiration_time = local_expiration_time
            WLoseControl_StartTimer(local_icon, local_expiration_time)
        end
        --elseif local_duration <= 0 then
        --    global_spell_id = ""
        --    global_expiration_time = 0
        --    WLoseControl_StopAbility()
    end

end

local function WLoseControl_PLAYER_ENTERING_WORLD(self)
    WLoseControl_ResetAllTimers()

    local _, instanceType = IsInInstance()
    if (instanceType == "party" or instanceType == "raid") then
        zonetype = 1
    else
        zonetype = 2
    end
end

local function WLoseControl_Reset()
    WLoseControlBarDB = { scale = 2, timer = true, hidden = false, lock = false }
    WLoseControl_UpdateBar()
    WLoseControl_LoadPosition()
end

local function WLoseControl_Test()
    local _, _, icon = GetSpellInfo(1044)
    local expiration = 30 + GetTime()
    WLoseControl_StartTimer(icon, expiration)
end

local cmdfuncs = {
    scale = function(v)
        WLoseControlDB.scale = v;
        WLoseControl_UpdateBar()
    end,
    hidden = function()
        WLoseControlDB.hidden = not WLoseControlDB.hidden;
        WLoseControl_UpdateBar()
    end,
    lock = function()
        WLoseControlDB.lock = not WLoseControlDB.lock;
        WLoseControl_UpdateBar()
    end,
    clear = function()
        count = #WLoseControlDB.PVPauras
        for i = 0, count do
            WLoseControlDB.PVPauras[i] = nil
        end
        count = #WLoseControlDB.PVEauras
        for i = 0, count do
            WLoseControlDB.PVEauras[i] = nil
        end
    end,
    timer = function()
        WLoseControlDB.timer = not WLoseControlDB.timer
        WLoseControl_UpdateBar()
    end,
    reset = function()
        WLoseControl_Reset()
    end,
    test = function()
        WLoseControl_Test()
    end,
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
        SELECTED_CHAT_FRAME:AddMessage("WLoseControl Options | /wlc <option>", 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- scale <number> | value: " .. WLoseControlDB.scale, 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- hidden (toggle) | value: " .. tostring(WLoseControlDB.hidden), 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- lock (toggle) | value: " .. tostring(WLoseControlDB.lock), 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- timer (toggle) | value: " .. tostring(WLoseControlDB.timer), 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- clear (execute) | clear gathered spell ids debug lists", 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- test (execute)", 0, 1, 0)
        SELECTED_CHAT_FRAME:AddMessage("-- reset (execute)", 0, 1, 0)
    end
end

local function WLoseControl_OnLoad(self)
    if not WLoseControlDB.scale then
        WLoseControlDB.scale = 2
    end
    if not WLoseControlDB.hidden then
        WLoseControlDB.hidden = false
    end
    if not WLoseControlDB.lock then
        WLoseControlDB.lock = false
    end
    if not WLoseControlDB.timer then
        WLoseControlDB.timer = true
    end
    if not WLoseControlDB.PVPauras then
        WLoseControlDB.PVPauras = {}
    end
    if not WLoseControlDB.PVEauras then
        WLoseControlDB.PVEauras = {}
    end
    if not WLoseControlDB.BuffAuras then
        WLoseControlDB.BuffAuras = {}
    end
    WLoseControl_CreateBar()

    SlashCmdList["WLoseControl"] = WLoseControl_Command
    SLASH_WLoseControl1 = "/wlc"

    DEFAULT_CHAT_FRAME:AddMessage("WLoseControl loaded. Type /wlc for options.", 0, 1, 0)

    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("UNIT_AURA")
    WLoseControl_PLAYER_ENTERING_WORLD(self)
end

local eventhandler = {
    ["UNIT_AURA"] = function(self, ...)
        WLoseControl_UNIT_AURA(...)
    end,
    ["VARIABLES_LOADED"] = function(self)
        WLoseControl_OnLoad(self)
    end,
    ["PLAYER_ENTERING_WORLD"] = function(self)
        WLoseControl_PLAYER_ENTERING_WORLD(self)
    end,
}

local function WLoseControl_OnEvent(self, event, ...)
    eventhandler[event](self, ...)
end

frame = CreateFrame("Frame", nil, UIParent)
frame:SetScript("OnEvent", WLoseControl_OnEvent)
frame:RegisterEvent("VARIABLES_LOADED")
