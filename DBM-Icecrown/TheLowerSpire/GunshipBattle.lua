local mod	= DBM:NewMod("GunshipBattle", "DBM-Icecrown", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1799 $"):sub(12, -3))

if UnitFactionGroup("player") == "Alliance" then
	mod:RegisterCombat("yell", L.PullAlliance)
	mod:RegisterKill("yell", L.KillAlliance)
	mod:SetCreatureID(37215)	-- Orgrim's Hammer
else
	mod:RegisterCombat("yell", L.PullHorde)
	mod:RegisterKill("yell", L.KillHorde)
	mod:SetCreatureID(37540)	-- The Skybreaker
end
mod:SetMinCombatTime(50)	

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS"
)

local warnBelowZero			= mod:NewSpellAnnounce(69705, 3)
local warnExperienced		= mod:NewTargetAnnounce(71188, 1, nil, false)		-- might be spammy
local warnVeteran			= mod:NewTargetAnnounce(71193, 2, nil, false)		-- might be spammy
local warnElite				= mod:NewTargetAnnounce(71195, 3, nil, false)		-- might be spammy
local warnBattleFury		= mod:NewAnnounce("WarnBattleFury", 3, nil, false)	-- might be spammy
local warnBladestorm		= mod:NewSpellAnnounce(69652, 2, nil, false)		-- might be spammy
local warnWoundingStrike	= mod:NewTargetAnnounce(69651, 3)

local timerCombatStart		= mod:NewTimer(45, "TimerCombatStart")			-- Check accuracy
local timerBelowZeroCD		= mod:NewCDTimer(35, 69705)
local timerBattleFuryActive	= mod:NewBuffActiveTimer(20, 72306)

function mod:OnCombatStart(delay)
	timerCombatStart:Show(-delay)
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(71195) then
		warnElite:Show(args.destName)
	elseif args:IsSpellID(71193) then
		warnVeteran:Show(args.destName)
	elseif args:IsSpellID(71188) then
		warnExperienced:Show(args.destName)
	elseif args:IsSpellID(69652) then
		warnBladestorm:Show()			
	elseif args:IsSpellID(69651) then
		warnWoundingStrike:Show(args.destName)
	elseif args:IsSpellID(72306, 69638) and ((UnitFactionGroup("player") == "Alliance" and mod:GetCIDFromGUID(args.destGUID) == 36939) or (UnitFactionGroup("player") == "Horde" and mod:GetCIDFromGUID(args.destGUID) == 37200)) then
		timerBattleFuryActive:Start()		-- only a timer for 1st stack
	end
end

function mod:SPELL_AURA_APPLIED_DOSE(args)
	if args:IsSpellID(72306, 69638) and ((UnitFactionGroup("player") == "Alliance" and mod:GetCIDFromGUID(args.destGUID) == 36939) or (UnitFactionGroup("player") == "Horde" and mod:GetCIDFromGUID(args.destGUID) == 37200)) then
		if args.amount % 10 == 0 or (args.amount >= 20 and args.amount % 5 == 0) then		-- warn every 10th stack and every 5th stack if more than 20
			warnBattleFury:Show(GetSpellInfo(72306), args.amount or 1)
		end
		timerBattleFuryActive:Start()
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(69705) then
		timerBelowZeroCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(69705) then
		warnBelowZero:Show(args.destName)
	end
end
