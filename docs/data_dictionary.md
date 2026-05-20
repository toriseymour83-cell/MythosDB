# MythosDB Data Dictionary

This document explains the tables currently included in MythosDB.

---

## data/authors.csv

Stores ancient authors, attributed authors, and later source writers used in the dataset.

| Column | Description |
|---|---|
| author_id | Unique ID for each author |
| name | Common English name |
| greek_name | Greek, Latin, or attributed name where useful |
| birth_place | Known, estimated, or traditional birthplace |
| estimated_birth_year | Approximate birth year. BCE years use negative numbers |
| estimated_death_year | Approximate death year. BCE years use negative numbers |
| period | Broad historical period |
| primary_genre | Main type of writing |
| notes | Short explanation of relevance |

---

## data/works.csv

Stores texts, plays, poems, mythographic works, and source collections.

| Column | Description |
|---|---|
| work_id | Unique ID for each work |
| title | Work title |
| author_id | Links to `authors.author_id` |
| genre | Type of work |
| estimated_date | Approximate date of composition |
| language | Original or main language |
| source_culture | Greek, Roman, or other cultural context |
| notes | Short explanation of relevance |

---

## data/characters.csv

Stores gods, heroes, mortals, monsters, creatures, rulers, and mythic figures.

| Column | Description |
|---|---|
| character_id | Unique ID for each character |
| name | Common English name |
| greek_name | Greek form or transliteration |
| roman_name | Roman equivalent where applicable |
| character_type | Broad category, such as Olympian God, Hero, Mortal, Monster |
| gender | Recorded gender in the mythological tradition |
| domain | Main area, association, or symbolic role |
| origin_location_id | Links to `locations.location_id` |
| notes | Short description |

---

## data/locations.csv

Stores real, mythological, uncertain, and traditional locations.

| Column | Description |
|---|---|
| location_id | Unique ID for each location |
| name | Location name |
| modern_equivalent | Modern location where identifiable |
| location_type | City, island, realm, mountain, region, etc. |
| mythological | TRUE if primarily mythological, FALSE if geographical |
| latitude | Latitude where known |
| longitude | Longitude where known |
| region | Broader region |
| notes | Short explanation |

---

## data/relationships.csv

Stores links between characters.

| Column | Description |
|---|---|
| relationship_id | Unique ID for each relationship |
| source_character_id | First character in the relationship |
| target_character_id | Second character in the relationship |
| relationship_type | Type of link, such as parent_of, killed, ally_of |
| source_work_id | Work used as the main source for this relationship |
| notes | Short explanation |

---

## data/relationship_types.csv

Stores controlled relationship type definitions.

| Column | Description |
|---|---|
| relationship_type_id | Unique ID |
| relationship_type | Relationship label used in `relationships.csv` |
| category | Broad group, such as Family, Conflict, Alliance |
| description | What the relationship type means |
| notes | Usage notes |

---

## data/character_appearances.csv

Links characters to works.

| Column | Description |
|---|---|
| appearance_id | Unique ID |
| character_id | Links to `characters.character_id` |
| work_id | Links to `works.work_id` |
| role | Character role in that work |
| importance | Major, Minor, or Mentioned |
| notes | Short explanation |

---

## data/events.csv

Stores major mythological events and episodes.

| Column | Description |
|---|---|
| event_id | Unique ID |
| event_name | Name of event |
| event_type | Broad event category |
| primary_location_id | Links to `locations.location_id` |
| estimated_period | Mythic age, historical period, or approximate date |
| source_work_id | Main source work |
| summary | Short summary |
| notes | Additional detail |

---

## data/event_characters.csv

Links events to characters.

| Column | Description |
|---|---|
| event_character_id | Unique ID |
| event_id | Links to `events.event_id` |
| character_id | Links to `characters.character_id` |
| event_role | Character role in the event |
| notes | Short explanation |

---

## data/work_locations.csv

Links works to locations.

| Column | Description |
|---|---|
| work_location_id | Unique ID |
| work_id | Links to `works.work_id` |
| location_id | Links to `locations.location_id` |
| location_role | How the location functions in the work |
| notes | Short explanation |

---

## data/character_aliases.csv

Stores alternative names, Roman names, titles, and spelling variants.

| Column | Description |
|---|---|
| alias_id | Unique ID |
| character_id | Links to `characters.character_id` |
| alias_name | Alternative name |
| alias_type | Roman name, Greek form, title, epithet, etc. |
| language_or_culture | Language or cultural context |
| notes | Short explanation |

---

## data/sources.csv

Stores source records used for attribution and checking.

| Column | Description |
|---|---|
| source_id | Unique ID |
| source_type | Ancient text, modern reference, repository, etc. |
| title | Source title |
| author_id | Links to `authors.author_id`, where applicable |
| work_id | Links to `works.work_id`, where applicable |
| language | Source language |
| source_culture | Source cultural context |
| reliability_note | Broad reliability or source note |
| notes | Additional detail |

---

## data/source_references.csv

Links specific records back to source records.

| Column | Description |
|---|---|
| reference_id | Unique ID |
| entity_type | Table/entity type, such as character, event, location, relationship |
| entity_id | ID of the relevant entity |
| source_id | Links to `sources.source_id` |
| reference_note | Explanation of source link |
| confidence_level | High, Medium, Low, or Disputed |

---

## Notes on Uncertainty

Greek mythology contains variant traditions, disputed authorship, uncertain dates, and regional differences. The dataset uses notes and confidence fields to make uncertainty visible rather than pretending every detail is fixed.
