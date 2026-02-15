-- this is needed for the lua around great sage
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';

-- DiploModifiers
--------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_DIPLO_MODIFIERS';
INSERT INTO DiploModifiers (Type, Description)
SELECT 'DIPLOMODIFIER_GREATSAGE', 'TXT_KEY_SPECIFIC_DIPLOMODIFIER_GREATSAGE';
INSERT INTO Language_en_US    (Tag, Text)
VALUES    ('TXT_KEY_SPECIFIC_DIPLOMODIFIER_GREATSAGE', '[COLOR_NEGATIVE_TEXT]They believe your religion is conspiring to take over the world![ENDCOLOR]');
