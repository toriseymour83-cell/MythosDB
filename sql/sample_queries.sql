-- MythosDB sample queries
-- These are designed for SQL practice after importing the CSV files.

-- 1. Show all works with their authors

SELECT
    w.title,
    a.name AS author,
    w.genre,
    w.estimated_date,
    w.source_culture
FROM works w
LEFT JOIN authors a
    ON w.author_id = a.author_id
ORDER BY
    a.name,
    w.title;


-- 2. Find all characters who appear in the Iliad

SELECT
    c.name,
    c.character_type,
    ca.role,
    ca.importance
FROM character_appearances ca
JOIN characters c
    ON ca.character_id = c.character_id
JOIN works w
    ON ca.work_id = w.work_id
WHERE w.title = 'Iliad'
ORDER BY
    ca.importance,
    c.name;


-- 3. Which characters appear in the most works?

SELECT
    c.name,
    COUNT(DISTINCT ca.work_id) AS number_of_works
FROM character_appearances ca
JOIN characters c
    ON ca.character_id = c.character_id
GROUP BY
    c.name
ORDER BY
    number_of_works DESC,
    c.name;


-- 4. Which works mention Aeneas?

SELECT
    c.name AS character_name,
    w.title AS work_title,
    a.name AS author,
    ca.role,
    ca.importance
FROM character_appearances ca
JOIN characters c
    ON ca.character_id = c.character_id
JOIN works w
    ON ca.work_id = w.work_id
LEFT JOIN authors a
    ON w.author_id = a.author_id
WHERE c.name = 'Aeneas'
ORDER BY
    w.title;


-- 5. Show character relationships with readable names

SELECT
    source.name AS source_character,
    r.relationship_type,
    target.name AS target_character,
    w.title AS source_work,
    r.notes
FROM relationships r
JOIN characters source
    ON r.source_character_id = source.character_id
JOIN characters target
    ON r.target_character_id = target.character_id
LEFT JOIN works w
    ON r.source_work_id = w.work_id
ORDER BY
    source.name,
    r.relationship_type,
    target.name;


-- 6. Find all children of Zeus

SELECT
    target.name AS child_name,
    target.character_type,
    r.notes
FROM relationships r
JOIN characters source
    ON r.source_character_id = source.character_id
JOIN characters target
    ON r.target_character_id = target.character_id
WHERE source.name = 'Zeus'
  AND r.relationship_type = 'parent_of'
ORDER BY
    target.name;


-- 7. Show all events and their main locations

SELECT
    e.event_name,
    e.event_type,
    l.name AS location_name,
    l.modern_equivalent,
    e.summary
FROM events e
LEFT JOIN locations l
    ON e.primary_location_id = l.location_id
ORDER BY
    e.event_id;


-- 8. Which characters are involved in each event?

SELECT
    e.event_name,
    c.name AS character_name,
    ec.event_role,
    ec.notes
FROM event_characters ec
JOIN events e
    ON ec.event_id = e.event_id
JOIN characters c
    ON ec.character_id = c.character_id
ORDER BY
    e.event_id,
    c.name;


-- 9. Which locations appear in the most works?

SELECT
    l.name,
    l.location_type,
    COUNT(DISTINCT wl.work_id) AS number_of_works
FROM work_locations wl
JOIN locations l
    ON wl.location_id = l.location_id
GROUP BY
    l.name,
    l.location_type
ORDER BY
    number_of_works DESC,
    l.name;


-- 10. Find mythological places only

SELECT
    name,
    location_type,
    region,
    notes
FROM locations
WHERE mythological = TRUE
ORDER BY
    name;


-- 11. Show crimes that would likely be illegal today

SELECT
    c.name AS character_name,
    e.event_name,
    cp.alleged_action,
    cp.modern_uk_equivalent,
    cp.severity_rating
FROM crimes_and_punishments cp
LEFT JOIN characters c
    ON cp.character_id = c.character_id
LEFT JOIN events e
    ON cp.event_id = e.event_id
WHERE cp.likely_illegal_today = 'TRUE'
ORDER BY
    cp.severity_rating DESC,
    c.name;


-- 12. Show legally ambiguous mythological actions

SELECT
    c.name AS character_name,
    e.event_name,
    cp.alleged_action,
    cp.modern_law_note,
    cp.notes
FROM crimes_and_punishments cp
LEFT JOIN characters c
    ON cp.character_id = c.character_id
LEFT JOIN events e
    ON cp.event_id = e.event_id
WHERE cp.likely_illegal_today = 'UNCLEAR'
ORDER BY
    cp.severity_rating DESC;


-- 13. Which characters have the highest average crime severity?

SELECT
    c.name,
    COUNT(*) AS number_of_records,
    ROUND(AVG(cp.severity_rating), 2) AS average_severity
FROM crimes_and_punishments cp
JOIN characters c
    ON cp.character_id = c.character_id
GROUP BY
    c.name
ORDER BY
    average_severity DESC,
    number_of_records DESC;


-- 14. Search character aliases

SELECT
    c.name AS main_name,
    ca.alias_name,
    ca.alias_type,
    ca.language_or_culture
FROM character_aliases ca
JOIN characters c
    ON ca.character_id = c.character_id
WHERE ca.alias_name ILIKE '%herc%'
   OR c.name ILIKE '%herc%'
ORDER BY
    c.name;


-- 15. Find source references with confidence levels

SELECT
    sr.entity_type,
    sr.entity_id,
    s.title AS source_title,
    sr.reference_note,
    sr.confidence_level
FROM source_references sr
JOIN sources s
    ON sr.source_id = s.source_id
ORDER BY
    sr.entity_type,
    sr.entity_id;
