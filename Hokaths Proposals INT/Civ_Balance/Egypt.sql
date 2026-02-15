UPDATE Language_ko_KR SET
Text = Replace(Text, '[ICON_VP_ARTIFACT] Artifacts gain +5 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture, and Landmarks gain +5 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism.', '')
WHERE Tag = 'TXT_KEY_TRAIT_WONDER_BUILDER';

UPDATE Language_ko_KR SET
Text = Text || ' [ICON_CITIZEN_RED] Labourers generate +1 [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag = 'TXT_KEY_TRAIT_WONDER_BUILDER';