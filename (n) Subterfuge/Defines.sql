UPDATE Defines SET VALUE = 0 WHERE NAME = 'ESPIONAGE_SECURITY_NOT_ALL_HAVE_SPIES';
UPDATE Defines SET VALUE = -2 WHERE NAME = 'ESPIONAGE_SECURITY_PER_TRADE_ROUTE';
UPDATE Defines SET VALUE = 0 WHERE NAME = 'ESPIONAGE_SECURITY_PREVIOUS_CITY_MISSIONS';  -- anti dogpile unnecessary with new mechanics imo

UPDATE Defines SET VALUE = 100 WHERE NAME = 'BALANCE_SPY_POINT_THRESHOLD_MIN';
UPDATE Defines SET VALUE = 100 WHERE NAME = 'BALANCE_SPY_POINT_THRESHOLD_MAX';

UPDATE Defines SET VALUE = 0 WHERE NAME = 'ESPIONAGE_NP_PER_TECHNOLOGY_BEHIND';

-- this makes it so you have a % security. 100% security is no NP
UPDATE Defines SET VALUE = 20 WHERE NAME = 'ESPIONAGE_SECURITY_BASE'; -- was 10
UPDATE Defines SET VALUE = 100 WHERE NAME = 'ESPIONAGE_MAX_NUM_SECURITY_POINTS';  -- was 50
UPDATE Defines SET VALUE = 100 WHERE NAME = 'ESPIONAGE_NP_REDUCTION_PER_SECURITY_POINT';  -- divided by 100: Percentage Reduction of Network Points per Security Point (was 160)

-- because security is meant to be active to some extent, base points need to go up
UPDATE Defines SET VALUE = 50 WHERE NAME = 'ESPIONAGE_NP_BASE';
UPDATE Defines SET VALUE = 15 WHERE NAME = 'ESPIONAGE_NP_CULTURAL_INFLUENCE';

UPDATE Eras SET
SpiesGrantedForPlayer = 0,
SpiesGrantedForEveryone = 0;

UPDATE Defines SET VALUE = 10 WHERE NAME = 'ESPIONAGE_SPY_POINT_UNIT';
UPDATE Policies SET FreeSpy = FreeSpy * 10 WHERE FreeSpy > 0;
UPDATE Buildings SET ExtraSpies = ExtraSpies * 10 WHERE ExtraSpies > 0;
UPDATE Traits SET ExtraSpies = ExtraSpies * 10 WHERE ExtraSpies > 0;
