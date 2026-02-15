-- this is needed for the lua around great sage
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';

-- DiploModifiers
--------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_DIPLO_MODIFIERS';
INSERT INTO DiploModifiers (Type, Description)
SELECT 'DIPLOMODIFIER_GREATSAGE', 'TXT_KEY_SPECIFIC_DIPLOMODIFIER_GREATSAGE';
INSERT INTO Language_ko_KR    (Tag, Text)
VALUES    ('TXT_KEY_SPECIFIC_DIPLOMODIFIER_GREATSAGE', '[COLOR_NEGATIVE_TEXT]그들은 여러분의 종교가 세계를 지배하려고 음모를 꾸미고 있다고 믿습니다![ENDCOLOR]');