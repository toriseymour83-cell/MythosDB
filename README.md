# MythosDB

MythosDB is a relational Greek mythology dataset designed for SQL, Power BI, Excel, Python, data modelling, and data analysis practice.

The dataset includes mythological characters, authors, works, locations, events, relationships, aliases, source references, and an optional analytical table comparing selected mythological actions with simplified modern UK legal categories.

---

## Project Purpose

The purpose of MythosDB is to provide a structured sandbox dataset that can be used to practise:

- SQL joins and queries
- Power BI modelling
- Excel analysis
- Python data exploration
- CSV handling
- data cleaning
- relationship modelling
- dashboard design
- working with uncertainty and incomplete historical data

The dataset is intended for learning, portfolio projects, teaching resources, and general data exploration.

---

## Scope and Selection Rationale

Greek mythology is a large subject with many characters, places, stories, authors, fragments, retellings, and regional variations. MythosDB is not intended to be a complete academic catalogue of every mythological source or figure.

Instead, this project is designed as a practical sandbox dataset for learning and practising data skills.

The dataset focuses on a selected set of major authors, works, characters, locations, appearances, events, and relationships. The aim is to provide enough depth and complexity to make the data useful for exploration, while keeping the project manageable and understandable.

Some authors and works have been included because they are major surviving sources for Greek mythology, including Homer, Hesiod, Euripides, Sophocles, Aeschylus, Apollodorus, Ovid, Virgil, Pausanias, and others. Roman authors are included where their works preserve, adapt, or reinterpret Greek mythological material.

Many relevant authors, fragmentary sources, local traditions, later commentators, and modern interpretations are not currently included. This is intentional at this stage. The first version of MythosDB prioritises usability, clarity, and relational structure over total coverage.

The dataset can be expanded over time, and contributions are welcome.

---

## Repository Structure

```text
MythosDB/
│
├── data/
│   ├── authors.csv
│   ├── works.csv
│   ├── characters.csv
│   ├── locations.csv
│   ├── relationships.csv
│   ├── relationship_types.csv
│   ├── character_appearances.csv
│   ├── events.csv
│   ├── event_characters.csv
│   ├── character_aliases.csv
│   ├── work_locations.csv
│   ├── sources.csv
│   ├── source_references.csv
│   └── crimes_and_punishments.csv
│
├── docs/
│   ├── data_dictionary.md
│   ├── entity_relationship_diagram.md
│   ├── csv_quality_checks.md
│   ├── sql_practice_tasks.md
│   └── powerbi_dashboard_ideas.md
│
├── sql/
│   ├── create_tables.sql
│   ├── import_scripts.sql
│   └── sample_queries.sql
│
├── CONTRIBUTING.md
└── README.md
```

---

## Data Tables

### `authors.csv`

Contains ancient authors, attributed authors, Roman authors, and later source writers included in the dataset.

Example fields:

```text
author_id
name
greek_name
birth_place
estimated_birth_year
estimated_death_year
period
primary_genre
notes
```

---

### `works.csv`

Contains texts, poems, plays, mythographic works, histories, and source collections.

Example fields:

```text
work_id
title
author_id
genre
estimated_date
language
source_culture
notes
```

---

### `characters.csv`

Contains gods, heroes, mortals, monsters, rulers, creatures, and other mythological figures.

Example fields:

```text
character_id
name
greek_name
roman_name
character_type
gender
domain
origin_location_id
notes
```

---

### `locations.csv`

Contains real, mythological, symbolic, and uncertain locations linked to characters, works, and events.

Example fields:

```text
location_id
name
modern_equivalent
location_type
mythological
latitude
longitude
region
notes
```

---

### `relationships.csv`

Contains links between mythological characters.

Example relationship types include:

```text
parent_of
child_of
sibling_of
spouse_of
ally_of
enemy_of
killed
helped
detained
associated_with
```

---

### `relationship_types.csv`

Defines the relationship categories used in `relationships.csv`.

---

### `character_appearances.csv`

Links characters to the works in which they appear.

This table supports questions such as:

- Which characters appear in the Iliad?
- Which works mention Aeneas?
- Which characters appear across multiple sources?

---

### `events.csv`

Contains major mythological events and episodes.

Examples include:

- Titanomachy
- Abduction of Persephone
- Judgement of Paris
- Fall of Troy
- Odysseus blinds Polyphemus
- Orestes avenges Agamemnon
- Theseus kills the Minotaur
- Orpheus descends to the Underworld

---

### `event_characters.csv`

Links events to the characters involved in them.

---

### `character_aliases.csv`

Stores alternative names, Roman names, Greek forms, titles, and spelling variants.

---

### `work_locations.csv`

Links works to locations.

This supports mapping and geographical analysis.

---

### `sources.csv`

Stores source records used for attribution and reference.

---

### `source_references.csv`

Links specific dataset records to source records and confidence levels.

---

### `crimes_and_punishments.csv`

An analytical extension table that records selected mythological offences, punishments, acts of revenge, divine consequences, and morally significant actions.

It also includes a simplified comparison with possible modern UK legal categories.

This table is included for data analysis and discussion purposes only. It is not legal advice.

---

## Crimes and Punishments Table

The `crimes_and_punishments.csv` table is an optional analytical extension of the main mythology dataset.

It allows users to explore questions such as:

- Which mythological characters are linked to the most serious actions?
- Which events involve revenge, abduction, killing, or unlawful punishment?
- Which actions would clearly be illegal today?
- Which actions are legally ambiguous because of consent, self-defence, war, divine intervention, or classification issues?
- Which punishments appear disproportionate by modern standards?

The `likely_illegal_today` field uses three broad values:

| Value | Meaning |
|---|---|
| TRUE | The action would likely be unlawful under modern UK law |
| FALSE | The action would likely not be criminal in itself |
| UNCLEAR | The action depends heavily on context, interpretation, or legal classification |

Some entries are deliberately uncertain. This reflects the nature of mythology, where stories often involve gods, monsters, curses, divine commands, disputed consent, magical transformations, heroic violence, and events that do not map neatly onto modern legal categories.

---

## Example Questions

MythosDB can be used to answer questions such as:

- Which characters appear in the most works?
- Which authors are linked to the most mythological works?
- Which locations appear most often?
- Which characters are connected to Zeus?
- Which events involve Athena?
- Which works are linked to Troy?
- Which mythological figures have Roman equivalents?
- Which actions in myths would likely be illegal today?
- Which relationships are family-based, conflict-based, or alliance-based?
- Which records have uncertain or disputed source information?

---

## Example SQL Query

```sql
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
```

---

## Suggested Uses

MythosDB can be used for:

- SQL practice
- Power BI dashboard building
- Excel analysis
- Python data exploration
- database modelling
- entity relationship diagram practice
- teaching examples
- portfolio projects
- data cleaning exercises
- many-to-many relationship practice

---

## Data Notes

Greek mythology contains variant traditions, uncertain dates, disputed authorship, and regional differences.

For this reason:

- some records include notes explaining uncertainty
- some source links are simplified
- some dates are approximate
- BCE years are represented using negative numbers
- mythological locations may not have coordinates
- some characters have multiple names or cultural equivalents
- some relationships depend on specific source traditions

The dataset should be treated as a structured learning resource rather than a complete academic reference work.

---

## Documentation

Additional documentation is available in the `docs` folder:

```text
docs/data_dictionary.md
docs/entity_relationship_diagram.md
docs/csv_quality_checks.md
docs/sql_practice_tasks.md
docs/powerbi_dashboard_ideas.md
```

---

## SQL Files

The `sql` folder contains:

```text
sql/create_tables.sql
sql/import_scripts.sql
sql/sample_queries.sql
```

These files can be used to create a relational database, import the CSV files, and run example queries.

---

## Contributing

Contributions are welcome.

Useful contributions include:

- additional authors and works
- additional characters
- additional locations
- additional appearances
- relationship corrections
- source references
- confidence ratings
- SQL examples
- Power BI ideas
- documentation improvements
- data quality corrections

Please see:

```text
CONTRIBUTING.md
```

---

## Limitations

MythosDB is not a complete academic database.

Known limitations include:

- not all mythological figures are included
- not all ancient works are included
- some traditions are simplified
- some source relationships are approximate
- some dates are uncertain
- some locations are symbolic or disputed
- some modern legal comparisons are simplified for analysis purposes

The project is intended to be useful, expandable, and transparent about uncertainty.

---

## Licence

Add licence information here.

Suggested options include:

- MIT Licence for code and documentation
- CC BY 4.0 for dataset content
- CC0 if the dataset is intended to be freely reused without restriction
