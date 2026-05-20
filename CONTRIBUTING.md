# Contributing to MythosDB

Thank you for considering a contribution to MythosDB.

MythosDB is a Greek mythology sandbox dataset designed for SQL, Power BI, Excel, Python, data modelling, and general data exploration practice.

The project is intentionally expandable. Greek mythology is a large and complex subject with variant traditions, disputed authorship, uncertain dates, and regional differences. Contributions are welcome where they improve the accuracy, usefulness, structure, or clarity of the dataset.

---

## What You Can Contribute

Useful contributions include:

- new characters
- new authors
- new works
- new locations
- new character appearances
- new relationships
- new events
- new source references
- corrections to existing records
- additional aliases or spelling variants
- improvements to documentation
- SQL queries or practice tasks
- Power BI dashboard ideas
- source notes and confidence ratings

---

## Before Adding Data

Please check whether the record already exists.

Before adding a new character, check:

```text
data/characters.csv
```

Before adding a new location, check:

```text
data/locations.csv
```

Before adding a new work, check:

```text
data/works.csv
```

This helps avoid duplicate records.

---

## CSV Formatting Rules

Please keep CSV files clean and consistent.

### Use the Existing Columns

Do not rename columns unless there is a clear reason.

Use existing formats such as:

```text
character_id
work_id
location_id
event_id
```

Avoid changing these to inconsistent alternatives such as:

```text
CharacterID
character number
id_of_character
```

### Quote Fields That Contain Commas

If a field contains a comma, wrap the whole field in quotation marks.

Correct:

```csv
1,Homer,"Traditional author of the Iliad, Odyssey, and related works"
```

Incorrect:

```csv
1,Homer,Traditional author of the Iliad, Odyssey, and related works
```

### Use Consistent TRUE/FALSE Values

For Boolean fields, use:

```text
TRUE
FALSE
```

### Use Negative Numbers for BCE Years

Examples:

```text
-800 = 800 BCE
-43 = 43 BCE
17 = 17 CE
```

---

## ID Rules

Each table uses ID fields to support joins across the dataset.

Before adding a new record:

1. Check the existing highest ID in the file.
2. Use the next available ID.
3. Do not reuse an existing ID.
4. Make sure any linked IDs already exist in the relevant parent table.

Example:

```csv
character_id,name,origin_location_id
46,Odysseus,3
```

The `origin_location_id` value must exist in:

```text
data/locations.csv
```

---

## Source and Confidence Notes

Greek mythology often has multiple versions of the same story.

Where possible, include:

- source work
- author
- confidence level
- note if the tradition is disputed
- note if the attribution is uncertain

Use `source_references.csv` where a record needs to be linked clearly to a source.

Confidence levels can be:

```text
High
Medium
Low
Disputed
```

---

## Relationship Guidelines

The `relationships.csv` file links one character to another.

Examples:

```text
Zeus parent_of Athena
Athena ally_of Odysseus
Achilles killed Hector
```

Where possible, use an existing relationship type from:

```text
data/relationship_types.csv
```

If a new relationship type is needed, add it to `relationship_types.csv` first.

---

## Handling Variant Myths

Variant myths are welcome, but uncertainty should be made visible.

For example, if one version says a character was abducted and another suggests they left willingly, explain that in the notes.

Example:

```text
Traditions vary over whether Helen was abducted, persuaded, or willingly left Sparta.
```

Do not force uncertain myths into one fixed interpretation if the tradition is disputed.

---

## Crimes and Punishments Table

The `crimes_and_punishments.csv` table is an analytical extension that compares mythological actions with possible modern UK legal categories.

This table is not legal advice.

When adding to this file:

- use careful wording
- use `TRUE`, `FALSE`, or `UNCLEAR` for `likely_illegal_today`
- explain uncertainty in `modern_law_note`
- avoid claiming legal certainty where context matters
- keep the comparison simplified and suitable for data analysis

---

## Documentation Contributions

Documentation improvements are welcome.

Useful documentation updates include:

- clearer table descriptions
- extra SQL examples
- Power BI modelling notes
- data quality guidance
- source explanation
- schema diagrams
- known limitations
- examples of how to use the dataset

---

## Suggested Workflow

1. Check the existing file.
2. Add the new record.
3. Make sure the ID is unique.
4. Check that linked IDs exist.
5. Check commas and quotation marks.
6. Preview the CSV in GitHub.
7. Add a clear commit message.

---

## Suggested Commit Messages

Examples:

```text
Add new character records
```

```text
Fix relationship source notes
```

```text
Add Odyssey location references
```

```text
Correct CSV formatting issue
```

```text
Add source references for Medea
```

---

## Project Tone

MythosDB should be:

- useful
- clear
- expandable
- honest about uncertainty
- suitable for data practice
- accessible to people learning SQL, Power BI, Excel, Python, and data modelling

The aim is not to create a complete academic database. The aim is to create a practical and interesting dataset that helps people practise data skills while exploring mythology.
