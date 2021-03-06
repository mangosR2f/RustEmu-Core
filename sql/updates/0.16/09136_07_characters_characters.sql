ALTER TABLE character_db_version CHANGE COLUMN required_9136_03_characters_character_ticket required_9136_07_characters_characters bit;

UPDATE characters SET data = REPLACE(data,'  ',' ');
UPDATE characters SET data = CONCAT(TRIM(data),' ');

UPDATE `characters` SET `data` = CONCAT(
    SUBSTRING_INDEX(`data`, ' ', 161 + 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 1), ' ', -165 + 162 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4 + 1), ' ', -165 - 4 + 162 + 4 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*2 + 1), ' ', -165 - 4*2 + 162 + 4*2 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*3 + 1), ' ', -165 - 4*3 + 162 + 4*3 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*4 + 1), ' ', -165 - 4*4 + 162 + 4*4 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*5 + 1), ' ', -165 - 4*5 + 162 + 4*5 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*6 + 1), ' ', -165 - 4*6 + 162 + 4*6 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*7 + 1), ' ', -165 - 4*7 + 162 + 4*7 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*8 + 1), ' ', -165 - 4*8 + 162 + 4*8 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*9 + 1), ' ', -165 - 4*9 + 162 + 4*9 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*10 + 1), ' ', -165 - 4*10 + 162 + 4*10 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*11 + 1), ' ', -165 - 4*11 + 162 + 4*11 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*12 + 1), ' ', -165 - 4*12 + 162 + 4*12 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*13 + 1), ' ', -165 - 4*13 + 162 + 4*13 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*14 + 1), ' ', -165 - 4*14 + 162 + 4*14 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*15 + 1), ' ', -165 - 4*15 + 162 + 4*15 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*16 + 1), ' ', -165 - 4*16 + 162 + 4*16 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*17 + 1), ' ', -165 - 4*17 + 162 + 4*17 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*18 + 1), ' ', -165 - 4*18 + 162 + 4*18 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*19 + 1), ' ', -165 - 4*19 + 162 + 4*19 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*20 + 1), ' ', -165 - 4*20 + 162 + 4*20 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*21 + 1), ' ', -165 - 4*21 + 162 + 4*21 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*22 + 1), ' ', -165 - 4*22 + 162 + 4*22 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 165 + 4*23 + 1), ' ', -165 - 4*23 + 162 + 4*23 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 298 + 1), ' ', -298 + 162 + 4*24 - 1), ' ',
    '0 ',
    SUBSTRING_INDEX(SUBSTRING_INDEX(`data`, ' ', 1300 + 1), ' ', -1300 + 299 - 1), ' '
    )
WHERE length(SUBSTRING_INDEX(data, ' ', 1300)) < length(data) and length(SUBSTRING_INDEX(data, ' ', 1300+1)) >= length(data);

UPDATE characters SET data = REPLACE(data,'  ',' ');
UPDATE characters SET data = CONCAT(TRIM(data),' ');
