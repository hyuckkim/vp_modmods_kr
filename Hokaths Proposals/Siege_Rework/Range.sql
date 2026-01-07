-- part I
-- siege dont get the range promo anymore
UPDATE UnitPromotions SET PromotionPrereqOr2 = NULL WHERE Type = 'PROMOTION_RANGE';

DELETE FROM UnitPromotions_UnitCombats WHERE 
PromotionType = 'PROMOTION_RANGE' AND UnitCombatType = 'UNICOMBAT_SIEGE';

-- bazooka shouldnt outrange them
UPDATE Units SET
Range = 2
WHERE Class = 'UNITCLASS_BAZOOKA';

-- instead they get repair, which is currently deprecated
-- could just do march but where is the fun in that?
-- we might want to add other effects to it independently, like this:
UPDATE UnitPromotions SET 
PromotionPrereqOr1 = 'PROMOTION_SIEGE_3',
PromotionPrereqOr2 = NULL,
FriendlyHealChange = 5, 
NeutralHealChange = 5, 
EnemyHealChange = 5,
CannotBeChosen = 0,
MaxHitPointsChange = 20,
Help = 'TXT_KEY_PROMOTION_SIEGE_REPAIR_HELP'
WHERE Type = 'PROMOTION_REPAIR';

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_REPAIR', 'UNITCOMBAT_SIEGE');

INSERT INTO Language_en_US 
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_SIEGE_REPAIR_HELP', 'Unit will [COLOR_POSITIVE_TEXT]Heal Every Turn[ENDCOLOR], even if it performs an action.[NEWLINE]+20 HP and +5 HP when [COLOR_POSITIVE_TEXT]Healing[ENDCOLOR].');	

-- inherent range increases
--UPDATE Units SET
--Range = 3
--WHERE CombatClass = 'UNITCOMBAT_SIEGE' AND Class != 'UNITCLASS_SIEGE_TOWER';

--UPDATE Units SET
--Range = 4
--WHERE Class IN ('UNITCLASS_ROCKET_ARTILLERY', 'UNITCLASS_ARTILLERY');
-- this leads to very high fatality rate in combat, which is interesting
-- perhaps makes it too hard to defend tho