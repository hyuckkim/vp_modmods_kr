--==========================================================================================================================
--Songhai
--==========================================================================================================================
---------------------
--UA nerf
---------------------
UPDATE Traits
SET FasterAlongRiver = '0'
WHERE Type = 'TRAIT_AMPHIB_WARLORD';
--------------------------------
-- GameText Update
--------------------------------

UPDATE Language_en_US
SET Text = 'Triple [ICON_GOLD] Gold from pillaging Encampments and Cities. Land Units gain the [COLOR_POSITIVE_TEXT]Amphibious[ENDCOLOR] Promotion. Rivers create [ICON_CONNECTED] City Connections.'
WHERE Tag = 'TXT_KEY_TRAIT_AMPHIB_WARLORD';