----------------------------------------------
-- Summer Palace
----------------------------------------------
UPDATE Language_ko_KR SET Text = '도시 국가와 외교 임무를 수행할 때 [ICON_INFLUENCE]영향력 +15를 부여합니다.' WHERE Tag = 'TXT_KEY_PROMOTION_NOBILITY_HELP';
UPDATE Language_ko_KR SET Text = '도시 국가와 외교 임무를 수행할 때 [ICON_INFLUENCE]영향력 +10을 부여합니다.' WHERE Tag = 'TXT_KEY_PROMOTION_IMMUNITY_HELP';
----------------------------------------------------
-- Text (ko_KR)
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- 임플란트
('TXT_KEY_PROMOTION_FW_IMPLANTS_I', '임플란트 I'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_I_HELP', '[ICON_STRENGTH] 전투력 +8%'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_II', '임플란트 II'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_II_HELP', '[ICON_STRENGTH] 전투력 +10%'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_III', '임플란트 III'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_III_HELP', '[ICON_STRENGTH] 전투력 +12%');