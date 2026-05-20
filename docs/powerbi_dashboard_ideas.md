# MythosDB Power BI Dashboard Ideas

This page suggests possible Power BI dashboard pages using the MythosDB dataset.

---

## Page 1: Mythology Overview

Suggested visuals:

- Total characters
- Total works
- Total authors
- Total locations
- Total events
- Character count by type
- Works by genre
- Characters by gender
- Mythological vs real locations

Possible slicers:

- Character type
- Gender
- Source culture
- Genre
- Mythological location TRUE/FALSE

---

## Page 2: Character Explorer

Purpose: explore individual gods, heroes, mortals, monsters, and other figures.

Suggested visuals:

- Character table
- Character aliases
- Character appearances by work
- Relationship network-style table
- Events involving selected character
- Crimes and punishments involving selected character

Useful fields:

- characters.name
- characters.character_type
- characters.domain
- character_aliases.alias_name
- character_appearances.role
- relationships.relationship_type
- events.event_name

Example questions:

- Which works does Athena appear in?
- Who is connected to Zeus?
- Which characters have Roman names?
- Which characters are linked to the most events?

---

## Page 3: Works and Authors

Purpose: explore source texts and their authors.

Suggested visuals:

- Works by author
- Works by genre
- Works by estimated date
- Character appearances per work
- Locations per work
- Source culture comparison

Example questions:

- Which author has the most works in the dataset?
- Which works include the most characters?
- Which works are Greek and which are Roman?
- Which works have the most geographical links?

---

## Page 4: Mythological Map

Purpose: explore locations in mythology.

Suggested visuals:

- Map of real-world locations
- Table of mythological realms
- Location count by region
- Works linked to selected location
- Events linked to selected location
- Characters originating from selected location

Important note:

Some locations are mythological, uncertain, or symbolic. These may not have latitude and longitude values.

Suggested filter:

```text
locations.mythological = FALSE
