# MythosDB SQL Practice Tasks

These tasks are designed for practising SQL with the MythosDB dataset.

---

## Beginner Tasks

### 1. View all characters

```sql
SELECT *
FROM characters;
2. Find all Olympian gods
SELECT
    name,
    roman_name,
    domain
FROM characters
WHERE character_type LIKE '%Olympian%';
3. Find all works written by Homer
SELECT
    w.title,
    w.genre,
    w.estimated_date
FROM works w
JOIN authors a
    ON w.author_id = a.author_id
WHERE a.name = 'Homer';
4. Find all mythological locations
SELECT
    name,
    location_type,
    notes
FROM locations
WHERE mythological = TRUE;
Join Practice
5. Show works with author names
SELECT
    w.title,
    a.name AS author,
    w.genre
FROM works w
LEFT JOIN authors a
    ON w.author_id = a.author_id;
6. Show characters and their origin locations
SELECT
    c.name AS character_name,
    c.character_type,
    l.name AS origin_location,
    l.region
FROM characters c
LEFT JOIN locations l
    ON c.origin_location_id = l.location_id;
7. Show character appearances by work
SELECT
    w.title AS work_title,
    c.name AS character_name,
    ca.role,
    ca.importance
FROM character_appearances ca
JOIN characters c
    ON ca.character_id = c.character_id
JOIN works w
    ON ca.work_id = w.work_id
ORDER BY
    w.title,
    c.name;
Aggregation Practice
8. Count characters by type
SELECT
    character_type,
    COUNT(*) AS character_count
FROM characters
GROUP BY character_type
ORDER BY character_count DESC;
9. Count works by genre
SELECT
    genre,
    COUNT(*) AS work_count
FROM works
GROUP BY genre
ORDER BY work_count DESC;
10. Count appearances per character
SELECT
    c.name,
    COUNT(ca.appearance_id) AS appearance_count
FROM characters c
LEFT JOIN character_appearances ca
    ON c.character_id = ca.character_id
GROUP BY c.name
ORDER BY appearance_count DESC;
Relationship Practice
11. Find Zeus's children
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
  AND r.relationship_type = 'parent_of';
12. Find all killings recorded in relationships
SELECT
    source.name AS killer,
    target.name AS victim,
    w.title AS source_work,
    r.notes
FROM relationships r
JOIN characters source
    ON r.source_character_id = source.character_id
JOIN characters target
    ON r.target_character_id = target.character_id
LEFT JOIN works w
    ON r.source_work_id = w.work_id
WHERE r.relationship_type = 'killed';
13. Find all enemies
SELECT
    source.name AS character_one,
    target.name AS character_two,
    r.notes
FROM relationships r
JOIN characters source
    ON r.source_character_id = source.character_id
JOIN characters target
    ON r.target_character_id = target.character_id
WHERE r.relationship_type = 'enemy_of';
Events Practice
14. Show events with locations and source works
SELECT
    e.event_name,
    e.event_type,
    l.name AS location_name,
    w.title AS source_work
FROM events e
LEFT JOIN locations l
    ON e.primary_location_id = l.location_id
LEFT JOIN works w
    ON e.source_work_id = w.work_id;
15. Find all characters involved in the Trojan War events
SELECT
    e.event_name,
    c.name AS character_name,
    ec.event_role
FROM event_characters ec
JOIN events e
    ON ec.event_id = e.event_id
JOIN characters c
    ON ec.character_id = c.character_id
WHERE e.event_type LIKE '%Trojan War%'
ORDER BY
    e.event_name,
    c.name;
Crimes and Punishments Practice
16. Find actions likely illegal today
SELECT
    c.name,
    cp.alleged_action,
    cp.modern_uk_equivalent,
    cp.severity_rating
FROM crimes_and_punishments cp
LEFT JOIN characters c
    ON cp.character_id = c.character_id
WHERE cp.likely_illegal_today = 'TRUE'
ORDER BY cp.severity_rating DESC;
17. Find legally unclear cases
SELECT
    c.name,
    cp.alleged_action,
    cp.modern_law_note
FROM crimes_and_punishments cp
LEFT JOIN characters c
    ON cp.character_id = c.character_id
WHERE cp.likely_illegal_today = 'UNCLEAR';
18. Average severity by character
SELECT
    c.name,
    ROUND(AVG(cp.severity_rating), 2) AS average_severity,
    COUNT(*) AS record_count
FROM crimes_and_punishments cp
JOIN characters c
    ON cp.character_id = c.character_id
GROUP BY c.name
ORDER BY average_severity DESC;
Challenge Tasks
19. Which works have the most character appearances?
SELECT
    w.title,
    COUNT(ca.appearance_id) AS appearance_count
FROM works w
LEFT JOIN character_appearances ca
    ON w.work_id = ca.work_id
GROUP BY w.title
ORDER BY appearance_count DESC;
20. Which locations are linked to the most works?
SELECT
    l.name,
    COUNT(wl.work_id) AS work_count
FROM locations l
LEFT JOIN work_locations wl
    ON l.location_id = wl.location_id
GROUP BY l.name
ORDER BY work_count DESC;
21. Find characters who have aliases
SELECT
    c.name,
    ca.alias_name,
    ca.alias_type,
    ca.language_or_culture
FROM character_aliases ca
JOIN characters c
    ON ca.character_id = c.character_id
ORDER BY c.name;
22. Find characters who are both in events and crimes
SELECT DISTINCT
    c.name
FROM characters c
JOIN event_characters ec
    ON c.character_id = ec.character_id
JOIN crimes_and_punishments cp
    ON c.character_id = cp.character_id
ORDER BY c.name;
Extra Challenge

Write your own query to answer:

Which mythological figure causes the most trouble?

You will need to decide what “trouble” means.

Possible options:

number of crimes
severity rating
number of enemies
number of events
number of punishments
number of relationships involving conflict

This is deliberately open-ended, because real analysis often starts with a vague question and a suspicious spreadsheet.
