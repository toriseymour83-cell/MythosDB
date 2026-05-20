# MythosDB

A relational mythology dataset designed for SQL, Power BI, Excel, Python, and data modelling practice.

The aim is to create a sandbox dataset based on Greek mythology, historical texts, locations, authors, and relationships between mythological figures.

---

## Project Goals

MythosDB should:

- Be fun to explore
- Include messy real-world style data
- Support SQL joins and relationship modelling
- Work well in Power BI
- Allow timeline, map, and network analysis
- Include source references and uncertainty
- Be expandable over time

---

## Proposed Folder Structure

```text
MythosDB/
│
├── data/
│   ├── authors.csv
│   ├── works.csv
│   ├── characters.csv
│   ├── locations.csv
│   ├── relationships.csv
│   ├── character_appearances.csv
│   ├── events.csv
│   └── sources.csv
│
├── sql/
│   ├── create_tables.sql
│   ├── sample_queries.sql
│   └── import_scripts.sql
│
├── powerbi/
│   └── MythosDB.pbix
│
├── docs/
│   ├── schema_diagram.png
│   └── data_dictionary.md
│
└── README.md
```

---

## Core Tables

### authors.csv

| Column | Description |
|---|---|
| author_id | Unique ID |
| name | Author name |
| greek_name | Original Greek form if known |
| birth_place | Place of birth |
| estimated_birth_year | Approximate year |
| estimated_death_year | Approximate year |
| notes | Additional information |

#### Example Rows

```csv
author_id,name,greek_name,birth_place,estimated_birth_year,estimated_death_year,notes
1,Homer,Homeros,Ionia,-800,-701,Traditional author of Iliad and Odyssey
2,Herodotus,Herodotos,Halicarnassus,-484,-425,Known as the Father of History
3,Hesiod,Hesiodos,Ascra,-750,-650,Author of Theogony and Works and Days
```

---

### works.csv

| Column | Description |
|---|---|
| work_id | Unique ID |
| title | Name of work |
| author_id | Linked author |
| genre | Epic poem/history/play |
| estimated_date | Approximate date |
| language | Original language |
| summary | Short description |

#### Example Rows

```csv
work_id,title,author_id,genre,estimated_date,language,summary
1,Iliad,1,Epic Poem,c.8th century BCE,Greek,Trojan War narrative
2,Odyssey,1,Epic Poem,c.8th century BCE,Greek,Odysseus journey home
3,The Histories,2,History,c.440 BCE,Greek,Historical investigation and accounts
4,Theogony,3,Poetry,c.700 BCE,Greek,Origins of the gods
```

---

### characters.csv

| Column | Description |
|---|---|
| character_id | Unique ID |
| name | Common name |
| greek_name | Greek version |
| roman_name | Roman equivalent |
| type | God/hero/mortal/monster |
| gender | Gender |
| domain | Associated area/power |
| origin_location_id | Linked location |
| notes | Additional details |

#### Example Rows

```csv
character_id,name,greek_name,roman_name,type,gender,domain,origin_location_id,notes
1,Zeus,Zeus,Jupiter,Olympian God,Male,Sky and Thunder,1,King of the gods
2,Athena,Athena,Minerva,Olympian Goddess,Female,Wisdom and War,1,Born from Zeus head
3,Aeneas,Aineias,,Hero,Male,Trojan Hero,2,Survivor of Troy
4,Odysseus,Odysseus,Ulysses,Hero,Male,Cunning and Strategy,3,King of Ithaca
```

---

### locations.csv

| Column | Description |
|---|---|
| location_id | Unique ID |
| name | Location name |
| modern_equivalent | Modern place |
| type | City/island/mountain/realm |
| mythological | TRUE/FALSE |
| latitude | Latitude if known |
| longitude | Longitude if known |
| notes | Additional info |

#### Example Rows

```csv
location_id,name,modern_equivalent,type,mythological,latitude,longitude,notes
1,Mount Olympus,Greece,Mountain,FALSE,40.0856,22.3589,Home of the Olympian gods
2,Troy,Hisarlik Turkey,City,FALSE,39.9578,26.2389,Site associated with Trojan War
3,Ithaca,Greece,Island,FALSE,38.3674,20.7200,Kingdom of Odysseus
4,Underworld,,Realm,TRUE,,,Realm of the dead
```

---

### character_appearances.csv

| Column | Description |
|---|---|
| appearance_id | Unique ID |
| character_id | Linked character |
| work_id | Linked work |
| role | Character role in work |
| importance | Major/minor/mentioned |
| notes | Additional details |

#### Example Rows

```csv
appearance_id,character_id,work_id,role,importance,notes
1,3,1,Trojan Hero,Major,Appears defending Troy
2,3,2,Referenced Survivor,Minor,Mentioned after fall of Troy
3,4,2,Main Protagonist,Major,Journey home after Trojan War
```

---

### relationships.csv

| Column | Description |
|---|---|
| relationship_id | Unique ID |
| source_character_id | Origin character |
| target_character_id | Related character |
| relationship_type | parent_of/enemy_of/ally_of/etc |
| source_work_id | Source work |
| notes | Additional details |

#### Example Rows

```csv
relationship_id,source_character_id,target_character_id,relationship_type,source_work_id,notes
1,1,2,parent_of,4,Zeus is father of Athena
2,2,4,ally_of,2,Athena assists Odysseus
3,3,4,enemy_of,1,Fought on opposing sides of Trojan War
```

---

## Suggested Next Steps

### Phase 1

Build starter datasets:

- 25 authors
- 50 works
- 150 characters
- 50 locations
- 500 relationships
- 400 appearance records

### Phase 2

Create:

- SQL database schema
- PostgreSQL import scripts
- Power BI model
- Entity relationship diagram
- Sample SQL exercises

### Phase 3

Optional advanced features:

- Timeline analysis
- Character network graphs
- Interactive mythology maps
- Roman vs Greek comparisons
- Alternate myth versions
- Confidence/uncertainty scoring
- Natural language search

---

## Potential GitHub Name

- MythosDB
- OlympusDB
- HellenicGraph
- PantheonData
- OdysseyDB

---

## Example SQL Questions

```sql
-- Which characters appear in the most works?

SELECT
    c.name,
    COUNT(*) AS appearances
FROM character_appearances ca
JOIN characters c
    ON ca.character_id = c.character_id
GROUP BY c.name
ORDER BY appearances DESC;
```

```sql
-- Which works mention Aeneas?

SELECT
    w.title,
    a.name AS author
FROM character_appearances ca
JOIN works w
    ON ca.work_id = w.work_id
LEFT JOIN authors a
    ON w.author_id = a.author_id
JOIN characters c
    ON ca.character_id = c.character_id
WHERE c.name = 'Aeneas';
```

---

## Long-Term Vision

A public mythology sandbox dataset designed for:

- SQL learners
- Power BI learners
- teachers
- students
- historians
- mythology enthusiasts
- portfolio projects
- data modelling practice

The dataset should feel realistic, interconnected, and slightly messy, similar to real-world analytical datasets.

## Scope and Selection Rationale

Greek mythology is a vast subject with thousands of characters, places, stories, authors, fragments, retellings, and regional variations. MythosDB is not intended to be a complete academic catalogue of every mythological source or figure.

Instead, this project is designed as a practical, enjoyable sandbox dataset for learning and practising data skills such as SQL, Power BI, Excel, Python, data cleaning, relationship modelling, and dashboard building.

For that reason, the dataset focuses on a selected set of major authors, works, characters, locations, appearances, and relationships. The aim is to provide enough depth and complexity to make the data interesting to explore, without making the project impossible to build, maintain, or understand.

Some authors and works have been included because they are major surviving sources for Greek mythology, such as Homer, Hesiod, Euripides, Sophocles, Apollodorus, Ovid, Virgil, Pausanias, and others. Roman authors are included where their works preserve or reinterpret Greek mythological material.

Many relevant authors, fragmentary sources, local traditions, later commentators, and modern interpretations are not currently included. This is intentional at this stage. The first version of MythosDB prioritises usability, clarity, and relational structure over total coverage.

The dataset can be expanded over time, and contributions are welcome. Suggested additions include:

- additional ancient authors and texts
- missing mythological characters
- variant versions of myths
- extra locations and modern equivalents
- source references
- confidence ratings for disputed information
- relationship corrections or additions
- alternative Greek, Latin, and English names

MythosDB should be treated as a living dataset: useful for practice, interesting for exploration, and open to improvement.
