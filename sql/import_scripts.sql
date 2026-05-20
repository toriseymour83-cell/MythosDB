-- MythosDB import script
-- Update the file paths before running locally.

-- Recommended import order:
-- 1. authors
-- 2. works
-- 3. locations
-- 4. characters
-- 5. relationship_types
-- 6. character_appearances
-- 7. relationships
-- 8. events
-- 9. event_characters
-- 10. character_aliases
-- 11. work_locations
-- 12. sources
-- 13. source_references
-- 14. crimes_and_punishments

COPY authors
FROM '/path/to/MythosDB/data/authors.csv'
WITH (FORMAT csv, HEADER true);

COPY works
FROM '/path/to/MythosDB/data/works.csv'
WITH (FORMAT csv, HEADER true);

COPY locations
FROM '/path/to/MythosDB/data/locations.csv'
WITH (FORMAT csv, HEADER true);

COPY characters
FROM '/path/to/MythosDB/data/characters.csv'
WITH (FORMAT csv, HEADER true);

COPY relationship_types
FROM '/path/to/MythosDB/data/relationship_types.csv'
WITH (FORMAT csv, HEADER true);

COPY character_appearances
FROM '/path/to/MythosDB/data/character_appearances.csv'
WITH (FORMAT csv, HEADER true);

COPY relationships
FROM '/path/to/MythosDB/data/relationships.csv'
WITH (FORMAT csv, HEADER true);

COPY events
FROM '/path/to/MythosDB/data/events.csv'
WITH (FORMAT csv, HEADER true);

COPY event_characters
FROM '/path/to/MythosDB/data/event_characters.csv'
WITH (FORMAT csv, HEADER true);

COPY character_aliases
FROM '/path/to/MythosDB/data/character_aliases.csv'
WITH (FORMAT csv, HEADER true);

COPY work_locations
FROM '/path/to/MythosDB/data/work_locations.csv'
WITH (FORMAT csv, HEADER true);

COPY sources
FROM '/path/to/MythosDB/data/sources.csv'
WITH (FORMAT csv, HEADER true);

COPY source_references
FROM '/path/to/MythosDB/data/source_references.csv'
WITH (FORMAT csv, HEADER true);

COPY crimes_and_punishments
FROM '/path/to/MythosDB/data/crimes_and_punishments.csv'
WITH (FORMAT csv, HEADER true);
