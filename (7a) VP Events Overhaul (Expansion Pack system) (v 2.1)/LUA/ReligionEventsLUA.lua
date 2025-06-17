--------------------------------------------------------------
-- Dummy Policy Creator for Religious Events
--------------------------------------------------------------

local ePilgrimageBelief = GameInfoTypes.BELIEF_PILGRIMAGE
local eCeremonialBurialBelief = GameInfoTypes.BELIEF_CEREMONIAL_BURIAL
local eCouncilofEldersBelief = GameInfoTypes.BELIEF_PAPAL_PRIMACY
local eHeroWorshipBelief = GameInfoTypes.BELIEF_INTERFAITH_DIALOGUE
local eHolyLawBelief = GameInfoTypes.BELIEF_CHURCH_PROPERTY
local eDivineInheritanceBelief = GameInfoTypes.BELIEF_PEACE_LOVING
local eTheocraticRuleBelief = GameInfoTypes.BELIEF_WORLD_CHURCH
local eRevelationBelief = GameInfoTypes.BELIEF_TITHE
local eTranscendentThoughtsBelief = GameInfoTypes.BELIEF_INITIATION_RITES

local ePilgrimageDummyPolicy = GameInfoTypes.POLICY_PILGRIMAGE_DUMMY
local eCeremonialBurialDummyPolicy = GameInfoTypes.POLICY_CEREMONIAL_BURIAL_DUMMY
local eCouncilofEldersDummyPolicy = GameInfoTypes.POLICY_PAPAL_PRIMACY_DUMMY
local eHeroWorshipDummyPolicy = GameInfoTypes.POLICY_INTERFAITH_DIALOGUE_DUMMY
local eHolyLawDummyPolicy = GameInfoTypes.POLICY_CHURCH_PROPERTY_DUMMY
local eDivineInheritanceDummyPolicy = GameInfoTypes.POLICY_PEACE_LOVING_DUMMY
local eTheocraticRuleDummyPolicy = GameInfoTypes.POLICY_WORLD_CHURCH_DUMMY
local eRevelationDummyPolicy = GameInfoTypes.POLICY_TITHE_DUMMY
local eTranscendentThoughtsDummyPolicy = GameInfoTypes.POLICY_INITIATION_RITES_DUMMY

local tBeliefPolicy = {
    [ePilgrimageBelief] = ePilgrimageDummyPolicy,
    [eCeremonialBurialBelief] = eCeremonialBurialDummyPolicy,
    [eCouncilofEldersBelief] = eCouncilofEldersDummyPolicy,
    [eHeroWorshipBelief] = eHeroWorshipDummyPolicy,
    [eHolyLawBelief] = eHolyLawDummyPolicy,
    [eDivineInheritanceBelief] = eDivineInheritanceDummyPolicy,
    [eTheocraticRuleBelief] = eTheocraticRuleDummyPolicy,
    [eRevelationBelief] = eRevelationDummyPolicy,
    [eTranscendentThoughtsBelief] = eTranscendentThoughtsDummyPolicy,
}

function OnReligionFoundDummy(ePlayer, eHolyCity, eReligion, eBelief1, eBelief2, eBelief3, eBelief4, eBelief5)

    local pPlayer = Players[ePlayer]
    local tOwnedBelief = {eBelief1, eBelief2, eBelief3, eBelief4, eBelief5}

--------------------------------------------------------------
-- Shuffling the owned beliefs so Byzantium is randomized
--------------------------------------------------------------
    for i = 1, 4 do
        local r = math.random(i, 5)
         tOwnedBelief[i],  tOwnedBelief[r] =  tOwnedBelief[r],  tOwnedBelief[i]
    end

    for _, eOwnedBelief in tOwnedBelief do
        for eBelief, ePolicy in tBeliefPolicy do
            if eOwnedBelief == eBelief then
                pPlayer:GrantPolicy(ePolicy, true)
                -- Log for validation
                if pPlayer:HasPolicy(ePolicy) then
                    sPolicyName = Locale.ConvertTextKey(GameInfo.Policies[ePolicy].Description)
                    print(sPolicyName .. " is active")
                    return  -- Added the return to jump out of the function for Byzantium
                end
            end
        end
    end
end

GameEvents.ReligionFounded.Add(OnReligionFoundDummy)