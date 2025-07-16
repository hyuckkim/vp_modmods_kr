--==========================================================================================================================
-- COUNCILLORS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Councillors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Councillors
		(Type,					            Description,                                Help,										UnitClassType,					FlavourType,					PolicyType)
VALUES	('COUNCILLOR_JFD_LAW',  			'TXT_KEY_COUNCILLOR_JFD_LAW_DESC',          'TXT_KEY_COUNCILLOR_JFD_LAW_HELP',	        'UNITCLASS_WRITER',				'FLAVOR_EXPANSION',				'POLICY_COUNCILLOR_JFD_LAW'),
   		('COUNCILLOR_JFD_DIPLOMACY',		'TXT_KEY_COUNCILLOR_JFD_DIPLOMACY_DESC',    'TXT_KEY_COUNCILLOR_JFD_DIPLOMACY_HELP',	'UNITCLASS_GREAT_DIPLOMAT',		'FLAVOR_DIPLOMACY',				'POLICY_COUNCILLOR_JFD_DIPLOMACY'),
   		('COUNCILLOR_JFD_ECONOMY',			'TXT_KEY_COUNCILLOR_JFD_ECONOMY_DESC',      'TXT_KEY_COUNCILLOR_JFD_ECONOMY_HELP',      'UNITCLASS_MERCHANT',			'FLAVOR_GOLD',					'POLICY_COUNCILLOR_JFD_ECONOMY'),
		('COUNCILLOR_JFD_INDUSTRY',	    	'TXT_KEY_COUNCILLOR_JFD_INDUSTRY_DESC',     'TXT_KEY_COUNCILLOR_JFD_INDUSTRY_HELP',	    'UNITCLASS_ENGINEER',			'FLAVOR_PRODUCTION',			'POLICY_COUNCILLOR_JFD_INDUSTRY'),
		('COUNCILLOR_JFD_EDUCATION',		'TXT_KEY_COUNCILLOR_JFD_EDUCATION_DESC',    'TXT_KEY_COUNCILLOR_JFD_EDUCATION_HELP',	'UNITCLASS_SCIENTIST',			'FLAVOR_SCIENCE',				'POLICY_COUNCILLOR_JFD_EDUCATION'),
		('COUNCILLOR_JFD_MILITARY',			'TXT_KEY_COUNCILLOR_JFD_MILITARY_DESC',     'TXT_KEY_COUNCILLOR_JFD_MILITARY_HELP',	    'UNITCLASS_GREAT_GENERAL',		'FLAVOR_MILITARY_TRAINING',		'POLICY_COUNCILLOR_JFD_MILITARY'),
        ('COUNCILLOR_JFD_RELIGION',			'TXT_KEY_COUNCILLOR_JFD_RELIGION_DESC',     'TXT_KEY_COUNCILLOR_JFD_RELIGION_HELP',		'UNITCLASS_PROPHET',			'FLAVOR_RELIGION',				'POLICY_COUNCILLOR_JFD_RELIGION'),
		('COUNCILLOR_JFD_SOCIETY',			'TXT_KEY_COUNCILLOR_JFD_SOCIETY_DESC',      'TXT_KEY_COUNCILLOR_JFD_SOCIETY_HELP',		'UNITCLASS_MUSICIAN',			'FLAVOR_CULTURE',				'POLICY_COUNCILLOR_JFD_SOCIETY'),
  		('COUNCILLOR_JFD_WELFARE',			'TXT_KEY_COUNCILLOR_JFD_WELFARE_DESC',      'TXT_KEY_COUNCILLOR_JFD_WELFARE_HELP',      'UNITCLASS_ARTIST',				'FLAVOR_GROWTH',				'POLICY_COUNCILLOR_JFD_WELFARE');
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies
		(Type,													Description)
VALUES	('POLICY_COUNCILLOR_JFD_DIPLOMACY',	                	'TXT_KEY_UNIT_GREAT_DIPLOMAT'),
		('POLICY_COUNCILLOR_JFD_WELFARE',	            		'TXT_KEY_UNIT_GREAT_ARTIST'),
		('POLICY_COUNCILLOR_JFD_SOCIETY',			            'TXT_KEY_UNIT_GREAT_MUSICIAN'),
		('POLICY_COUNCILLOR_JFD_LAW',			                'TXT_KEY_UNIT_GREAT_WRITER'),
		('POLICY_COUNCILLOR_JFD_INDUSTRY',		                'TXT_KEY_UNIT_GREAT_ENGINEER'),
		('POLICY_COUNCILLOR_JFD_MILITARY',	            		'TXT_KEY_UNIT_GREAT_GENERAL'),
		('POLICY_COUNCILLOR_JFD_RELIGION',		                'TXT_KEY_UNIT_GREAT_PROPHET'),
   		('POLICY_COUNCILLOR_JFD_ECONOMY',	                	'TXT_KEY_UNIT_GREAT_MERCHANT'),
		('POLICY_COUNCILLOR_JFD_EDUCATION',	        	        'TXT_KEY_UNIT_GREAT_SCIENTIST');
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_JFD_SovereigntyMods
		(PolicyType,											ReformBranchType,				ReformCostMod)
VALUES	('POLICY_COUNCILLOR_JFD_INDUSTRY',	                	'REFORM_BRANCH_JFD_INDUSTRY',	-15),
		('POLICY_COUNCILLOR_JFD_RELIGION',		                'REFORM_BRANCH_JFD_RELIGION',	-15),
		('POLICY_COUNCILLOR_JFD_WELFARE',           			'REFORM_BRANCH_JFD_WELFARE',	-15),
		('POLICY_COUNCILLOR_JFD_SOCIETY',	            		'REFORM_BRANCH_JFD_SOCIETY',	-15),
		('POLICY_COUNCILLOR_JFD_LAW',               			'REFORM_BRANCH_JFD_LAW',		-15),
		('POLICY_COUNCILLOR_JFD_DIPLOMACY',             		'REFORM_BRANCH_JFD_DIPLOMACY',	-15),
		('POLICY_COUNCILLOR_JFD_MILITARY',	            		'REFORM_BRANCH_JFD_MILITARY',	-15),
		('POLICY_COUNCILLOR_JFD_ECONOMY',		                'REFORM_BRANCH_JFD_ECONOMY',	-15),
		('POLICY_COUNCILLOR_JFD_EDUCATION',     		        'REFORM_BRANCH_JFD_EDUCATION',	-15);
--==========================================================================================================================
--==========================================================================================================================
